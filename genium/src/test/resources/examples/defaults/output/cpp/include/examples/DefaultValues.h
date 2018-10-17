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

namespace examples {

class DefaultValues {
public:
    virtual ~DefaultValues() = 0;

public:
enum class SomeEnum {
    FOO_VALUE,
    BAR_VALUE
};

struct StructWithDefaults {
    int32_t int_field = 42;
    float float_field = 3.14;
    bool bool_field = true;
    ::std::string string_field = "some string";
    ::examples::DefaultValues::SomeEnum enum_field = ::examples::DefaultValues::SomeEnum::BAR_VALUE;

    StructWithDefaults( );
    StructWithDefaults( const int32_t int_field, const float float_field, const bool bool_field, const ::std::string& string_field, const ::examples::DefaultValues::SomeEnum enum_field );
};
};

}
