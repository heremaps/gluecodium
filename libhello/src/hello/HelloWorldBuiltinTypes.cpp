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

#include "stub/hello/HelloWorldBuiltinTypes.h"

#include <cmath>

namespace hello
{

static int32_t lastVoidMethodParameter;

int8_t
HelloWorldBuiltinTypes::methodWithInt8( const int8_t inputNumber )
{
   return inputNumber + 1;
}

uint8_t
HelloWorldBuiltinTypes::methodWithUInt8( const uint8_t inputNumber )
{
   return inputNumber + 1;
}

int16_t
HelloWorldBuiltinTypes::methodWithInt16( const int16_t inputNumber )
{
   return inputNumber + 1;
}

uint16_t
HelloWorldBuiltinTypes::methodWithUInt16( const uint16_t inputNumber )
{
   return inputNumber + 1;
}

int32_t
HelloWorldBuiltinTypes::methodWithInt32( const int32_t inputNumber )
{
   return inputNumber + 1;
}

uint32_t
HelloWorldBuiltinTypes::methodWithUInt32( const uint32_t inputNumber )
{
   return inputNumber + 1;
}

int64_t
HelloWorldBuiltinTypes::methodWithInt64( const int64_t inputNumber )
{
   return inputNumber + 1;
}

uint64_t
HelloWorldBuiltinTypes::methodWithUInt64( const uint64_t inputNumber )
{
   return inputNumber + 1;
}

bool
HelloWorldBuiltinTypes::methodWithBoolean( const bool inputCondition )
{
    return !inputCondition;
}

float
HelloWorldBuiltinTypes::methodWithFloat( const float inputNumber )
{
    return 0.5f * inputNumber;
}

double
HelloWorldBuiltinTypes::methodWithDouble( const double inputNumber )
{
    return 2.0 * inputNumber;
}

std::vector< uint8_t >
HelloWorldBuiltinTypes::methodWithByteBuffer( const std::vector< uint8_t >& inputBuffer )
{
    return {inputBuffer.rbegin(), inputBuffer.rend()};
}

double
HelloWorldBuiltinTypes::methodWithFloatAndInteger( const float inputFloat,
                                                       const int8_t inputInteger )
{
    return inputFloat * (0.01 * inputInteger);
}

void
HelloWorldBuiltinTypes::voidMethod( const int32_t inputNumber )
{
    lastVoidMethodParameter = inputNumber;
}

int32_t HelloWorldBuiltinTypes::getVoidMethodParameter ( )
{
    return lastVoidMethodParameter;
}

}

