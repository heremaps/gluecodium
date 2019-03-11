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
#include <cstdint>
#include <limits>
#include <string>
namespace smoke {
class _GENIUM_CPP_EXPORT DefaultValues {
public:
    virtual ~DefaultValues() = 0;
public:
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
    ::smoke::DefaultValues::SomeEnum enum_field = ::smoke::DefaultValues::SomeEnum::BAR_VALUE;
    ::fire::SomeVeryExternalEnum external_enum_field = ::fire::SomeVeryExternalEnum::Another_Value;
    StructWithDefaults( );
    StructWithDefaults( const int32_t int_field, const uint32_t uint_field, const float float_field, const double double_field, const bool bool_field, const ::std::string& string_field, const ::smoke::DefaultValues::SomeEnum enum_field, const ::fire::SomeVeryExternalEnum external_enum_field );
};
struct _GENIUM_CPP_EXPORT StructWithSpecialDefaults {
    float float_nan_field = std::numeric_limits<float>::quiet_NaN();
    float float_infinity_field = std::numeric_limits<float>::infinity();
    float float_negative_infinity_field = -std::numeric_limits<float>::infinity();
    double double_nan_field = std::numeric_limits<double>::quiet_NaN();
    double double_infinity_field = std::numeric_limits<double>::infinity();
    double double_negative_infinity_field = -std::numeric_limits<double>::infinity();
    StructWithSpecialDefaults( );
    StructWithSpecialDefaults( const float float_nan_field, const float float_infinity_field, const float float_negative_infinity_field, const double double_nan_field, const double double_infinity_field, const double double_negative_infinity_field );
};
public:
static ::smoke::DefaultValues::StructWithDefaults process_struct_with_defaults( const ::smoke::DefaultValues::StructWithDefaults& input );
};
}
