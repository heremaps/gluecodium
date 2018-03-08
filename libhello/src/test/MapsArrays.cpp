// -------------------------------------------------------------------------------------------------
// Copyright (c) 2016-2018 HERE Europe B.V.
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