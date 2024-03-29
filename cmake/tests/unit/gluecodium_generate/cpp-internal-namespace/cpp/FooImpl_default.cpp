// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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

#include "unit/test/Bar.h"
#include <optional>

namespace unit::test {
::gluecodium::Return< std::shared_ptr<Foo>, std::error_code >
Foo::make_foo(const ::std::optional< double >& parameter)
{
    return {std::shared_ptr<Foo>{}};
}
} // namespace unit::test
