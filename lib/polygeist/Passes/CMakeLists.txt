corrosion_import_crate(MANIFEST_PATH ../../../include/polygeist/polyegg/Cargo.toml)
corrosion_add_cxxbridge(cxxbridge-cpp CRATE polyegg MANIFEST_PATH ../../../include/polygeist/polyegg FILES polyegg.rs)

add_mlir_dialect_library(MLIRPolygeistTransforms
  ConvertToOpaquePtr.cpp
  AffineCFG.cpp
  AffineReduction.cpp
  CanonicalizeFor.cpp
  LoopRestructure.cpp
  PolygeistMem2Reg.cpp
  PolygeistCanonicalize.cpp
  ParallelLoopDistribute.cpp
  ParallelLICM.cpp
  OpenMPOpt.cpp
  BarrierRemovalContinuation.cpp
  RaiseToAffine.cpp
  ParallelLower.cpp
  TrivialUse.cpp
  ConvertPolygeistToLLVM.cpp
  InnerSerialization.cpp
  ForBreakToWhile.cpp
  ConvertParallelToGPU.cpp
  SerializeToCubin.cpp
  SerializeToHsaco.cpp
  ParallelLoopUnroll.cpp
  LowerAlternatives.cpp
  CollectKernelStatistics.cpp
  PolyEgg.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Dialect/Affine

  DEPENDS
  MLIRPolygeistOpsIncGen
  MLIRPolygeistPassIncGen

  LINK_LIBS PUBLIC
  MLIRAffineDialect
  MLIRArithDialect
  MLIRAsyncDialect
  MLIRAffineUtils
  MLIRFuncDialect
  MLIRFuncTransforms
  MLIRGPUToGPURuntimeTransforms
  MLIRGPUTransforms
  MLIRGPUToNVVMTransforms
  MLIRIR
  MLIRLLVMDialect
  MLIRMathDialect
  MLIRMathToLLVM
  MLIRMemRefDialect
  MLIRNVVMDialect
  MLIRPass
  MLIRPolygeist
  MLIRSideEffectInterfaces
  MLIRSCFToControlFlow
  MLIRTargetLLVMIRImport
  MLIRTransformUtils
  MLIRGPUToROCDLTransforms
  MLIRControlFlowToLLVM
  MLIRMemRefToLLVM
  MLIRFuncToLLVM
  MLIRArithToLLVM
  MLIROpenMPToLLVM
  )

target_link_libraries(MLIRPolygeistTransforms PUBLIC cxxbridge-cpp)

if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
  if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS 9)
    target_link_libraries(MLIRPolygeistTransforms PUBLIC stdc++fs)
  endif()
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS 7)
    target_link_libraries(MLIRPolygeistTransforms PUBLIC c++experimental)
  elseif(CMAKE_CXX_COMPILER_VERSION VERSION_LESS 9)
    target_link_libraries(MLIRPolygeistTransforms PUBLIC c++fs)
  endif()
endif()

target_compile_definitions(obj.MLIRPolygeistTransforms
  PRIVATE
  POLYGEIST_PGO_DEFAULT_DATA_DIR="${POLYGEIST_PGO_DEFAULT_DATA_DIR}"
  POLYGEIST_PGO_ALTERNATIVE_ENV_VAR="${POLYGEIST_PGO_ALTERNATIVE_ENV_VAR}"
  POLYGEIST_PGO_DATA_DIR_ENV_VAR="${POLYGEIST_PGO_DATA_DIR_ENV_VAR}"
)

if(POLYGEIST_ENABLE_CUDA)
  find_package(CUDA)
  enable_language(CUDA)

  # Enable gpu-to-cubin pass.
  target_compile_definitions(obj.MLIRPolygeistTransforms
    PRIVATE
    POLYGEIST_ENABLE_CUDA=1
  )

  # Add CUDA headers includes and the libcuda.so library.
  target_include_directories(obj.MLIRPolygeistTransforms
    PRIVATE
    ${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES}
  )

  find_library(CUDA_DRIVER_LIBRARY cuda)

  target_link_libraries(MLIRPolygeistTransforms
    PRIVATE
    ${CUDA_DRIVER_LIBRARY}
  )

endif()
if(POLYGEIST_ENABLE_ROCM)
  target_compile_definitions(obj.MLIRPolygeistTransforms
    PRIVATE
    POLYGEIST_ENABLE_ROCM=1
    __HIP_PLATFORM_AMD__
  )

  if (NOT DEFINED ROCM_PATH)
    if (NOT DEFINED ENV{ROCM_PATH})
      set(ROCM_PATH "/opt/rocm" CACHE PATH "Path to which ROCm has been installed")
    else()
      set(ROCM_PATH $ENV{ROCM_PATH} CACHE PATH "Path to which ROCm has been installed")
    endif()
  endif()
  list(APPEND CMAKE_PREFIX_PATH ${ROCM_PATH} "${ROCM_PATH}/hip")
  find_package(hip REQUIRED)

  # there should be some variable for this
  target_include_directories(obj.MLIRPolygeistTransforms
    PRIVATE
    ${ROCM_PATH}/include
  )

  target_link_libraries(MLIRPolygeistTransforms
    PRIVATE
    hip::host
  )

endif()
