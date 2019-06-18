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
#include "genium/Optional.h"
#include <cstdint>
#include <limits>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
namespace smoke {
class _GENIUM_CPP_EXPORT DefaultValues {
public:
    virtual ~DefaultValues() = 0;
public:
enum class SomeEnum {
    FOO_VALUE,
    BAR_VALUE
};
using LongTypedef = int64_t;
using BooleanTypedef = bool;
using StringTypedef = ::std::string;
using EnumTypedef = ::smoke::DefaultValues::SomeEnum;
using FloatArray = ::std::vector< float >;
using IdToStringMap = ::std::unordered_map< uint32_t, ::std::string >;
using StringSet = ::std::unordered_set< ::std::string >;
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
struct _GENIUM_CPP_EXPORT NullableStructWithDefaults {
    ::genium::optional< int32_t > int_field = ::genium::optional< int32_t >();
    ::genium::optional< uint32_t > uint_field = ::genium::optional< uint32_t >();
    ::genium::optional< float > float_field = ::genium::optional< float >();
    ::genium::optional< bool > bool_field = ::genium::optional< bool >();
    ::genium::optional< ::std::string > string_field = ::genium::optional< ::std::string >();
    ::genium::optional< ::smoke::DefaultValues::SomeEnum > enum_field = ::genium::optional< ::smoke::DefaultValues::SomeEnum >();
    NullableStructWithDefaults( );
    NullableStructWithDefaults( const ::genium::optional< int32_t >& int_field, const ::genium::optional< uint32_t >& uint_field, const ::genium::optional< float >& float_field, const ::genium::optional< bool >& bool_field, const ::genium::optional< ::std::string >& string_field, const ::genium::optional< ::smoke::DefaultValues::SomeEnum >& enum_field );
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
struct _GENIUM_CPP_EXPORT StructWithEmptyDefaults {
    ::std::vector< int32_t > ints_field = {};
    ::smoke::DefaultValues::FloatArray floats_field = {};
    ::smoke::DefaultValues::IdToStringMap map_field = {};
    ::smoke::DefaultValues::StructWithDefaults struct_field = {};
    ::smoke::DefaultValues::StringSet set_type_field = {};
    StructWithEmptyDefaults( );
    StructWithEmptyDefaults( const ::std::vector< int32_t >& ints_field, const ::smoke::DefaultValues::FloatArray& floats_field, const ::smoke::DefaultValues::IdToStringMap& map_field, const ::smoke::DefaultValues::StructWithDefaults& struct_field, const ::smoke::DefaultValues::StringSet& set_type_field );
};
struct _GENIUM_CPP_EXPORT StructWithTypedefDefaults {
    ::smoke::DefaultValues::LongTypedef long_field = 42;
    ::smoke::DefaultValues::BooleanTypedef bool_field = true;
    ::smoke::DefaultValues::StringTypedef string_field = "\\Jonny \"Magic\" Smith\n";
    ::smoke::DefaultValues::EnumTypedef enum_field = ::smoke::DefaultValues::SomeEnum::BAR_VALUE;
    StructWithTypedefDefaults( );
    StructWithTypedefDefaults( const ::smoke::DefaultValues::LongTypedef long_field, const ::smoke::DefaultValues::BooleanTypedef bool_field, const ::smoke::DefaultValues::StringTypedef& string_field, const ::smoke::DefaultValues::EnumTypedef enum_field );
};
public:
static ::smoke::DefaultValues::StructWithDefaults process_struct_with_defaults( const ::smoke::DefaultValues::StructWithDefaults& input );
};
}