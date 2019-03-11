// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
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

#include "test/Maps.h"

#include <algorithm>
#include <cstdint>
#include <string>

namespace test {

Maps::ErrorCodeToMessageMap
Maps::method_with_map( const Maps::ErrorCodeToMessageMap& input )
{
    Maps::ErrorCodeToMessageMap result;
    for ( const auto& entry : input )
    {
        std::string uppercase_string = entry.second;
        std::transform( uppercase_string.begin( ), uppercase_string.end( ),
                        uppercase_string.begin( ), ::toupper );
        result.emplace( entry.first, uppercase_string );
    }
    return result;
}

Maps::NumberToStruct
Maps::method_with_map_to_struct( const Maps::NumberToStruct& input )
{
    Maps::NumberToStruct result;
    for ( const auto& entry : input )
    {
        Maps::SomeStruct uppercase_string_inabox = entry.second;
        std::string& uppercase_string = uppercase_string_inabox.value;
        std::transform( uppercase_string.begin( ), uppercase_string.end( ),
                        uppercase_string.begin( ), ::toupper );
        result.emplace( entry.first, uppercase_string_inabox );
    }
    return result;
}

Maps::NestedMap
Maps::method_with_nested_map( const Maps::NestedMap& input )
{
    Maps::NestedMap result;
    for ( const auto& entry : input )
    {
        Maps::NumberToStruct result_value = method_with_map_to_struct( entry.second );
        result.emplace( entry.first, result_value );
    }
    return result;
}

Maps::StructWithMap
Maps::method_with_struct_with_map( const Maps::StructWithMap& input )
{
    Maps::StructWithMap result;
    for ( const auto& entry : input.error_mapping )
    {
        std::string uppercase_string = entry.second;
        std::transform( uppercase_string.begin( ), uppercase_string.end( ),
                        uppercase_string.begin( ), ::toupper );
        result.error_mapping.emplace( entry.first, uppercase_string );
    }
    return result;
}

Maps::EnumToString
Maps::method_with_enum_to_string_map( const Maps::EnumToString& input )
{
    Maps::EnumToString result;
    for ( const auto& entry : input )
    {
        std::string uppercase_string = entry.second;
        std::transform( uppercase_string.begin( ), uppercase_string.end( ),
                        uppercase_string.begin( ), ::toupper );
        result.emplace( entry.first, uppercase_string );
    }
    return result;
}

Maps::NumberToArray
Maps::method_with_map_of_arrays( const Maps::NumberToArray& input )
{
    Maps::NumberToArray result;
    for ( const auto& entry : input )
    {
        Maps::ArrayOfStrings string_array( entry.second );
        for ( auto& input_string : string_array )
        {
            std::transform( input_string.begin( ), input_string.end( ),
                            input_string.begin( ), ::toupper );
        }
        result.emplace( entry.first, string_array );
    }
    return result;
}

Maps::StringToInstance
Maps::method_with_map_of_instances( const Maps::StringToInstance& input )
{
    Maps::StringToInstance result = input;
    for_each( std::begin( input ),
              std::end( input ),
              []( const Maps::StringToInstance::value_type& value ) {
                  auto str = value.second->get_string_value( );
                  str += " " + value.first;
                  value.second->set_string_value( str );
              } );
    return result;
}
}
