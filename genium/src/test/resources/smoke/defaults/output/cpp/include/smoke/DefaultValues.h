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
    uint32_t uint_field = 4294967295;
    float float_field = 3.14;
    bool bool_field = true;
    ::std::string string_field = "\\Jonny \"Magic\" Smith\n";
    ::smoke::DefaultValues::SomeEnum enum_field = ::smoke::DefaultValues::SomeEnum::BAR_VALUE;
};
public:
static ::smoke::DefaultValues::StructWithDefaults process_struct_with_defaults( const ::smoke::DefaultValues::StructWithDefaults& input );
};

}