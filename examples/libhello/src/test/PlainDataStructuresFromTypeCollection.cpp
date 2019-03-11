// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

#include "test/PlainDataStructuresFromTypeCollection.h"

namespace test
{
Point
PlainDataStructuresFromTypeCollection::create_point( const double x, const double y )
{
    Point output;
    output.x = x;
    output.y = y;
    return output;
}

Point
PlainDataStructuresFromTypeCollection::swap_point_coordinates( const Point& point )
{
    Point result;
    result.x = point.y;
    result.y = point.x;
    return result;
}

Line
PlainDataStructuresFromTypeCollection::create_line( const Point& pointA, const Point& pointB )
{
    Line line;
    line.a = pointA;
    line.b = pointB;
    return line;
}

ColoredLine
PlainDataStructuresFromTypeCollection::create_colored_line( const Line& line, const Color& color )
{
    ColoredLine colored_line;
    colored_line.line = line;
    colored_line.color = color;
    return colored_line;
}

AllTypesStruct
PlainDataStructuresFromTypeCollection::modify_all_types_struct( const AllTypesStruct& input )
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
    output.point_field
        = PlainDataStructuresFromTypeCollection::swap_point_coordinates( input.point_field );
    return output;
}
}
