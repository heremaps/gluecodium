// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/VectorHash.h"
#include "smoke/DefaultValues.h"
#include "smoke/TypesWithDefaults.h"
#include <cstdint>
#include <limits>
#include <vector>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructWithInitializerDefaults {
    ::std::vector< int32_t > ints_field = {4, -2, 42};
    ::smoke::DefaultValues::FloatArray floats_field = {3.14f, -std::numeric_limits<float>::infinity()};
    ::smoke::StructWithAnEnum struct_field = {::smoke::AnEnum::DISABLED};
    ::smoke::DefaultValues::StringSet set_type_field = {"foo", "bar"};
    ::smoke::DefaultValues::IdToStringMap map_field = {{1, "foo"}, {42, "bar"}};
    StructWithInitializerDefaults( );
    StructWithInitializerDefaults( ::std::vector< int32_t > ints_field, ::smoke::DefaultValues::FloatArray floats_field, ::smoke::StructWithAnEnum struct_field, ::smoke::DefaultValues::StringSet set_type_field, ::smoke::DefaultValues::IdToStringMap map_field );
};
}
