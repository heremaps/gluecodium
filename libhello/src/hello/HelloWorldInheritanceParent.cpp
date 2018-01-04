// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include "hello/HelloWorldInheritanceParent.h"

#include <sstream>

namespace hello
{

std::string
HelloWorldInheritanceParent::hello_world_parent_method( const std::string& input )
{
    std::stringstream ss;
    ss << "hello_world_parent_method, input string: " << input;

    return ss.str( );
}

}
