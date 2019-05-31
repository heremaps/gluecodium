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
#include "genium/VectorHash.h"
#include <cstdint>
#include <string>
#include <vector>
namespace smoke {
enum class fooEnum {
    foo_item
};
using fooTypedef = double;
using fooArray = ::std::vector< float >;
struct _GENIUM_CPP_EXPORT fooStruct {
    ::std::string FOO_FIELD;
    fooStruct( );
    fooStruct( const ::std::string& FOO_FIELD );
    static ::smoke::fooStruct FooCreate( const ::std::string& FooParameter );
};
}
namespace genium {
template<>
struct hash< ::smoke::fooEnum > {
    std::size_t operator( )( const ::smoke::fooEnum& t ) const;
};
}