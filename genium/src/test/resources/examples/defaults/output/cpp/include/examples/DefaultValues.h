// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Hash.h"
#include <cstdint>
#include <string>
namespace examples {
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
    float float_field = 3.14f;
    bool bool_field = true;
    ::std::string string_field = "some string";
    ::examples::DefaultValues::SomeEnum enum_field = ::examples::DefaultValues::SomeEnum::BAR_VALUE;
    StructWithDefaults( );
    StructWithDefaults( const int32_t int_field, const float float_field, const bool bool_field, const ::std::string& string_field, const ::examples::DefaultValues::SomeEnum enum_field );
};
};
}
namespace genium {
template<>
struct hash< ::examples::DefaultValues::SomeEnum > {
    std::size_t operator( )( const ::examples::DefaultValues::SomeEnum& t ) const;
};
}