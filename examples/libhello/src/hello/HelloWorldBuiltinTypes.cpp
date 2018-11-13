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

#include "hello/HelloWorldBuiltinTypes.h"

#include <cmath>

namespace hello
{
static int32_t s_last_void_method_parameter;

int8_t
HelloWorldBuiltinTypes::method_with_int8( const int8_t input_number )
{
    return input_number + 1;
}

uint8_t
HelloWorldBuiltinTypes::method_with_uint8( const uint8_t input_number )
{
    return input_number + 1;
}

int16_t
HelloWorldBuiltinTypes::method_with_int16( const int16_t input_number )
{
    return input_number + 1;
}

uint16_t
HelloWorldBuiltinTypes::method_with_uint16( const uint16_t input_number )
{
    return input_number + 1;
}

int32_t
HelloWorldBuiltinTypes::method_with_int32( const int32_t input_number )
{
    return input_number + 1;
}

uint32_t
HelloWorldBuiltinTypes::method_with_uint32( const uint32_t input_number )
{
    return input_number + 1;
}

int64_t
HelloWorldBuiltinTypes::method_with_int64( const int64_t input_number )
{
    return input_number + 1;
}

uint64_t
HelloWorldBuiltinTypes::method_with_uint64( const uint64_t input_number )
{
    return input_number + 1;
}

bool
HelloWorldBuiltinTypes::method_with_boolean( const bool inputCondition )
{
    return !inputCondition;
}

float
HelloWorldBuiltinTypes::method_with_float( const float input_number )
{
    return 0.5f * input_number;
}

double
HelloWorldBuiltinTypes::method_with_double( const double input_number )
{
    return 2.0 * input_number;
}

std::shared_ptr< std::vector< uint8_t > >
HelloWorldBuiltinTypes::method_with_byte_buffer(
    const std::shared_ptr< std::vector< uint8_t > >& input_buffer )
{
    return std::make_shared< std::vector< uint8_t > >( input_buffer->rbegin( ),
                                                       input_buffer->rend( ) );
}

double
HelloWorldBuiltinTypes::method_with_float_and_integer( const float input_float,
                                                       const int8_t input_integer )
{
    return input_float * ( 0.01 * input_integer );
}

void
HelloWorldBuiltinTypes::void_method( const int32_t input_number )
{
    s_last_void_method_parameter = input_number;
}

int32_t
HelloWorldBuiltinTypes::get_void_method_parameter( )
{
    return s_last_void_method_parameter;
}

}  // namespace hello
