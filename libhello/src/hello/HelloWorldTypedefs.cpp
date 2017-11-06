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

#include "hello/HelloWorldTypedefs.h"
#include <algorithm>
#include <cctype>

namespace hello
{
HelloWorldTypedefs::RenamedTwiceStruct
HelloWorldTypedefs::method_with_type_def(
    const ::hello::HelloWorldTypedefs::RenamedTwiceStruct& input )
{
    std::string uppercase_string = input.text;
    std::transform( uppercase_string.begin( ), uppercase_string.end( ), uppercase_string.begin( ),
                    ::toupper );
    return {uppercase_string};
}
}
