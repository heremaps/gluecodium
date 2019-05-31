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
struct _GENIUM_CPP_EXPORT NestedEquatableStruct {
    ::std::string foo_field;
    NestedEquatableStruct( );
    NestedEquatableStruct( const ::std::string& foo_field );
    bool operator==( const NestedEquatableStruct& rhs ) const;
    bool operator!=( const NestedEquatableStruct& rhs ) const;
};
struct _GENIUM_CPP_EXPORT EquatableStruct {
    int32_t int_field;
    ::std::string string_field;
    ::examples::NestedEquatableStruct struct_field;
    EquatableStruct( );
    EquatableStruct( const int32_t int_field, const ::std::string& string_field, const ::examples::NestedEquatableStruct& struct_field );
    bool operator==( const EquatableStruct& rhs ) const;
    bool operator!=( const EquatableStruct& rhs ) const;
};
}
namespace genium {
template<>
struct hash< ::examples::EquatableStruct > {
    std::size_t operator( )( const ::examples::EquatableStruct& t ) const;
};
template<>
struct hash< ::examples::NestedEquatableStruct > {
    std::size_t operator( )( const ::examples::NestedEquatableStruct& t ) const;
};
}