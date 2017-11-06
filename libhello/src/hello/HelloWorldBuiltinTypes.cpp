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

std::vector< uint8_t >
HelloWorldBuiltinTypes::method_with_byte_buffer( const std::vector< uint8_t >& input_buffer )
{
    return {input_buffer.rbegin(), input_buffer.rend()};
}

double
HelloWorldBuiltinTypes::method_with_float_and_integer( const float input_float,
                                                       const int8_t input_integer )
{
    return input_float * (0.01 * input_integer);
}

void
HelloWorldBuiltinTypes::void_method( const int32_t input_number )
{
    s_last_void_method_parameter = input_number;
}

int32_t HelloWorldBuiltinTypes::get_void_method_parameter( )
{
    return s_last_void_method_parameter;
}

}

