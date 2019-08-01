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

#include "test/NestedGenericTypes.h"

namespace test
{
using namespace lorem_ipsum::test;
using IntVector = std::vector<int32_t>;
using IntToBoolMap = std::unordered_map<int32_t, bool>;
using IntSet = std::unordered_set<int32_t>;

std::vector<IntVector>
NestedGenericTypes::method_with_list_of_lists( const std::vector<IntVector>& input )
{
    return input;
}

std::unordered_map<IntToBoolMap, int32_t, hash<IntToBoolMap>>
NestedGenericTypes::method_with_map_of_maps(
    const std::unordered_map<int32_t, IntToBoolMap>& input )
{
    std::unordered_map<IntToBoolMap, int32_t, hash<IntToBoolMap>> result{};
    for ( const auto& pair : input )
    {
        result[pair.second] = pair.first;
    }
    return result;
}

std::unordered_set<IntSet, hash<IntSet>>
NestedGenericTypes::method_with_set_of_sets( const std::unordered_set<IntSet, hash<IntSet>>& input )
{
    return input;
}

std::unordered_map<int32_t, IntVector>
NestedGenericTypes::method_with_list_and_map( const std::vector<IntToBoolMap>& input )
{
    std::unordered_map<int32_t, IntVector> result{};
    for ( const auto& map : input )
    {
        for ( const auto& pair : map )
        {
            result[pair.first].push_back( pair.second );
        }
    }
    return result;
}

std::unordered_set<IntVector, hash<IntVector>>
NestedGenericTypes::method_with_list_and_set( const std::vector<IntSet>& input )
{
    std::unordered_set<IntVector, hash<IntVector>> result{};
    for ( const auto& set : input )
    {
        result.emplace( set.cbegin( ), set.cend( ) );
    }
    return result;
}

std::unordered_set<IntToBoolMap, hash<IntToBoolMap>>
NestedGenericTypes::method_with_map_and_set( const std::unordered_map<int32_t, IntSet>& input )
{
    std::unordered_set<IntToBoolMap, hash<IntToBoolMap>> result{};
    for ( const auto& pair : input )
    {
        IntToBoolMap result_element{};
        for ( const auto& input_element : pair.second )
        {
            result_element[input_element] = pair.first;
        }
        result.insert( result_element );
    }
    return result;
}

std::unordered_map<IntVector, bool, hash<IntVector>>
NestedGenericTypes::method_with_map_generic_keys(
    const std::unordered_map<IntSet, bool, hash<IntSet>>& input )
{
    std::unordered_map<IntVector, bool, hash<IntVector>> result{};
    for ( const auto& pair : input )
    {
        result[IntVector( pair.first.cbegin( ), pair.first.cend( ) )] = pair.second;
    }
    return result;
}

}  // namespace test
