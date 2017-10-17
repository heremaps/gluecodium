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

#include "hello/HelloWorldArrays.h"

namespace hello
{

::std::vector< ::std::string >
HelloWorldArrays::methodWithArray( const ::std::vector< ::std::string >& input )
{
    return { input.rbegin( ), input.rend( ) };
}

::std::vector<  uint32_t >
HelloWorldArrays::methodWithArrayInline( const ::std::vector<  uint32_t >& input )
{
    return { input.rbegin( ), input.rend( ) };
}

::std::vector< ::hello::HelloWorldArrays::ExampleStruct >
HelloWorldArrays::methodWithStructArray(
    const ::std::vector< ::hello::HelloWorldArrays::ExampleStruct >& input )
{
    return {input.rbegin( ), input.rend( )};
}

}
