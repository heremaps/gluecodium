// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "Export.h"
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include <cstdint>
#include <memory>
#include <string>
#include <vector>

namespace smoke {
class _GENIUM_CPP_EXPORT Structs {
public:
    virtual ~Structs() = 0;
public:
enum class FooBar {
    FOO,
    BAR
};
struct _GENIUM_CPP_EXPORT Point {
    double x;
    double y;
    Point( );
    Point( const double x, const double y );
};
struct _GENIUM_CPP_EXPORT Color {
    uint8_t red;
    uint8_t green;
    uint8_t blue;
    Color( );
    Color( const uint8_t red, const uint8_t green, const uint8_t blue );
};
struct _GENIUM_CPP_EXPORT Line {
    ::smoke::Structs::Point a;
    ::smoke::Structs::Point b;
    Line( );
    Line( const ::smoke::Structs::Point& a, const ::smoke::Structs::Point& b );
};
struct _GENIUM_CPP_EXPORT ColoredLine {
    ::smoke::Structs::Line line;
    ::smoke::Structs::Color color;
    ColoredLine( );
    ColoredLine( const ::smoke::Structs::Line& line, const ::smoke::Structs::Color& color );
};
struct _GENIUM_CPP_EXPORT AllTypesStruct {
    const int8_t int8_field;
    const uint8_t uint8_field;
    const int16_t int16_field;
    const uint16_t uint16_field;
    const int32_t int32_field;
    const uint32_t uint32_field;
    const int64_t int64_field;
    const uint64_t uint64_field;
    const float float_field;
    const double double_field;
    const ::std::string string_field;
    const bool boolean_field;
    const ::std::shared_ptr< ::std::vector< uint8_t > > bytes_field;
    const ::smoke::Structs::Point point_field;
    AllTypesStruct( );
    AllTypesStruct( const int8_t int8_field, const uint8_t uint8_field, const int16_t int16_field, const uint16_t uint16_field, const int32_t int32_field, const uint32_t uint32_field, const int64_t int64_field, const uint64_t uint64_field, const float float_field, const double double_field, const ::std::string& string_field, const bool boolean_field, const ::std::shared_ptr< ::std::vector< uint8_t > >& bytes_field, const ::smoke::Structs::Point& point_field );
};
struct _GENIUM_CPP_EXPORT NestingImmutableStruct {
    ::smoke::Structs::AllTypesStruct struct_field;
    NestingImmutableStruct( );
    NestingImmutableStruct( const ::smoke::Structs::AllTypesStruct& struct_field );
};

public:
static ::smoke::Structs::Point create_point( const double x, const double y );
static ::smoke::Structs::Point swap_point_coordinates( const ::smoke::Structs::Point& input );
static ::smoke::Structs::Line create_line( const ::smoke::Structs::Point& point_a, const ::smoke::Structs::Point& point_b );
static ::smoke::Structs::ColoredLine create_colored_line( const ::smoke::Structs::Line& line, const ::smoke::Structs::Color& color );
static ::smoke::Structs::ColoredLine return_colored_line( const ::smoke::Structs::ColoredLine& input );
static ::smoke::Structs::AllTypesStruct return_all_types_struct( const ::smoke::Structs::AllTypesStruct& input );
static ::smoke::Structs::AllTypesStruct modify_all_types_struct( const ::smoke::Structs::AllTypesStruct& input );
static ::smoke::Structs::ExternalStruct get_external_struct(  );
static ::fire::SomeVeryExternalStruct get_another_external_struct(  );
static ::smoke::Structs::Yet_Another_External_Struct get_yet_another_external_struct(  );
};

}
