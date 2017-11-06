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

#include "hello/HelloWorldMaps.h"
#include <algorithm>
#include <cctype>

namespace hello
{
::std::unordered_map< int32_t, ::std::string >
HelloWorldMaps::method_with_map( const ::std::unordered_map< int32_t, ::std::string >& input )
{
    HelloWorldMaps::ErrorCodeToMessageMap result;
    for ( const auto& entry : input )
    {
        std::string uppercase_string = entry.second;
        std::transform( uppercase_string.begin( ), uppercase_string.end( ),
                        uppercase_string.begin( ), ::toupper );
        result.emplace( entry.first, uppercase_string );
    }
    return result;
}
}
