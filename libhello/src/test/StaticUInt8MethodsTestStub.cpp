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

#include "stub/test/StaticUInt8MethodsTestStub.h"

namespace test {

uint8_t
StaticUInt8MethodsTestStub::returnNextNumber( const uint8_t inputNumber )
{
    return inputNumber + 1;
}

uint8_t
StaticUInt8MethodsTestStub::sumTwoNumbers( const uint8_t inputNumber1, const uint8_t inputNumber2 )
{
    return inputNumber1 + inputNumber2;
}

uint8_t
StaticUInt8MethodsTestStub::returnPrime(  )
{
    return 131;
}

}

