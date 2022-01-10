// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "foo/Bar.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/AnEnum.h"
#include <cstdint>
#include <string>
namespace smoke {
enum class SomeEnum {
    FOO_VALUE,
    BAR_VALUE
};
struct _GLUECODIUM_CPP_EXPORT StructWithDefaults {
    int32_t int_field = 42;
    uint32_t uint_field = 4294967295;
    float float_field = 3.14f;
    double double_field = -1.4142;
    bool bool_field = true;
    ::std::string string_field = "\\Jonny \"Magic\" Smith\n";
    ::smoke::SomeEnum enum_field = ::smoke::SomeEnum::BAR_VALUE;
    StructWithDefaults( );
    StructWithDefaults( int32_t int_field, uint32_t uint_field, float float_field, double double_field, bool bool_field, ::std::string string_field, ::smoke::SomeEnum enum_field );
};
struct _GLUECODIUM_CPP_EXPORT ImmutableStructWithDefaults {
    const int32_t int_field = 42;
    const uint32_t uint_field;
    const float float_field = 3.14f;
    const double double_field = -1.4142;
    const bool bool_field;
    const ::std::string string_field = "\\Jonny \"Magic\" Smith\n";
    const ::smoke::SomeEnum enum_field = ::smoke::SomeEnum::BAR_VALUE;
    const ::fire::SomeVeryExternalEnum external_enum_field = ::fire::SomeVeryExternalEnum::Another_Value;
    ImmutableStructWithDefaults( uint32_t uint_field, bool bool_field );
    ImmutableStructWithDefaults( int32_t int_field, uint32_t uint_field, float float_field, double double_field, bool bool_field, ::std::string string_field, ::smoke::SomeEnum enum_field, ::fire::SomeVeryExternalEnum external_enum_field );
};
struct _GLUECODIUM_CPP_EXPORT StructWithAnEnum {
    ::smoke::AnEnum config = ::smoke::AnEnum::ENABLED;
    StructWithAnEnum( );
    explicit StructWithAnEnum( ::smoke::AnEnum config );
};
}
