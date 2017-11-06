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

#include "test/MethodOverloads.h"

namespace test
{
bool
MethodOverloads::is_boolean( const bool input )
{
    return true;
}

bool
MethodOverloads::is_boolean( const int8_t input )
{
    return false;
}

bool
MethodOverloads::is_boolean( const ::std::string& input )
{
    return false;
}

bool
MethodOverloads::is_boolean( const MethodOverloads::Point& input )
{
    return false;
}

bool
MethodOverloads::is_boolean( const bool input1, const int8_t input2, const ::std::string& input3,
                             const MethodOverloads::Point& input4 )
{
    return false;
}

}
