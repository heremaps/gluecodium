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

#include "stub/test/PlainDataStructuresTestStub.h"

namespace test
{
PlainDataStructuresTestStub::Point
PlainDataStructuresTestStub::createPoint( const double x, const double y )
{
    PlainDataStructuresTestStub::Point output;
    output.x = x;
    output.y = y;
    return output;
}

typecollectiontest::Point
PlainDataStructuresTestStub::createTypeCollectionTestPoint( const double x, const double y )
{
    typecollectiontest::Point output;
    output.x = x;
    output.y = y;
    return output;
}

PlainDataStructuresTestStub::Point
PlainDataStructuresTestStub::swapPointCoordinates( const PlainDataStructuresTestStub::Point& point )
{
    PlainDataStructuresTestStub::Point result;
    result.x = point.y;
    result.y = point.x;
    return result;
}

typecollectiontest::Point
PlainDataStructuresTestStub::swapTypeCollectionTestPointCoordinates(
    const typecollectiontest::Point& point )
{
    typecollectiontest::Point result;
    result.x = point.y;
    result.y = point.x;
    return result;
}

PlainDataStructuresTestStub::Line
PlainDataStructuresTestStub::createLine( const PlainDataStructuresTestStub::Point& pointA,
                                         const PlainDataStructuresTestStub::Point& pointB )
{
    PlainDataStructuresTestStub::Line line;
    line.a = pointA;
    line.b = pointB;
    return line;
}

typecollectiontest::Line
PlainDataStructuresTestStub::createTypeCollectionTestLine( const typecollectiontest::Point& pointA,
                                                           const typecollectiontest::Point& pointB )
{
    typecollectiontest::Line line;
    line.a = pointA;
    line.b = pointB;
    return line;
}

PlainDataStructuresTestStub::ColoredLine
PlainDataStructuresTestStub::createColoredLine( const PlainDataStructuresTestStub::Line& line,
                                                const PlainDataStructuresTestStub::Color& color )
{
    PlainDataStructuresTestStub::ColoredLine coloredLine;
    coloredLine.line = line;
    coloredLine.color = color;
    return coloredLine;
}

PlainDataStructuresTestStub::ColoredLine
PlainDataStructuresTestStub::returnColoredLine( const PlainDataStructuresTestStub::ColoredLine& input )
{
    return input;
}

PlainDataStructuresTestStub::AllTypesStruct
PlainDataStructuresTestStub::returnAllTypesStruct(
                                         const PlainDataStructuresTestStub::AllTypesStruct& input )
{
    return input;
}

typecollectiontest::ColoredLine
PlainDataStructuresTestStub::createTypeCollectionTestColoredLine(
    const typecollectiontest::Line& line, const typecollectiontest::Color& color )
{
    typecollectiontest::ColoredLine coloredLine;
    coloredLine.line = line;
    coloredLine.color = color;
    return coloredLine;
}

PlainDataStructuresTestStub::AllTypesStruct
PlainDataStructuresTestStub::modifyAllTypesStruct(
    const PlainDataStructuresTestStub::AllTypesStruct& input )
{
    AllTypesStruct output;
    output.int8Field = input.int8Field + 1;
    output.uint8Field = input.uint8Field + 1;
    output.int16Field = input.int16Field + 1;
    output.uint16Field = input.uint16Field + 1;
    output.int32Field = input.int32Field + 1;
    output.uint32Field = input.uint32Field + 1;
    output.int64Field = input.int64Field + 1;
    output.uint64Field = input.uint64Field + 1;
    output.floatField = input.floatField + 1.0f;
    output.doubleField = input.doubleField + 1.0;
    output.stringField = "Hello " + input.stringField;
    output.booleanField = !input.booleanField;
    output.bytesField = {input.bytesField.rbegin( ), input.bytesField.rend( )};
    output.pointField = PlainDataStructuresTestStub::swapPointCoordinates( input.pointField );
    return output;
}

typecollectiontest::AllTypesStruct
PlainDataStructuresTestStub::modifyTypeCollectionTestAllTypesStruct(
    const typecollectiontest::AllTypesStruct& input )
{
    typecollectiontest::AllTypesStruct output;
    output.int8Field = input.int8Field + 1;
    output.uint8Field = input.uint8Field + 1;
    output.int16Field = input.int16Field + 1;
    output.uint16Field = input.uint16Field + 1;
    output.int32Field = input.int32Field + 1;
    output.uint32Field = input.uint32Field + 1;
    output.int64Field = input.int64Field + 1;
    output.uint64Field = input.uint64Field + 1;
    output.floatField = input.floatField + 1.0f;
    output.doubleField = input.doubleField + 1.0;
    output.stringField = "Hello " + input.stringField;
    output.booleanField = !input.booleanField;
    output.bytesField = {input.bytesField.rbegin( ), input.bytesField.rend( )};
    output.pointField
        = PlainDataStructuresTestStub::swapTypeCollectionTestPointCoordinates( input.pointField );
    return output;
}
}
