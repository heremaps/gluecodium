// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructWithDefaults {
    int32_t int_field = 42;
    uint32_t uint_field = 4294967295;
    float float_field = 3.14f;
    double double_field = -1.4142;
    bool bool_field = true;
    ::std::string string_field = "\\Jonny \"Magic\" Smith\n";
    StructWithDefaults( );
    StructWithDefaults( int32_t int_field, uint32_t uint_field, float float_field, double double_field, bool bool_field, ::std::string string_field );
};
struct _GLUECODIUM_CPP_EXPORT ImmutableStructWithDefaults {
    const int32_t int_field = 42;
    const uint32_t uint_field;
    const float float_field = 3.14f;
    const double double_field = -1.4142;
    const bool bool_field;
    const ::std::string string_field = "\\Jonny \"Magic\" Smith\n";
    ImmutableStructWithDefaults( uint32_t uint_field, bool bool_field );
    ImmutableStructWithDefaults( int32_t int_field, uint32_t uint_field, float float_field, double double_field, bool bool_field, ::std::string string_field );
};
}
