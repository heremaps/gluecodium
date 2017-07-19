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

#include "stub/test/StaticBooleanMethodsTestStub.h"

namespace test {

bool
StaticBooleanMethodsTestStub::returnInvertedBoolean( const bool input )
{
    return !input;
}

bool
StaticBooleanMethodsTestStub::returnAndBoolean( const bool input1, const bool input2 )
{
    return input1 && input2;
}

}

