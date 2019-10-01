// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Hash.h"
#include <cstdint>
#include <string>
namespace smoke {
enum class fooEnum {
    foo_item
};
using fooTypedef = double;
struct _GLUECODIUM_CPP_EXPORT fooStruct {
    ::std::string FOO_FIELD;
    fooStruct( );
    fooStruct( const ::std::string& FOO_FIELD );
    static ::smoke::fooStruct FooCreate( const ::std::string& FooParameter );
};
}
namespace gluecodium {
template<>
struct hash< ::smoke::fooEnum > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::fooEnum& t ) const;
};
}