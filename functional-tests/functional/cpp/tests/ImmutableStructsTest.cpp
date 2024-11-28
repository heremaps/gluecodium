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

#include "test/Defaults.h"
#include "test/PlainDataStructuresImmutable.h"
#include <gmock/gmock.h>

namespace test
{
using namespace ::testing;

TEST( ImmutableStructsTest, struct_with_accessors_is_copy_constructable )
{
    test::PlainDataStructuresImmutable::ImmutableStructWithCppAccessors some_struct{"foo"};
    test::PlainDataStructuresImmutable::ImmutableStructWithCppAccessors another_struct(some_struct);

    EXPECT_EQ(another_struct.get_string_field(), "foo");
    EXPECT_NE(&another_struct, &some_struct);
}

TEST( ImmutableStructsTest, struct_with_accessors_is_copy_assignable )
{
    test::PlainDataStructuresImmutable::ImmutableStructWithCppAccessors some_struct{"foo"};
    test::PlainDataStructuresImmutable::ImmutableStructWithCppAccessors another_struct{""};
    another_struct = some_struct;

    EXPECT_EQ(another_struct.get_string_field(), "foo");
    EXPECT_NE(&another_struct, &some_struct);
}

TEST ( ImmutableStructsTest, nullable_field_that_has_default_value_has_correct_default )
{
    // Case 1: struct without explicit field constructor.
    test::Defaults::ImmutableStructWithNullableFieldUsingImmutableStruct some_struct{};

    ASSERT_TRUE(some_struct.some_field1.has_value());
    EXPECT_EQ(42, some_struct.some_field1->int_field);

    // Case 2: struct with explicit field constructor.
    int field_constructor_param1 = 123;
    int field_constructor_param2 = 456;
    test::Defaults::ImmutableStructWithFieldConstructorAndNullableFieldUsingImmutableStruct another_struct{
        field_constructor_param1, field_constructor_param2
    };

    ASSERT_TRUE(another_struct.some_field1.has_value());
    EXPECT_EQ(42, another_struct.some_field1->int_field);
}

}  // test
