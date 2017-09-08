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

#include "test/TypeCollection.h"
#include "test/StaticTypedef.h"

namespace test
{

StaticTypedef::IntTypedef
StaticTypedef::returnIntTypedef( const ::test::StaticTypedef::IntTypedef input )
{
    return input + 1;
}

StaticTypedef::NestedIntTypedef
StaticTypedef::returnNestedIntTypedef( const ::test::StaticTypedef::NestedIntTypedef input )
{
    return input + 1;
}

StaticTypedef::StringTypedef
StaticTypedef::returnStringTypedef( const ::test::StaticTypedef::StringTypedef& input )
{
    return "Hello " + input;
}

StaticTypedef::ByteArrayTypedef
StaticTypedef::returnByteBufferTypedef( const ::test::StaticTypedef::ByteArrayTypedef& input )
{
    return { input.rbegin(), input.rend() };
}

StaticTypedef::ExampleStructTypedef
StaticTypedef::returnExampleStructTypedef( const ::test::StaticTypedef::ExampleStructTypedef& input )
{
    StaticTypedef::ExampleStructTypedef result;
    result.exampleString = "Hello " + input.exampleString;
    return result;
}

::test::typecollection::PointTypedef
StaticTypedef::returnTypedefPointFromTypeCollection( const ::test::typecollection::PointTypedef& input )
{
    return input;
}

StaticTypedef::NestedStructTypedef
StaticTypedef::returnNestedStructTypedef( const ::test::StaticTypedef::NestedStructTypedef& input )
{
    StaticTypedef::NestedStructTypedef result;
    result.exampleString = "Hello " + input.exampleString;
    return result;
}

}
