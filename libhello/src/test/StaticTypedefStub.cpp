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

#include "stub/test/TypeCollection.h"
#include "stub/test/StaticTypedefStub.h"

namespace test
{

StaticTypedefStub::IntTypedef
StaticTypedefStub::returnIntTypedef( const ::test::StaticTypedefStub::IntTypedef input )
{
    return input + 1;
}

StaticTypedefStub::NestedIntTypedef
StaticTypedefStub::returnNestedIntTypedef( const ::test::StaticTypedefStub::NestedIntTypedef input )
{
    return input + 1;
}

StaticTypedefStub::StringTypedef
StaticTypedefStub::returnStringTypedef( const ::test::StaticTypedefStub::StringTypedef& input )
{
    return "Hello " + input;
}

StaticTypedefStub::ByteArrayTypedef
StaticTypedefStub::returnByteBufferTypedef( const ::test::StaticTypedefStub::ByteArrayTypedef& input )
{
    return { input.rbegin(), input.rend() };
}

StaticTypedefStub::ExampleStructTypedef
StaticTypedefStub::returnExampleStructTypedef( const ::test::StaticTypedefStub::ExampleStructTypedef& input )
{
    StaticTypedefStub::ExampleStructTypedef result;
    result.exampleString = "Hello " + input.exampleString;
    return result;
}

::test::typecollection::PointTypedef
StaticTypedefStub::returnTypedefPointFromTypeCollection( const ::test::typecollection::PointTypedef& input )
{
    return input;
}

StaticTypedefStub::NestedStructTypedef
StaticTypedefStub::returnNestedStructTypedef( const ::test::StaticTypedefStub::NestedStructTypedef& input )
{
    StaticTypedefStub::NestedStructTypedef result;
    result.exampleString = "Hello " + input.exampleString;
    return result;
}

}
