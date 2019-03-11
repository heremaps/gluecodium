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

#include "test/MethodOverloads.h"

namespace test
{
bool
MethodOverloads::is_boolean( const bool input )
{
    return true;
}

bool
MethodOverloads::is_boolean( const int8_t input )
{
    return false;
}

bool
MethodOverloads::is_boolean( const ::std::string& input )
{
    return false;
}

bool
MethodOverloads::is_boolean( const MethodOverloads::Point& input )
{
    return false;
}

bool
MethodOverloads::is_boolean( const bool input1, const int8_t input2, const ::std::string& input3,
                             const MethodOverloads::Point& input4 )
{
    return false;
}

bool
MethodOverloads::is_boolean( const MethodOverloads::StringArray& input )
{
    return false;
}

bool
MethodOverloads::is_boolean( const MethodOverloads::IntArray& input )
{
    return false;
}

}
