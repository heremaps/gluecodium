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

#include "test/StaticStringMethods.h"

namespace test {

std::string
StaticStringMethods::return_input_string( const std::string& input_string )
{
    return input_string;
}

std::string
StaticStringMethods::concatenate_strings( const std::string& input_string1,
                                             const std::string& input_string2 )
{
    return input_string1 + input_string2;
}

std::string
StaticStringMethods::return_hello_string(  )
{
    return "hello";
}

std::string
StaticStringMethods::return_empty(  )
{
    return "";
}

}
