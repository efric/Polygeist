//===- PolyEgg.cpp - Call EGG from MLIR ---------------- -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
//===----------------------------------------------------------------------===//
#include "PassDetails.h"

#include "polygeist/Ops.h"
#include "polygeist/Passes/Passes.h"
#include "llvm/Support/Debug.h"

#include <cxxbridge-cpp/polyegg.h>

#define DEBUG_TYPE "poly-egg"

using namespace mlir;
using namespace polygeist;

namespace {
struct PolyEgg : public PolyEggBase<PolyEgg> {
  void runOnOperation() override;
};

} // end anonymous namespace

namespace mlir {
namespace polygeist {
std::unique_ptr<Pass> createPolyEggPass() {
  return std::make_unique<PolyEgg>();
}
} // namespace polygeist
} // namespace mlir

void PolyEgg::runOnOperation() {
	std::string egg_str = polyegg::friedeggs().c_str();
	LLVM_DEBUG(llvm::dbgs() << egg_str << "\n");
}