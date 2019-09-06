// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Hash.h"
#include <cstdint>
#include <string>
namespace smoke {
enum class fooEnum {
    foo_item
};
using fooTypedef = double;
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
    _GENIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::fooEnum& t ) const;
};
}