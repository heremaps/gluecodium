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

#include "stub/hello/HelloWorldBuiltinTypesStub.h"

#include <cmath>

namespace hello
{

static int32_t lastVoidMethodParameter;

int8_t
HelloWorldBuiltinTypesStub::methodWithInt8( const int8_t inputNumber )
{
   return inputNumber + 1;
}

uint8_t
HelloWorldBuiltinTypesStub::methodWithUInt8( const uint8_t inputNumber )
{
   return inputNumber + 1;
}

int16_t
HelloWorldBuiltinTypesStub::methodWithInt16( const int16_t inputNumber )
{
   return inputNumber + 1;
}

uint16_t
HelloWorldBuiltinTypesStub::methodWithUInt16( const uint16_t inputNumber )
{
   return inputNumber + 1;
}

int32_t
HelloWorldBuiltinTypesStub::methodWithInt32( const int32_t inputNumber )
{
   return inputNumber + 1;
}

uint32_t
HelloWorldBuiltinTypesStub::methodWithUInt32( const uint32_t inputNumber )
{
   return inputNumber + 1;
}

int64_t
HelloWorldBuiltinTypesStub::methodWithInt64( const int64_t inputNumber )
{
   return inputNumber + 1;
}

uint64_t
HelloWorldBuiltinTypesStub::methodWithUInt64( const uint64_t inputNumber )
{
   return inputNumber + 1;
}

bool
HelloWorldBuiltinTypesStub::methodWithBoolean( const bool inputCondition )
{
    return !inputCondition;
}

float
HelloWorldBuiltinTypesStub::methodWithFloat( const float inputNumber )
{
    return 0.5f * inputNumber;
}

double
HelloWorldBuiltinTypesStub::methodWithDouble( const double inputNumber )
{
    return 2.0 * inputNumber;
}

std::vector< uint8_t >
HelloWorldBuiltinTypesStub::methodWithByteBuffer( const std::vector< uint8_t >& inputBuffer )
{
    return {inputBuffer.rbegin(), inputBuffer.rend()};
}

double
HelloWorldBuiltinTypesStub::methodWithFloatAndInteger( const float inputFloat,
                                                       const int8_t inputInteger )
{
    return inputFloat * (0.01 * inputInteger);
}

void
HelloWorldBuiltinTypesStub::voidMethod( const int32_t inputNumber )
{
    lastVoidMethodParameter = inputNumber;
}

int32_t HelloWorldBuiltinTypesStub::getVoidMethodParameter ( )
{
    return lastVoidMethodParameter;
}

}

