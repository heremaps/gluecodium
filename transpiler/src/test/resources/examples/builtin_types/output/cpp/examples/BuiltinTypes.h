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
static int8_t methodWithInt8( const int8_t inputNumber );
static uint8_t methodWithUInt8( const uint8_t inputNumber );
static int16_t methodWithInt16( const int16_t inputNumber );
static uint16_t methodWithUInt16( const uint16_t inputNumber );
static int32_t methodWithInt32( const int32_t inputNumber );
static uint32_t methodWithUInt32( const uint32_t inputNumber );
static int64_t methodWithInt64( const int64_t inputNumber );
static uint64_t methodWithUInt64( const uint64_t inputNumber );
static bool methodWithBoolean( const bool inputCondition );
static float methodWithFloat( const float inputNumber );
static double methodWithDouble( const double inputNumber );
static ::std::vector< uint8_t > methodWithByteBuffer( const ::std::vector< uint8_t >& inputBuffer );
static double methodWithFloatAndInteger( const float inputFloat, const int32_t inputInteger );

};

}
