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

#include "stub/test/StaticStringMethods.h"

namespace test {

std::string
StaticStringMethods::returnInputString( const std::string& inputString )
{
    return inputString;
}

std::string
StaticStringMethods::concatenateStrings( const std::string& inputString1,
                                             const std::string& inputString2 )
{
    return inputString1 + inputString2;
}

std::string
StaticStringMethods::returnHelloString(  )
{
    return "hello";
}

std::string
StaticStringMethods::returnEmpty(  )
{
    return "";
}

}
