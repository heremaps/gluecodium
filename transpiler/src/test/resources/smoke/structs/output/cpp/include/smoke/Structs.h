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
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <cstdint>

#include <string>
#include <vector>

namespace smoke {

class Structs {
public:
    virtual ~Structs() = 0;
public:
struct Point {
    double x;
    double y;
};
struct Color {
    uint8_t red;
    uint8_t green;
    uint8_t blue;
};
struct Line {
    ::smoke::Structs::Point a;
    ::smoke::Structs::Point b;
};
struct ColoredLine {
    ::smoke::Structs::Line line;
    ::smoke::Structs::Color color;
};
struct AllTypesStruct {
    int8_t int8_field;
    uint8_t uint8_field;
    int16_t int16_field;
    uint16_t uint16_field;
    int32_t int32_field;
    uint32_t uint32_field;
    int64_t int64_field;
    uint64_t uint64_field;
    float float_field;
    double double_field;
    ::std::string string_field;
    bool boolean_field;
    ::std::vector< uint8_t > bytes_field;
    ::smoke::Structs::Point point_field;
};

public:
static ::smoke::Structs::Point create_point( const double x, const double y );
static ::smoke::Structs::Point swap_point_coordinates( const ::smoke::Structs::Point& input );
static ::smoke::Structs::Line create_line( const ::smoke::Structs::Point& point_a, const ::smoke::Structs::Point& point_b );
static ::smoke::Structs::ColoredLine create_colored_line( const ::smoke::Structs::Line& line, const ::smoke::Structs::Color& color );
static ::smoke::Structs::ColoredLine return_colored_line( const ::smoke::Structs::ColoredLine& input );
static ::smoke::Structs::AllTypesStruct return_all_types_struct( const ::smoke::Structs::AllTypesStruct& input );
static ::smoke::Structs::AllTypesStruct modify_all_types_struct( const ::smoke::Structs::AllTypesStruct& input );

};

}
