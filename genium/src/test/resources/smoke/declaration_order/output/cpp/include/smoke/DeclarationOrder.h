// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Hash.h"
#include "genium/UnorderedMapHash.h"
#include "genium/VectorHash.h"
#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
enum class SomeEnum {
    FOO,
    BAR = 7
};
using SomeTypeDef = int32_t;
struct _GENIUM_CPP_EXPORT NestedStruct {
    ::std::string some_field;
    NestedStruct( );
    NestedStruct( const ::std::string& some_field );
};
using NestedStructArray = ::std::vector< ::smoke::NestedStruct >;
using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::smoke::NestedStructArray >;
struct _GENIUM_CPP_EXPORT MainStruct {
    ::smoke::NestedStruct struct_field;
    ::smoke::SomeTypeDef type_def_field;
    ::smoke::NestedStructArray struct_array_field;
    ::smoke::ErrorCodeToMessageMap map_field;
    ::smoke::SomeEnum enum_field;
    MainStruct( );
    MainStruct( const ::smoke::NestedStruct& struct_field, const ::smoke::SomeTypeDef type_def_field, const ::smoke::NestedStructArray& struct_array_field, const ::smoke::ErrorCodeToMessageMap& map_field, const ::smoke::SomeEnum enum_field );
};
}
namespace genium {
template<>
struct hash< ::smoke::SomeEnum > {
    std::size_t operator( )( const ::smoke::SomeEnum& t ) const;
};
}