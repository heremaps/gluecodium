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
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <cstdint>
#include <vector>

namespace examples {

class BuiltinTypes {
public:
static int8_t method_with_int8( const int8_t input_number );
static uint8_t method_with_u_int8( const uint8_t input_number );
static int16_t method_with_int16( const int16_t input_number );
static uint16_t method_with_u_int16( const uint16_t input_number );
static int32_t method_with_int32( const int32_t input_number );
static uint32_t method_with_u_int32( const uint32_t input_number );
static int64_t method_with_int64( const int64_t input_number );
static uint64_t method_with_u_int64( const uint64_t input_number );
static bool method_with_boolean( const bool input_condition );
static float method_with_float( const float input_number );
static double method_with_double( const double input_number );
static ::std::vector< uint8_t > method_with_byte_buffer( const ::std::vector< uint8_t >& input_buffer );
static double method_with_float_and_integer( const float input_float, const int32_t input_integer );

};

}
