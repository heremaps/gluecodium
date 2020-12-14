// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <memory>
#include <string>
#include <vector>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT Point {
    double x;
    double y;
    Point( );
    Point( double x, double y );
};
using PointTypedef = ::smoke::Point;
struct _GLUECODIUM_CPP_EXPORT Line {
    ::smoke::Point a;
    ::smoke::Point b;
    Line( );
    Line( ::smoke::Point a, ::smoke::Point b );
};
struct _GLUECODIUM_CPP_EXPORT AllTypesStruct {
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
    AllTypesStruct( int8_t int8_field, uint8_t uint8_field, int16_t int16_field, uint16_t uint16_field, int32_t int32_field, uint32_t uint32_field, int64_t int64_field, uint64_t uint64_field, float float_field, double double_field, ::std::string string_field, bool boolean_field, ::std::shared_ptr< ::std::vector< uint8_t > > bytes_field, ::smoke::Point point_field );
};
}
