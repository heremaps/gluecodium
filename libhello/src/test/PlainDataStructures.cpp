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

#include "test/PlainDataStructures.h"

namespace test
{
PlainDataStructures::Point
PlainDataStructures::create_point( const double x, const double y )
{
    PlainDataStructures::Point output;
    output.x = x;
    output.y = y;
    return output;
}

PlainDataStructures::Point
PlainDataStructures::swap_point_coordinates( const PlainDataStructures::Point& point )
{
    PlainDataStructures::Point result;
    result.x = point.y;
    result.y = point.x;
    return result;
}

PlainDataStructures::Line
PlainDataStructures::create_line( const PlainDataStructures::Point& pointA,
                                  const PlainDataStructures::Point& pointB )
{
    PlainDataStructures::Line line;
    line.a = pointA;
    line.b = pointB;
    return line;
}

PlainDataStructures::ColoredLine
PlainDataStructures::create_colored_line( const PlainDataStructures::Line& line,
                                          const PlainDataStructures::Color& color )
{
    PlainDataStructures::ColoredLine coloredLine;
    coloredLine.line = line;
    coloredLine.color = color;
    return coloredLine;
}

PlainDataStructures::ColoredLine
PlainDataStructures::return_colored_line( const PlainDataStructures::ColoredLine& input )
{
    return input;
}

PlainDataStructures::AllTypesStruct
PlainDataStructures::return_all_types_struct( const PlainDataStructures::AllTypesStruct& input )
{
    return input;
}

PlainDataStructures::AllTypesStruct
PlainDataStructures::modify_all_types_struct( const PlainDataStructures::AllTypesStruct& input )
{
    AllTypesStruct output;
    output.int8_field = input.int8_field + 1;
    output.uint8_field = input.uint8_field + 1;
    output.int16_field = input.int16_field + 1;
    output.uint16_field = input.uint16_field + 1;
    output.int32_field = input.int32_field + 1;
    output.uint32_field = input.uint32_field + 1;
    output.int64_field = input.int64_field + 1;
    output.uint64_field = input.uint64_field + 1;
    output.float_field = input.float_field + 1.0f;
    output.double_field = input.double_field + 1.0;
    output.string_field = "Hello " + input.string_field;
    output.boolean_field = !input.boolean_field;
    output.bytes_field = {input.bytes_field.rbegin( ), input.bytes_field.rend( )};
    output.point_field = PlainDataStructures::swap_point_coordinates( input.point_field );
    return output;
}

PlainDataStructures::ColoredLineInherited
PlainDataStructures::create_colored_line_inherited( const PlainDataStructures::Line& line,
                                                    const PlainDataStructures::Color& color )
{
    PlainDataStructures::ColoredLineInherited coloredLine;
    coloredLine.a = line.a;
    coloredLine.b = line.b;
    coloredLine.color = color;
    return coloredLine;
}

PlainDataStructures::ColoredLineInherited
PlainDataStructures::return_colored_line_inherited(
    const PlainDataStructures::ColoredLineInherited& input )
{
    return input;
}

}
