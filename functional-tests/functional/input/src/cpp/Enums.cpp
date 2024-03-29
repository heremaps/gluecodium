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

#include "test/Enums.h"
#include "test/UseEnumOptionSet.h"
#include "test/UseEnumWithAlias.h"
#include <unordered_set>

namespace
{
::test::Enums::InternalError
flip_enum( const ::test::Enums::InternalError val )
{
    return val == ::test::Enums::InternalError::ERROR_NONE
               ? ::test::Enums::InternalError::ERROR_FATAL
               : ::test::Enums::InternalError::ERROR_NONE;
}
}

namespace test
{
::test::Enums::InternalError
Enums::flip_enum_value( const ::test::Enums::InternalError input )
{
    return flip_enum( input );
}

::test::Enums::InternalError
Enums::extract_enum_from_struct( const ::test::Enums::ErrorStruct& input )
{
    return flip_enum( input.type );
}

::test::Enums::ErrorStruct
Enums::create_struct_with_enum_inside( const ::test::Enums::InternalError type,
                                       const ::std::string& message )
{
    return {flip_enum( type ), message};
}

test::EnumStartsWithOne
Enums::flip_enum_starts_with_one(const test::EnumStartsWithOne input)
{
    return input == test::EnumStartsWithOne::FIRST
        ? test::EnumStartsWithOne::SECOND
        : test::EnumStartsWithOne::FIRST;
}

// UseEnumWithAlias

bool
UseEnumWithAlias::compare_to_one(const test::EnumWithAlias input) {
    return input == test::EnumWithAlias::ONE;
}

bool
UseEnumWithAlias::compare_to_first(const test::EnumWithAlias input) {
    return input == test::EnumWithAlias::FIRST;
}

test::EnumWithAlias
UseEnumWithAlias::get_first() { return test::EnumWithAlias::FIRST; }

// UseEnumOptionSet

std::unordered_set<test::EnumOptionSet, lorem_ipsum::test::hash<test::EnumOptionSet>>
UseEnumOptionSet::round_trip(
    const std::unordered_set<test::EnumOptionSet, lorem_ipsum::test::hash<test::EnumOptionSet>>& input
) {
    return input;
}

}
