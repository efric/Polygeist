#map0 = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 * 32)>
#map2 = affine_map<(d0, d1) -> (1199, d0 * 32 + 32, d1 * 32 + 31)>
#map3 = affine_map<(d0, d1) -> (d0 * 32, d1 + 1)>
#map4 = affine_map<(d0) -> (1200, d0 * 32 + 32)>
#map5 = affine_map<(d0) -> (1000, d0 * 32 + 32)>
#map6 = affine_map<(d0) -> ((d0 - 30) ceildiv 32)>
#map7 = affine_map<()[s0] -> ((s0 - 2) floordiv 32 + 1)>
#map8 = affine_map<()[s0] -> ((s0 - 1) floordiv 32 + 1)>
#map9 = affine_map<(d0, d1)[s0] -> (s0 - 1, d0 * 32 + 32, d1 * 32 + 31)>
#map10 = affine_map<(d0)[s0] -> (s0, d0 * 32 + 32)>
#map11 = affine_map<()[s0] -> (s0 - 1)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu"}  {
  llvm.mlir.global internal constant @str7("==END   DUMP_ARRAYS==\0A\00")
  llvm.mlir.global internal constant @str6("Q\00")
  llvm.mlir.global internal constant @str5("\0Aend   dump: %s\0A\00")
  llvm.mlir.global internal constant @str4("%0.2lf \00")
  llvm.mlir.global internal constant @str3("\0A\00")
  llvm.mlir.global internal constant @str2("R\00")
  llvm.mlir.global internal constant @str1("begin dump: %s\00")
  llvm.mlir.global internal constant @str0("==BEGIN DUMP_ARRAYS==\0A\00")
  llvm.mlir.global external @stderr() : !llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>
  llvm.func @fprintf(!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, ...) -> !llvm.i32
  func @main(%arg0: i32, %arg1: !llvm.ptr<ptr<i8>>) -> i32 {
    %c1000_i32 = constant 1000 : i32
    %c1200_i32 = constant 1200 : i32
    %c0_i32 = constant 0 : i32
    %c100_i32 = constant 100 : i32
    %c10_i32 = constant 10 : i32
    %c1_i32 = constant 1 : i32
    %cst = constant 0.000000e+00 : f64
    %c1199 = constant 1199 : index
    %c1200 = constant 1200 : index
    %0 = alloc() : memref<1000x1200xf64>
    %1 = alloc() : memref<1200x1200xf64>
    %2 = alloc() : memref<1000x1200xf64>
    br ^bb1(%c0_i32 : i32)
  ^bb1(%3: i32):  // 2 preds: ^bb0, ^bb4
    %4 = cmpi "slt", %3, %c1000_i32 : i32
    %5 = index_cast %3 : i32 to index
    cond_br %4, ^bb2(%c0_i32 : i32), ^bb5(%c0_i32 : i32)
  ^bb2(%6: i32):  // 2 preds: ^bb1, ^bb3
    %7 = cmpi "slt", %6, %c1200_i32 : i32
    %8 = index_cast %6 : i32 to index
    cond_br %7, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %9 = muli %3, %6 : i32
    %10 = remi_signed %9, %c1000_i32 : i32
    %11 = sitofp %10 : i32 to f64
    %12 = sitofp %c1000_i32 : i32 to f64
    %13 = divf %11, %12 : f64
    %14 = sitofp %c100_i32 : i32 to f64
    %15 = mulf %13, %14 : f64
    %16 = sitofp %c10_i32 : i32 to f64
    %17 = addf %15, %16 : f64
    store %17, %0[%5, %8] : memref<1000x1200xf64>
    store %cst, %2[%5, %8] : memref<1000x1200xf64>
    %18 = addi %6, %c1_i32 : i32
    br ^bb2(%18 : i32)
  ^bb4:  // pred: ^bb2
    %19 = addi %3, %c1_i32 : i32
    br ^bb1(%19 : i32)
  ^bb5(%20: i32):  // 2 preds: ^bb1, ^bb9
    %21 = cmpi "slt", %20, %c1200_i32 : i32
    %22 = index_cast %20 : i32 to index
    cond_br %21, ^bb7(%c0_i32 : i32), ^bb6
  ^bb6:  // pred: ^bb5
    %23 = alloca() : memref<1xf64>
    affine.for %arg2 = 0 to 38 {
      affine.for %arg3 = #map0(%arg2) to 38 {
        affine.for %arg4 = #map1(%arg2) to min #map2(%arg2, %arg3) {
          affine.for %arg5 = max #map3(%arg3, %arg4) to min #map4(%arg3) {
            call @S4(%1, %arg4, %arg5) : (memref<1200x1200xf64>, index, index) -> ()
          }
        }
      }
    }
    affine.for %arg2 = 0 to 1199 {
      call @S0(%23) : (memref<1xf64>) -> ()
      affine.for %arg3 = 0 to 1000 {
        call @S1(%23, %0, %arg2, %arg3) : (memref<1xf64>, memref<1000x1200xf64>, index, index) -> ()
      }
      call @S2(%1, %arg2, %23) : (memref<1200x1200xf64>, index, memref<1xf64>) -> ()
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = #map1(%arg3) to min #map5(%arg3) {
          call @S3(%2, %arg2, %arg4, %1, %0) : (memref<1000x1200xf64>, index, index, memref<1200x1200xf64>, memref<1000x1200xf64>) -> ()
        }
      }
      affine.for %arg3 = #map6(%arg2) to 38 {
        affine.for %arg4 = 0 to 32 {
          affine.for %arg5 = max #map3(%arg2, %arg3) to min #map4(%arg3) {
            affine.for %arg6 = #map1(%arg4) to min #map5(%arg4) {
              call @S5(%1, %arg2, %arg5, %0, %arg6, %2) : (memref<1200x1200xf64>, index, index, memref<1000x1200xf64>, index, memref<1000x1200xf64>) -> ()
            }
          }
        }
        affine.for %arg4 = 0 to 32 {
          affine.for %arg5 = max #map3(%arg2, %arg3) to min #map4(%arg3) {
            affine.for %arg6 = #map1(%arg4) to min #map5(%arg4) {
              call @S6(%0, %arg2, %arg5, %1, %arg6, %2) : (memref<1000x1200xf64>, index, index, memref<1200x1200xf64>, index, memref<1000x1200xf64>) -> ()
            }
          }
        }
      }
    }
    affine.store %cst, %23[0] : memref<1xf64>
    affine.for %arg2 = 0 to 1000 {
      call @S1(%23, %0, %c1199, %arg2) : (memref<1xf64>, memref<1000x1200xf64>, index, index) -> ()
    }
    %24 = affine.load %23[0] : memref<1xf64>
    %25 = sqrt %24 : f64
    affine.store %25, %1[symbol(%c1200) - 1, symbol(%c1200) - 1] : memref<1200x1200xf64>
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = #map1(%arg2) to min #map5(%arg2) {
        call @S3(%2, %c1199, %arg3, %1, %0) : (memref<1000x1200xf64>, index, index, memref<1200x1200xf64>, memref<1000x1200xf64>) -> ()
      }
    }
    call @print_array(%c1000_i32, %c1200_i32, %0, %1, %2) : (i32, i32, memref<1000x1200xf64>, memref<1200x1200xf64>, memref<1000x1200xf64>) -> ()
    return %c0_i32 : i32
  ^bb7(%26: i32):  // 2 preds: ^bb5, ^bb8
    %27 = cmpi "slt", %26, %c1200_i32 : i32
    %28 = index_cast %26 : i32 to index
    cond_br %27, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    store %cst, %1[%22, %28] : memref<1200x1200xf64>
    %29 = addi %26, %c1_i32 : i32
    br ^bb7(%29 : i32)
  ^bb9:  // pred: ^bb7
    %30 = addi %20, %c1_i32 : i32
    br ^bb5(%30 : i32)
  }
  func private @print_array(%arg0: i32, %arg1: i32, %arg2: memref<1000x1200xf64>, %arg3: memref<1200x1200xf64>, %arg4: memref<1000x1200xf64>) {
    %c0_i32 = constant 0 : i32
    %c20_i32 = constant 20 : i32
    %c1_i32 = constant 1 : i32
    %0 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %1 = llvm.load %0 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %2 = llvm.mlir.addressof @str0 : !llvm.ptr<array<23 x i8>>
    %3 = llvm.mlir.constant(0 : index) : !llvm.i64
    %4 = llvm.getelementptr %2[%3, %3] : (!llvm.ptr<array<23 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %5 = llvm.call @fprintf(%1, %4) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>) -> !llvm.i32
    %6 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %7 = llvm.load %6 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr<array<15 x i8>>
    %9 = llvm.getelementptr %8[%3, %3] : (!llvm.ptr<array<15 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %10 = llvm.mlir.addressof @str2 : !llvm.ptr<array<2 x i8>>
    %11 = llvm.getelementptr %10[%3, %3] : (!llvm.ptr<array<2 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %12 = llvm.call @fprintf(%7, %9, %11) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.ptr<i8>) -> !llvm.i32
    br ^bb1(%c0_i32 : i32)
  ^bb1(%13: i32):  // 2 preds: ^bb0, ^bb5
    %14 = cmpi "slt", %13, %arg1 : i32
    %15 = index_cast %13 : i32 to index
    cond_br %14, ^bb3(%c0_i32 : i32), ^bb2
  ^bb2:  // pred: ^bb1
    %16 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %17 = llvm.load %16 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %18 = llvm.mlir.addressof @str5 : !llvm.ptr<array<17 x i8>>
    %19 = llvm.getelementptr %18[%3, %3] : (!llvm.ptr<array<17 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %20 = llvm.mlir.addressof @str2 : !llvm.ptr<array<2 x i8>>
    %21 = llvm.getelementptr %20[%3, %3] : (!llvm.ptr<array<2 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %22 = llvm.call @fprintf(%17, %19, %21) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.ptr<i8>) -> !llvm.i32
    %23 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %24 = llvm.load %23 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %25 = llvm.mlir.addressof @str1 : !llvm.ptr<array<15 x i8>>
    %26 = llvm.getelementptr %25[%3, %3] : (!llvm.ptr<array<15 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %27 = llvm.mlir.addressof @str6 : !llvm.ptr<array<2 x i8>>
    %28 = llvm.getelementptr %27[%3, %3] : (!llvm.ptr<array<2 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %29 = llvm.call @fprintf(%24, %26, %28) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.ptr<i8>) -> !llvm.i32
    br ^bb6(%c0_i32 : i32)
  ^bb3(%30: i32):  // 2 preds: ^bb1, ^bb4
    %31 = cmpi "slt", %30, %arg1 : i32
    %32 = index_cast %30 : i32 to index
    cond_br %31, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %33 = muli %13, %arg1 : i32
    %34 = addi %33, %30 : i32
    %35 = remi_signed %34, %c20_i32 : i32
    %36 = cmpi "eq", %35, %c0_i32 : i32
    scf.if %36 {
      %77 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
      %78 = llvm.load %77 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
      %79 = llvm.mlir.addressof @str3 : !llvm.ptr<array<2 x i8>>
      %80 = llvm.getelementptr %79[%3, %3] : (!llvm.ptr<array<2 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
      %81 = llvm.call @fprintf(%78, %80) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>) -> !llvm.i32
    }
    %37 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %38 = llvm.load %37 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %39 = llvm.mlir.addressof @str4 : !llvm.ptr<array<8 x i8>>
    %40 = llvm.getelementptr %39[%3, %3] : (!llvm.ptr<array<8 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %41 = load %arg3[%15, %32] : memref<1200x1200xf64>
    %42 = llvm.mlir.cast %41 : f64 to !llvm.double
    %43 = llvm.call @fprintf(%38, %40, %42) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.double) -> !llvm.i32
    %44 = addi %30, %c1_i32 : i32
    br ^bb3(%44 : i32)
  ^bb5:  // pred: ^bb3
    %45 = addi %13, %c1_i32 : i32
    br ^bb1(%45 : i32)
  ^bb6(%46: i32):  // 2 preds: ^bb2, ^bb10
    %47 = cmpi "slt", %46, %arg0 : i32
    %48 = index_cast %46 : i32 to index
    cond_br %47, ^bb8(%c0_i32 : i32), ^bb7
  ^bb7:  // pred: ^bb6
    %49 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %50 = llvm.load %49 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %51 = llvm.mlir.addressof @str5 : !llvm.ptr<array<17 x i8>>
    %52 = llvm.getelementptr %51[%3, %3] : (!llvm.ptr<array<17 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %53 = llvm.mlir.addressof @str6 : !llvm.ptr<array<2 x i8>>
    %54 = llvm.getelementptr %53[%3, %3] : (!llvm.ptr<array<2 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %55 = llvm.call @fprintf(%50, %52, %54) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.ptr<i8>) -> !llvm.i32
    %56 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %57 = llvm.load %56 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %58 = llvm.mlir.addressof @str7 : !llvm.ptr<array<23 x i8>>
    %59 = llvm.getelementptr %58[%3, %3] : (!llvm.ptr<array<23 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %60 = llvm.call @fprintf(%57, %59) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>) -> !llvm.i32
    return
  ^bb8(%61: i32):  // 2 preds: ^bb6, ^bb9
    %62 = cmpi "slt", %61, %arg1 : i32
    %63 = index_cast %61 : i32 to index
    cond_br %62, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %64 = muli %46, %arg1 : i32
    %65 = addi %64, %61 : i32
    %66 = remi_signed %65, %c20_i32 : i32
    %67 = cmpi "eq", %66, %c0_i32 : i32
    scf.if %67 {
      %77 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
      %78 = llvm.load %77 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
      %79 = llvm.mlir.addressof @str3 : !llvm.ptr<array<2 x i8>>
      %80 = llvm.getelementptr %79[%3, %3] : (!llvm.ptr<array<2 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
      %81 = llvm.call @fprintf(%78, %80) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>) -> !llvm.i32
    }
    %68 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %69 = llvm.load %68 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %70 = llvm.mlir.addressof @str4 : !llvm.ptr<array<8 x i8>>
    %71 = llvm.getelementptr %70[%3, %3] : (!llvm.ptr<array<8 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %72 = load %arg4[%48, %63] : memref<1000x1200xf64>
    %73 = llvm.mlir.cast %72 : f64 to !llvm.double
    %74 = llvm.call @fprintf(%69, %71, %73) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.double) -> !llvm.i32
    %75 = addi %61, %c1_i32 : i32
    br ^bb8(%75 : i32)
  ^bb10:  // pred: ^bb8
    %76 = addi %46, %c1_i32 : i32
    br ^bb6(%76 : i32)
  }
  func private @free(memref<?xi8>)
  func private @S0(%arg0: memref<1xf64>) attributes {scop.stmt} {
    %cst = constant 0.000000e+00 : f64
    affine.store %cst, %arg0[0] : memref<1xf64>
    return
  }
  func private @S1(%arg0: memref<1xf64>, %arg1: memref<1000x1200xf64>, %arg2: index, %arg3: index) attributes {scop.stmt} {
    %0 = affine.load %arg0[0] : memref<1xf64>
    %1 = affine.load %arg1[%arg2, %arg3] : memref<1000x1200xf64>
    %2 = affine.load %arg1[%arg2, %arg3] : memref<1000x1200xf64>
    %3 = mulf %1, %2 : f64
    %4 = addf %0, %3 : f64
    affine.store %4, %arg0[0] : memref<1xf64>
    return
  }
  func private @S2(%arg0: memref<1200x1200xf64>, %arg1: index, %arg2: memref<1xf64>) attributes {scop.stmt} {
    %0 = affine.load %arg2[0] : memref<1xf64>
    %1 = sqrt %0 : f64
    affine.store %1, %arg0[%arg1, %arg1] : memref<1200x1200xf64>
    return
  }
  func private @S3(%arg0: memref<1000x1200xf64>, %arg1: index, %arg2: index, %arg3: memref<1200x1200xf64>, %arg4: memref<1000x1200xf64>) attributes {scop.stmt} {
    %0 = affine.load %arg4[%arg1, %arg2] : memref<1000x1200xf64>
    %1 = affine.load %arg3[%arg2, %arg2] : memref<1200x1200xf64>
    %2 = divf %0, %1 : f64
    affine.store %2, %arg0[%arg1, %arg2] : memref<1000x1200xf64>
    return
  }
  func private @S4(%arg0: memref<1200x1200xf64>, %arg1: index, %arg2: index) attributes {scop.stmt} {
    %cst = constant 0.000000e+00 : f64
    affine.store %cst, %arg0[%arg1, %arg2] : memref<1200x1200xf64>
    return
  }
  func private @S5(%arg0: memref<1200x1200xf64>, %arg1: index, %arg2: index, %arg3: memref<1000x1200xf64>, %arg4: index, %arg5: memref<1000x1200xf64>) attributes {scop.stmt} {
    %0 = affine.load %arg0[%arg1, %arg2] : memref<1200x1200xf64>
    %1 = affine.load %arg5[%arg4, %arg1] : memref<1000x1200xf64>
    %2 = affine.load %arg3[%arg4, %arg2] : memref<1000x1200xf64>
    %3 = mulf %1, %2 : f64
    %4 = addf %0, %3 : f64
    affine.store %4, %arg0[%arg1, %arg2] : memref<1200x1200xf64>
    return
  }
  func private @S6(%arg0: memref<1000x1200xf64>, %arg1: index, %arg2: index, %arg3: memref<1200x1200xf64>, %arg4: index, %arg5: memref<1000x1200xf64>) attributes {scop.stmt} {
    %0 = affine.load %arg0[%arg1, %arg2] : memref<1000x1200xf64>
    %1 = affine.load %arg5[%arg1, %arg4] : memref<1000x1200xf64>
    %2 = affine.load %arg3[%arg4, %arg2] : memref<1200x1200xf64>
    %3 = mulf %1, %2 : f64
    %4 = subf %0, %3 : f64
    affine.store %4, %arg0[%arg1, %arg2] : memref<1000x1200xf64>
    return
  }
  func @kernel_gramschmidt_new(%arg0: i32, %arg1: i32, %arg2: memref<1000x1200xf64>, %arg3: memref<1200x1200xf64>, %arg4: memref<1000x1200xf64>) {
    %cst = constant 0.000000e+00 : f64
    %0 = alloca() : memref<1xf64>
    %1 = index_cast %arg0 : i32 to index
    %2 = index_cast %arg1 : i32 to index
    affine.for %arg5 = 0 to #map7()[%2] {
      affine.for %arg6 = #map0(%arg5) to #map8()[%2] {
        affine.for %arg7 = #map1(%arg5) to min #map9(%arg5, %arg6)[%2] {
          affine.for %arg8 = max #map3(%arg6, %arg7) to min #map10(%arg6)[%2] {
            call @S4(%arg3, %arg7, %arg8) : (memref<1200x1200xf64>, index, index) -> ()
          }
        }
      }
    }
    affine.for %arg5 = 0 to #map11()[%2] {
      call @S0(%0) : (memref<1xf64>) -> ()
      affine.for %arg6 = 0 to %1 {
        call @S1(%0, %arg2, %arg5, %arg6) : (memref<1xf64>, memref<1000x1200xf64>, index, index) -> ()
      }
      call @S2(%arg3, %arg5, %0) : (memref<1200x1200xf64>, index, memref<1xf64>) -> ()
      affine.for %arg6 = 0 to #map8()[%1] {
        affine.for %arg7 = #map1(%arg6) to min #map10(%arg6)[%1] {
          call @S3(%arg4, %arg5, %arg7, %arg3, %arg2) : (memref<1000x1200xf64>, index, index, memref<1200x1200xf64>, memref<1000x1200xf64>) -> ()
        }
      }
      affine.for %arg6 = #map6(%arg5) to #map8()[%2] {
        affine.for %arg7 = 0 to #map8()[%1] {
          affine.for %arg8 = max #map3(%arg5, %arg6) to min #map10(%arg6)[%2] {
            affine.for %arg9 = #map1(%arg7) to min #map10(%arg7)[%1] {
              call @S5(%arg3, %arg5, %arg8, %arg2, %arg9, %arg4) : (memref<1200x1200xf64>, index, index, memref<1000x1200xf64>, index, memref<1000x1200xf64>) -> ()
            }
          }
        }
        affine.for %arg7 = 0 to #map8()[%1] {
          affine.for %arg8 = max #map3(%arg5, %arg6) to min #map10(%arg6)[%2] {
            affine.for %arg9 = #map1(%arg7) to min #map10(%arg7)[%1] {
              call @S6(%arg2, %arg5, %arg8, %arg3, %arg9, %arg4) : (memref<1000x1200xf64>, index, index, memref<1200x1200xf64>, index, memref<1000x1200xf64>) -> ()
            }
          }
        }
      }
    }
    affine.store %cst, %0[0] : memref<1xf64>
    affine.for %arg5 = 0 to %1 {
      %5 = affine.apply #map11()[%2]
      call @S1(%0, %arg2, %5, %arg5) : (memref<1xf64>, memref<1000x1200xf64>, index, index) -> ()
    }
    %3 = affine.load %0[0] : memref<1xf64>
    %4 = sqrt %3 : f64
    affine.store %4, %arg3[symbol(%2) - 1, symbol(%2) - 1] : memref<1200x1200xf64>
    affine.for %arg5 = 0 to #map8()[%1] {
      affine.for %arg6 = #map1(%arg5) to min #map10(%arg5)[%1] {
        %5 = affine.apply #map11()[%2]
        call @S3(%arg4, %5, %arg6, %arg3, %arg2) : (memref<1000x1200xf64>, index, index, memref<1200x1200xf64>, memref<1000x1200xf64>) -> ()
      }
    }
    return
  }
}
