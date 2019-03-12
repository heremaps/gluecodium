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

#include "hello/HelloWorldMaps.h"

#include <algorithm>
#include <cctype>

namespace hello
{
HelloWorldMaps::ErrorCodeToMessageMap
HelloWorldMaps::method_with_map( const HelloWorldMaps::ErrorCodeToMessageMap& input )
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
}  // namespace hello
