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

#include "test/Equatable.h"
#include "test/EquatableInterface.h"
#include "test/EquatableInterfaceFactory.h"
#include "test/NonEquatableFactory.h"
#include "test/SimpleEquatableStruct.h"
#include "test/SomeEquatableClass.h"
#include "test/SomePointerEquatableClass.h"
#include <gmock/gmock.h>

namespace test
{
using namespace ::testing;

TEST( EquatableTest, equal_structs )
{
    test::EquatableStruct some_struct;
    some_struct.int_field = 7;
    some_struct.array_field = {"Hello", "World", "!"};
    test::EquatableStruct another_struct;
    another_struct.int_field = 7;
    another_struct.array_field = {"Hello", "World", "!"};

    lorem_ipsum::test::hash<test::EquatableStruct> hasher;

    EXPECT_EQ(some_struct, another_struct);
    EXPECT_EQ(hasher(some_struct), hasher(another_struct));
}

TEST( EquatableTest, unequal_structs )
{
    test::EquatableStruct some_struct;
    some_struct.int_field = 7;
    some_struct.array_field = {"Hello", "World", "!"};
    test::EquatableStruct another_struct;
    another_struct.int_field = 7;
    another_struct.array_field = {"Bye", "World", "!"};

    lorem_ipsum::test::hash<test::EquatableStruct> hasher;

    EXPECT_NE(some_struct, another_struct);
    EXPECT_NE(hasher(some_struct), hasher(another_struct));
}

TEST( EquatableTest, equal_classes )
{
    auto one_class = test::SomeEquatableClass::create("foo");
    auto other_class = test::SomeEquatableClass::create("foo");

    lorem_ipsum::test::EqualityEqualTo<test::SomeEquatableClass> equalizer;
    lorem_ipsum::test::EqualityHash<decltype(one_class)> hasher;

    EXPECT_TRUE(equalizer(one_class, other_class));
    EXPECT_EQ(hasher(one_class), hasher(other_class));
}

TEST( EquatableTest, unequal_classes )
{
    auto one_class = test::SomeEquatableClass::create("foo");
    auto other_class = test::SomeEquatableClass::create("bar");

    lorem_ipsum::test::EqualityEqualTo<test::SomeEquatableClass> equalizer;
    lorem_ipsum::test::EqualityHash<decltype(one_class)> hasher;

    EXPECT_FALSE(equalizer(one_class, other_class));
    EXPECT_NE(hasher(one_class), hasher(other_class));
}

TEST( EquatableTest, pointer_equal_classes )
{
    auto one_class = test::SomePointerEquatableClass::create("foo");
    auto other_class = one_class;

    lorem_ipsum::test::hash<decltype(one_class)> hasher;

    EXPECT_EQ(hasher(one_class), hasher(other_class));
}

TEST( EquatableTest, pointer_unequal_classes )
{
    auto one_class = test::SomePointerEquatableClass::create("foo");
    auto other_class = test::SomePointerEquatableClass::create("foo");

    lorem_ipsum::test::hash<decltype(one_class)> hasher;

    EXPECT_NE(hasher(one_class), hasher(other_class));
}

TEST( EquatableTest, equal_interfaces )
{
    auto one_class = test::EquatableInterfaceFactory::create_equatable_interface("foo");
    auto other_class = test::EquatableInterfaceFactory::create_equatable_interface("foo");

    lorem_ipsum::test::EqualityEqualTo<test::EquatableInterface> equalizer;
    lorem_ipsum::test::EqualityHash<decltype(one_class)> hasher;

    EXPECT_TRUE(equalizer(one_class, other_class));
    EXPECT_EQ(hasher(one_class), hasher(other_class));
}

TEST( EquatableTest, unequal_interfaces )
{
    auto one_class = test::EquatableInterfaceFactory::create_equatable_interface("foo");
    auto other_class = test::EquatableInterfaceFactory::create_equatable_interface("bar");

    lorem_ipsum::test::EqualityEqualTo<test::EquatableInterface> equalizer;
    lorem_ipsum::test::EqualityHash<decltype(one_class)> hasher;

    EXPECT_FALSE(equalizer(one_class, other_class));
    EXPECT_NE(hasher(one_class), hasher(other_class));
}

TEST( EquatableTest, equal_structs_simple_equality )
{
    auto class1 = NonEquatableFactory::create_non_equatable_class();
    auto class2 = NonEquatableFactory::create_non_equatable_class();
    auto interface1 = NonEquatableFactory::create_non_equatable_interface();
    auto interface2 = NonEquatableFactory::create_non_equatable_interface();
    test::SimpleEquatableStruct some_struct{class1, interface1, class2, interface2};
    test::SimpleEquatableStruct another_struct{class1, interface1, class2, interface2};

    lorem_ipsum::test::hash<test::SimpleEquatableStruct> hasher;

    EXPECT_EQ(some_struct, another_struct);
    EXPECT_EQ(hasher(some_struct), hasher(another_struct));
}

TEST( EquatableTest, equal_structs_simple_equality_with_nulls )
{
    auto class1 = NonEquatableFactory::create_non_equatable_class();
    auto interface1 = NonEquatableFactory::create_non_equatable_interface();
    test::SimpleEquatableStruct some_struct{class1, interface1, nullptr, nullptr};
    test::SimpleEquatableStruct another_struct{class1, interface1, nullptr, nullptr};

    lorem_ipsum::test::hash<test::SimpleEquatableStruct> hasher;

    EXPECT_EQ(some_struct, another_struct);
    EXPECT_EQ(hasher(some_struct), hasher(another_struct));
}

TEST( EquatableTest, unequal_structs_simple_equality )
{
    auto class1 = NonEquatableFactory::create_non_equatable_class();
    auto class2 = NonEquatableFactory::create_non_equatable_class();
    auto interface1 = NonEquatableFactory::create_non_equatable_interface();
    auto interface2 = NonEquatableFactory::create_non_equatable_interface();
    test::SimpleEquatableStruct some_struct{class1, interface1, class2, interface2};
    test::SimpleEquatableStruct another_struct{class2, interface2, class1, interface1};

    lorem_ipsum::test::hash<test::SimpleEquatableStruct> hasher;

    EXPECT_NE(some_struct, another_struct);
    EXPECT_NE(hasher(some_struct), hasher(another_struct));
}

TEST( EquatableTest, unequal_structs_simple_equality_with_nulls )
{
    auto class1 = NonEquatableFactory::create_non_equatable_class();
    auto class2 = NonEquatableFactory::create_non_equatable_class();
    auto interface1 = NonEquatableFactory::create_non_equatable_interface();
    auto interface2 = NonEquatableFactory::create_non_equatable_interface();
    test::SimpleEquatableStruct some_struct{class1, interface1, class2, nullptr};
    test::SimpleEquatableStruct another_struct{class1, interface1, nullptr, interface2};

    lorem_ipsum::test::hash<test::SimpleEquatableStruct> hasher;

    EXPECT_NE(some_struct, another_struct);
    EXPECT_NE(hasher(some_struct), hasher(another_struct));
}

}