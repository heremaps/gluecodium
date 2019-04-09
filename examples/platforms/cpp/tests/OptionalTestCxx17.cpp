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

#include "lorem_ipsum/test/Optional.h"
#include <optional>

#include <gmock/gmock.h>

namespace test
{
using namespace ::testing;

TEST( OptionalTestCxx17, choose_std_type_if_available )
{
    static_assert(
        std::is_same< lorem_ipsum::test::optional< bool >, std::optional< bool > >::value );
}
}  // namespace test
