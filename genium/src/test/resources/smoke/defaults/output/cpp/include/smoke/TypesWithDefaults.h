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
#include <string>

namespace smoke {

enum class SomeEnum {
    FOO_VALUE,
    BAR_VALUE
};

struct StructWithDefaults {
    int32_t int_field = 42;
    uint32_t uint_field = 4294967295;
    float float_field = 3.14;
    bool bool_field = true;
    ::std::string string_field = "\\Jonny \"Magic\" Smith\n";
    ::smoke::SomeEnum enum_field = ::smoke::SomeEnum::BAR_VALUE;
    StructWithDefaults( );
    StructWithDefaults( const int32_t int_field, const uint32_t uint_field, const float float_field, const bool bool_field, const ::std::string& string_field, const ::smoke::SomeEnum enum_field );
};

}