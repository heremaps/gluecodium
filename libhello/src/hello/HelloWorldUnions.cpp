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

#include "hello/HelloWorldUnions.h"
#include <algorithm>
#include <cctype>
#include <string>

namespace hello
{
HelloWorldUnions::NavigationError
HelloWorldUnions::methodWithUnion( const ::hello::HelloWorldUnions::NavigationError& input )
{
    if ( input.type == NavigationError::ERRORMESSAGE )
    {
        std::string message = input.errorMessage;
        std::transform( message.begin( ), message.end( ), message.begin( ), ::toupper );
        return HelloWorldUnions::NavigationError( message );
    }
    else
    {
        return HelloWorldUnions::NavigationError( input.errorNumber + 1 );
    }
}
}
