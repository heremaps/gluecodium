// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/VectorHash.h"
#include "smoke/DefaultValues.h"
#include "smoke/TypesWithDefaults.h"
#include <cstdint>
#include <vector>
namespace smoke {
struct _GENIUM_CPP_EXPORT StructWithInitializerDefaults {
    ::std::vector< int32_t > ints_field = {4, -2, 42};
    ::smoke::DefaultValues::FloatArray floats_field = {3.14f, -std::numeric_limits<float>::infinity()};
    ::smoke::StructWithAnEnum struct_field = {::smoke::AnEnum::DISABLED};
    ::smoke::DefaultValues::StringSet set_type_field = {"foo", "bar"};
    StructWithInitializerDefaults( );
    StructWithInitializerDefaults( const ::std::vector< int32_t >& ints_field, const ::smoke::DefaultValues::FloatArray& floats_field, const ::smoke::StructWithAnEnum& struct_field, const ::smoke::DefaultValues::StringSet& set_type_field );
};
}
