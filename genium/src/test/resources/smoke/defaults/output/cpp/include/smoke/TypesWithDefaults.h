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
    float float_field = 3.14;
    bool bool_field = true;
    ::std::string string_field = "\\Jonny \"Magic\" Smith\n";
    ::smoke::SomeEnum enum_field = ::smoke::SomeEnum::BAR_VALUE;
};

}