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

#include "hello/HelloWorldErrors.h"

namespace hello
{
std::error_code
HelloWorldErrors::hello_world_method_with_error( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( HelloWorldErrors::InternalErrors::CRASHED );
    }
    else
    {
        return {};
    }
}

lorem_ipsum::Return< std::string, std::error_code >
HelloWorldErrors::hello_world_method_with_error_and_string( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( HelloWorldErrors::InternalErrors::CRASHED );
    }
    else
    {
        return std::string{"Hello!"};
    }
}
}  // namespace hello
