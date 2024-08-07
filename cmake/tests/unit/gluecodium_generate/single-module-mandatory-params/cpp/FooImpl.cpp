// -------------------------------------------------------------------------------------------------
// Copyright (C) 2020 HERE Europe B.V.
//
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

#include "unit/test/Foo.h"

#ifdef GLUECODIUM_SYNCHRONIZE_ACCESS_CLASS_CACHE
#error "GLUECODIUM_SYNCHRONIZE_ACCESS_CLASS_CACHE shouldn't be defined."
#endif

namespace unit::test {
std::shared_ptr<Foo>
Foo::make_foo()
{
    return nullptr;
}
} // namespace unit::test
