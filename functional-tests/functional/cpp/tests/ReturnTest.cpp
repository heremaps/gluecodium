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

#include "lorem_ipsum/test/Return.h"
#include <gmock/gmock.h>

namespace test
{
using namespace ::testing;
using ::lorem_ipsum::test::Return;

namespace {
    struct NonDefaultStruct {
        const int id;
    };
}

TEST( ReturnTest, safe_value_for_default_constructable_type )
{
    const Return<int> const_return(1);
    EXPECT_EQ(const_return.safe_value(), 1);
    EXPECT_EQ(const_return.unsafe_value(), 1);

    EXPECT_EQ(Return<int>(1).safe_value(), 1);
    EXPECT_EQ(Return<int>(1).unsafe_value(), 1);
}

TEST( ReturnTest, compiles_for_non_default_constructable_type )
{
    const Return<NonDefaultStruct> const_return({1});
    EXPECT_EQ(const_return.unsafe_value().id, 1);
    EXPECT_EQ(Return<NonDefaultStruct>({1}).unsafe_value().id, 1);
}

}  // test
