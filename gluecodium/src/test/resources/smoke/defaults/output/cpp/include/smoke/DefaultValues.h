// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <limits>
#include <optional>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT DefaultValues {
public:
    DefaultValues();
    virtual ~DefaultValues() = 0;
public:
    using LongTypedef = int64_t;
    using BooleanTypedef = bool;
    using StringTypedef = ::std::string;
    using FloatArray = ::std::vector< float >;
    using IdToStringMap = ::std::unordered_map< uint32_t, ::std::string >;
    using StringSet = ::std::unordered_set< ::std::string >;
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
    struct _GLUECODIUM_CPP_EXPORT NullableStructWithDefaults {
        std::optional< int32_t > int_field = std::optional< int32_t >();
        std::optional< uint32_t > uint_field = std::optional< uint32_t >();
        std::optional< float > float_field = std::optional< float >();
        std::optional< bool > bool_field = std::optional< bool >();
        std::optional< ::std::string > string_field = std::optional< ::std::string >();
        NullableStructWithDefaults( );
        NullableStructWithDefaults( std::optional< int32_t > int_field, std::optional< uint32_t > uint_field, std::optional< float > float_field, std::optional< bool > bool_field, std::optional< ::std::string > string_field );
    };
    struct _GLUECODIUM_CPP_EXPORT StructWithSpecialDefaults {
        float float_nan_field = std::numeric_limits<float>::quiet_NaN();
        float float_infinity_field = std::numeric_limits<float>::infinity();
        float float_negative_infinity_field = -std::numeric_limits<float>::infinity();
        double double_nan_field = std::numeric_limits<double>::quiet_NaN();
        double double_infinity_field = std::numeric_limits<double>::infinity();
        double double_negative_infinity_field = -std::numeric_limits<double>::infinity();
        StructWithSpecialDefaults( );
        StructWithSpecialDefaults( float float_nan_field, float float_infinity_field, float float_negative_infinity_field, double double_nan_field, double double_infinity_field, double double_negative_infinity_field );
    };
    struct _GLUECODIUM_CPP_EXPORT StructWithEmptyDefaults {
        ::std::vector< int32_t > ints_field = {};
        ::smoke::DefaultValues::FloatArray floats_field = {};
        ::smoke::DefaultValues::IdToStringMap map_field = {};
        ::smoke::DefaultValues::StructWithDefaults struct_field = ::smoke::DefaultValues::StructWithDefaults{};
        ::smoke::DefaultValues::StringSet set_type_field = {};
        StructWithEmptyDefaults( );
        StructWithEmptyDefaults( ::std::vector< int32_t > ints_field, ::smoke::DefaultValues::FloatArray floats_field, ::smoke::DefaultValues::IdToStringMap map_field, ::smoke::DefaultValues::StructWithDefaults struct_field, ::smoke::DefaultValues::StringSet set_type_field );
    };
    struct _GLUECODIUM_CPP_EXPORT StructWithTypedefDefaults {
        ::smoke::DefaultValues::LongTypedef long_field = 42;
        ::smoke::DefaultValues::BooleanTypedef bool_field = true;
        ::smoke::DefaultValues::StringTypedef string_field = "\\Jonny \"Magic\" Smith\n";
        StructWithTypedefDefaults( );
        StructWithTypedefDefaults( ::smoke::DefaultValues::LongTypedef long_field, ::smoke::DefaultValues::BooleanTypedef bool_field, ::smoke::DefaultValues::StringTypedef string_field );
    };
public:
    static ::smoke::DefaultValues::StructWithDefaults process_struct_with_defaults( const ::smoke::DefaultValues::StructWithDefaults& input );
};
}
