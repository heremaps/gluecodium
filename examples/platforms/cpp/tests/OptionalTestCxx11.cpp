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

#include "Optional.h"
#include "OptionalImpl.h"

#include <gmock/gmock.h>

namespace test
{
using namespace ::testing;

TEST( OptionalTestCxx11, choose_builtin_type_if_no_std_optional_is_available )
{
    static_assert(
        std::is_same< lorem_ipsum::optional< bool >, lorem_ipsum::Optional< bool > >::value,
        "Choose builtin Optional type if std::optional is not available." );
}
}