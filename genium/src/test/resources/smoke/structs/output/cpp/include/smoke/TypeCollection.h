// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <cstdint>
#include <memory>
#include <string>
#include <vector>

namespace smoke {

struct Point {
    double x;
    double y;
    Point( );
    Point( const double x, const double y );
};
using PointTypedef = ::smoke::Point;
struct Color {
    uint8_t red;
    uint8_t green;
    uint8_t blue;
    Color( );
    Color( const uint8_t red, const uint8_t green, const uint8_t blue );
};
struct Line {
    ::smoke::Point a;
    ::smoke::Point b;
    Line( );
    Line( const ::smoke::Point& a, const ::smoke::Point& b );
};
struct ColoredLine {
    ::smoke::Line line;
    ::smoke::Color color;
    ColoredLine( );
    ColoredLine( const ::smoke::Line& line, const ::smoke::Color& color );
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
    ::std::shared_ptr< ::std::vector< uint8_t > > bytes_field;
    ::smoke::Point point_field;
    AllTypesStruct( );
    AllTypesStruct( const int8_t int8_field, const uint8_t uint8_field, const int16_t int16_field, const uint16_t uint16_field, const int32_t int32_field, const uint32_t uint32_field, const int64_t int64_field, const uint64_t uint64_field, const float float_field, const double double_field, const ::std::string& string_field, const bool boolean_field, const ::std::shared_ptr< ::std::vector< uint8_t > >& bytes_field, const ::smoke::Point& point_field );
};

}
