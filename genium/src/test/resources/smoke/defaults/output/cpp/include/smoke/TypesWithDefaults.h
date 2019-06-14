// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "foo/Bar.h"
#include "genium/Export.h"
#include <cstdint>
#include <string>
namespace smoke {
enum class SomeEnum {
    FOO_VALUE,
    BAR_VALUE
};
struct _GENIUM_CPP_EXPORT StructWithDefaults {
    int32_t int_field = 42;
    uint32_t uint_field = 4294967295;
    float float_field = 3.14f;
    double double_field = -1.4142;
    bool bool_field = true;
    ::std::string string_field = "\\Jonny \"Magic\" Smith\n";
    ::smoke::SomeEnum enum_field = ::smoke::SomeEnum::BAR_VALUE;
    StructWithDefaults( );
    StructWithDefaults( const int32_t int_field, const uint32_t uint_field, const float float_field, const double double_field, const bool bool_field, const ::std::string& string_field, const ::smoke::SomeEnum enum_field );
};
struct _GENIUM_CPP_EXPORT ImmutableStructWithDefaults {
    const int32_t int_field = 42;
    const uint32_t uint_field;
    const float float_field = 3.14f;
    const double double_field = -1.4142;
    const bool bool_field;
    const ::std::string string_field = "\\Jonny \"Magic\" Smith\n";
    const ::smoke::SomeEnum enum_field = ::smoke::SomeEnum::BAR_VALUE;
    const ::fire::SomeVeryExternalEnum external_enum_field = ::fire::SomeVeryExternalEnum::Another_Value;
    ImmutableStructWithDefaults( const uint32_t uint_field, const bool bool_field );
    ImmutableStructWithDefaults( const int32_t int_field, const uint32_t uint_field, const float float_field, const double double_field, const bool bool_field, const ::std::string& string_field, const ::smoke::SomeEnum enum_field, const ::fire::SomeVeryExternalEnum external_enum_field );
};
}