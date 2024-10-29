// -------------------------------------------------------------------------------------------------
// Copyright (C) 2024 HERE Europe B.V.
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

#include "test/SomeMutableStructWithCppAccessors.h"

#include <gmock/gmock.h>

#include <cstdint>
#include <string>
#include <type_traits>
#include <vector>

namespace test
{

using namespace ::testing;
using namespace test;

namespace {

using TrivialInt = int32_t;
using TrivialDouble = double;
using NontrivialString = std::string;
using NontrivialList = std::vector<std::string>;

SomeMutableStructWithCppAccessors get_struct() {
    return SomeMutableStructWithCppAccessors {
        TrivialInt{32},
        TrivialDouble{27.5},
        NontrivialString{"Some string"},
        NontrivialList{{"S1", "S2", "S3"}}
    };
}

const SomeMutableStructWithCppAccessors get_const_struct() {
    return SomeMutableStructWithCppAccessors {
        TrivialInt{64},
        TrivialDouble{52.3},
        NontrivialString{"Another string"},
        NontrivialList{{"A1", "A2", "A3"}}
    };
}

} // namespace

TEST( AccessorsOfMutableStruct, GettingFieldsOnLvalue )
{
    // Given an object of mutable struct with accessors.
    SomeMutableStructWithCppAccessors object = get_struct();

    // When using getters on lvalue.
    const auto& int_field = object.get_trivial_int_field();
    const auto& double_field = object.get_trivial_double_field();
    const auto& string_field = object.get_nontrivial_string_field();
    const auto& list_field = object.get_nontrivial_list_field();

    // Then access can be made.
    EXPECT_EQ(TrivialInt{32}, int_field);
    EXPECT_DOUBLE_EQ(TrivialDouble{27.5}, double_field);
    EXPECT_EQ(NontrivialString{"Some string"}, string_field);

    const NontrivialList expected_list{"S1", "S2", "S3"};
    EXPECT_EQ(expected_list, list_field);
}

TEST( AccessorsOfMutableStruct, GettingFieldsOnConstLvalue )
{
    // Given const reference to object of mutable struct with accessors.
    const auto& object = get_const_struct();

    // When using getters on const lvalue.
    const auto& int_field = object.get_trivial_int_field();
    const auto& double_field = object.get_trivial_double_field();
    const auto& string_field = object.get_nontrivial_string_field();
    const auto& list_field = object.get_nontrivial_list_field();

    // Then access can be made.
    EXPECT_EQ(TrivialInt{64}, int_field);
    EXPECT_DOUBLE_EQ(TrivialDouble{52.3}, double_field);
    EXPECT_EQ(NontrivialString{"Another string"}, string_field);

    const NontrivialList expected_list{"A1", "A2", "A3"};
    EXPECT_EQ(expected_list, list_field);
}

TEST( AccessorsOfMutableStruct, GettingFieldsOnRvalue )
{
    // When using getter on rvalue.
    auto int_field = get_struct().get_trivial_int_field();
    auto double_field = get_struct().get_trivial_double_field();
    auto string_field = get_struct().get_nontrivial_string_field();
    auto list_field = get_struct().get_nontrivial_list_field();

    // Then access can be made.
    EXPECT_EQ(TrivialInt{32}, int_field);
    EXPECT_DOUBLE_EQ(TrivialDouble{27.5}, double_field);
    EXPECT_EQ(NontrivialString{"Some string"}, string_field);

    const NontrivialList expected_list{"S1", "S2", "S3"};
    EXPECT_EQ(expected_list, list_field);
}

TEST( AccessorsOfMutableStruct, GettingFieldsOnConstRvalue )
{
    // When using getters on const rvalue.
    auto int_field = get_const_struct().get_trivial_int_field();
    auto double_field = get_const_struct().get_trivial_double_field();
    auto string_field = get_const_struct().get_nontrivial_string_field();
    auto list_field = get_const_struct().get_nontrivial_list_field();

    // Then access can be made.
    EXPECT_EQ(TrivialInt{64}, int_field);
    EXPECT_DOUBLE_EQ(TrivialDouble{52.3}, double_field);
    EXPECT_EQ(NontrivialString{"Another string"}, string_field);

    const NontrivialList expected_list{"A1", "A2", "A3"};
    EXPECT_EQ(expected_list, list_field);
}

TEST( AccessorsOfMutableStruct, PreconditionsForNontrivialGetters )
{
    // String getters.
    using LvalueStringGetterRetT = decltype(std::declval<SomeMutableStructWithCppAccessors&>().get_nontrivial_string_field());
    static_assert(std::is_same_v<const std::string&, LvalueStringGetterRetT>, "String getter shall return const ref when called on L-value");

    using ConstLvalueStringGetterRetT = decltype(std::declval<const SomeMutableStructWithCppAccessors&>().get_nontrivial_string_field());
    static_assert(std::is_same_v<const std::string&, ConstLvalueStringGetterRetT>, "String getter shall return const ref when called on const L-value");

    using RvalueStringGetterRetT = decltype(std::declval<SomeMutableStructWithCppAccessors&&>().get_nontrivial_string_field());
    static_assert(std::is_same_v<std::string&&, RvalueStringGetterRetT>, "String getter shall return r-ref when called on R-value");

    using ConstRvalueStringGetterRetT = decltype(std::declval<const SomeMutableStructWithCppAccessors&&>().get_nontrivial_string_field());
    static_assert(std::is_same_v<const std::string&&, ConstRvalueStringGetterRetT>, "String getter shall return const r-ref when called on const R-value");

    // List getters.
    using LvalueListGetterRetT = decltype(std::declval<SomeMutableStructWithCppAccessors&>().get_nontrivial_list_field());
    static_assert(std::is_same_v<const std::vector<std::string>&, LvalueListGetterRetT>, "List getter shall return const l-ref when called on L-value");

    using ConstLvalueListGetterRetT = decltype(std::declval<const SomeMutableStructWithCppAccessors&>().get_nontrivial_list_field());
    static_assert(std::is_same_v<const std::vector<std::string>&, ConstLvalueListGetterRetT>, "List getter shall return const l-ref when called on const L-value");

    using RvalueListGetterRetT = decltype(std::declval<SomeMutableStructWithCppAccessors&&>().get_nontrivial_list_field());
    static_assert(std::is_same_v<std::vector<std::string>&&, RvalueListGetterRetT>, "List getter shall return r-ref when called on R-value");

    using ConstRvalueListGetterRetT = decltype(std::declval<const SomeMutableStructWithCppAccessors&&>().get_nontrivial_list_field());
    static_assert(std::is_same_v<const std::vector<std::string>&&, ConstRvalueListGetterRetT>, "List getter shall return const r-ref when called on const R-value");
}

TEST( AccessorsOfMutableStruct, PreconditionsForTrivialGetters )
{
    // Int getter.
    using LvalueIntGetterRetT = decltype(std::declval<SomeMutableStructWithCppAccessors&>().get_trivial_int_field());
    static_assert(std::is_same_v<int, LvalueIntGetterRetT>, "int getter shall always return by-value");

    using ConstLvalueIntGetterRetT = decltype(std::declval<const SomeMutableStructWithCppAccessors&>().get_trivial_int_field());
    static_assert(std::is_same_v<int, ConstLvalueIntGetterRetT>, "int getter shall always return by-value");

    using RvalueIntGetterRetT = decltype(std::declval<SomeMutableStructWithCppAccessors&&>().get_trivial_int_field());
    static_assert(std::is_same_v<int, RvalueIntGetterRetT>, "int getter shall always return by-value");

    using ConstRvalueIntGetterRetT = decltype(std::declval<const SomeMutableStructWithCppAccessors&&>().get_trivial_int_field());
    static_assert(std::is_same_v<int, ConstRvalueIntGetterRetT>, "int getter shall always return by-value");

    // Double getter.
    using LvalueDoubleGetterRetT = decltype(std::declval<SomeMutableStructWithCppAccessors&>().get_trivial_double_field());
    static_assert(std::is_same_v<double, LvalueDoubleGetterRetT>, "double getter shall always return by-value");

    using ConstLvalueDoubleGetterRetT = decltype(std::declval<const SomeMutableStructWithCppAccessors&>().get_trivial_double_field());
    static_assert(std::is_same_v<double, ConstLvalueDoubleGetterRetT>, "double getter shall always return by-value");

    using RvalueDoubleGetterRetT = decltype(std::declval<SomeMutableStructWithCppAccessors&&>().get_trivial_double_field());
    static_assert(std::is_same_v<double, RvalueDoubleGetterRetT>, "double getter shall always return by-value");

    using ConstRvalueDoubleGetterRetT = decltype(std::declval<const SomeMutableStructWithCppAccessors&&>().get_trivial_double_field());
    static_assert(std::is_same_v<double, ConstRvalueDoubleGetterRetT>, "double getter shall always return by-value");
}

}  // test
