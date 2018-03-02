// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include "test/MapsArrays.h"

#include <algorithm>
#include <cstdint>
#include <string>

namespace test {

MapsArrays::StringToArrayMap
MapsArrays::method_with_string_to_array_map( const MapsArrays::StringToArrayMap& input )
{
    MapsArrays::StringToArrayMap result;
    for ( const auto& entry : input )
    {
        ::std::vector< uint8_t > value;
        for(uint8_t element : entry.second ) {
          value.push_back(++element);
        }
        result.emplace( entry.first, value );
    }
    return result;
}

}