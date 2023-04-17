// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2020
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

#include "test/DeclarationOrderWithFunctions.h"

namespace test
{
void
DeclarationOrderWithFunctions::MainStructWithFunctions::with_parameter(
    const DeclarationOrderWithFunctions::ParameterStruct& input) const { }

DeclarationOrderWithFunctions::ReturnStruct
DeclarationOrderWithFunctions::MainStructWithFunctions::with_return() const { return {}; }

lorem_ipsum::test::Return<void, DeclarationOrderWithFunctions::ThrownStruct>
DeclarationOrderWithFunctions::MainStructWithFunctions::with_thrown() const { return {}; }
}  // namespace test
