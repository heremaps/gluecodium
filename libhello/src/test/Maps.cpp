// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
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

}
