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

#include "cpp/test/PlainDataStructuresFromTypeCollection.h"

namespace test
{
typecollection::Point
PlainDataStructuresFromTypeCollection::createPoint( const double x, const double y )
{
    typecollection::Point output;
    output.x = x;
    output.y = y;
    return output;
}

typecollection::Point
PlainDataStructuresFromTypeCollection::swapPointCoordinates(
    const typecollection::Point& point )
{
    typecollection::Point result;
    result.x = point.y;
    result.y = point.x;
    return result;
}

typecollection::Line
PlainDataStructuresFromTypeCollection::createLine( const typecollection::Point& pointA,
                                                   const typecollection::Point& pointB )
{
    typecollection::Line line;
    line.a = pointA;
    line.b = pointB;
    return line;
}

typecollection::ColoredLine
PlainDataStructuresFromTypeCollection::createColoredLine(
    const typecollection::Line& line, const typecollection::Color& color )
{
    typecollection::ColoredLine coloredLine;
    coloredLine.line = line;
    coloredLine.color = color;
    return coloredLine;
}

typecollection::AllTypesStruct
PlainDataStructuresFromTypeCollection::modifyAllTypesStruct(
    const typecollection::AllTypesStruct& input )
{
    typecollection::AllTypesStruct output;
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
        = PlainDataStructuresFromTypeCollection::swapPointCoordinates( input.pointField );
    return output;
}
}
