// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2021 HERE Europe B.V.
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

#include "test/ImmutableStructNoClash.h"
#include "test/ImmutableStructWithClash.h"
#include "test/FieldConstructorsAllDefaults.h"
#include "test/FieldConstructorsPartialDefaults.h"

#include <gmock/gmock.h>

namespace test
{

using namespace ::testing;
using namespace test;

TEST( FieldConstructorsTest, with_partial_defaults_2 )
{
    auto result = FieldConstructorsPartialDefaults(7, "foo");

    EXPECT_EQ(result.string_field, "foo");
    EXPECT_EQ(result.int_field, 7);
    EXPECT_EQ(result.bool_field, true);
}

TEST( FieldConstructorsTest, with_partial_defaults_3 )
{
    auto result = FieldConstructorsPartialDefaults(false, 7, "foo");

    EXPECT_EQ(result.string_field, "foo");
    EXPECT_EQ(result.int_field, 7);
    EXPECT_EQ(result.bool_field, false);
}

TEST( FieldConstructorsTest, with_all_defaults_0 )
{
    auto result = FieldConstructorsAllDefaults();

    EXPECT_EQ(result.string_field, "nonsense");
    EXPECT_EQ(result.int_field, 42);
    EXPECT_EQ(result.bool_field, true);
}

TEST( FieldConstructorsTest, with_all_defaults_1 )
{
    auto result = FieldConstructorsAllDefaults(7);

    EXPECT_EQ(result.string_field, "nonsense");
    EXPECT_EQ(result.int_field, 7);
    EXPECT_EQ(result.bool_field, true);
}

TEST( FieldConstructorsTest, immutable_no_clash )
{
    auto result = ImmutableStructNoClash("foo", 7, false);

    EXPECT_EQ(result.string_field, "foo");
    EXPECT_EQ(result.int_field, 7);
    EXPECT_EQ(result.bool_field, false);
}

TEST( FieldConstructorsTest, immutable_with_clash )
{
    auto result = ImmutableStructWithClash(false, 7, "foo");

    EXPECT_EQ(result.string_field, "foo");
    EXPECT_EQ(result.int_field, 7);
    EXPECT_EQ(result.bool_field, false);
}

}
