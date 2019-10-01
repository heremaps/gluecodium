// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Hash.h"
#include "gluecodium/Optional.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
enum class SomeEnum {
    FOO,
    BAR
};
using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::std::string >;
struct _GLUECODIUM_CPP_EXPORT NestedEquatableStruct {
    ::std::string foo_field;
    NestedEquatableStruct( );
    NestedEquatableStruct( const ::std::string& foo_field );
    bool operator==( const NestedEquatableStruct& rhs ) const;
    bool operator!=( const NestedEquatableStruct& rhs ) const;
};
struct _GLUECODIUM_CPP_EXPORT EquatableStruct {
    bool bool_field;
    int32_t int_field;
    int64_t long_field;
    float float_field;
    double double_field;
    ::std::string string_field;
    ::smoke::NestedEquatableStruct struct_field;
    ::smoke::SomeEnum enum_field;
    ::std::vector< ::std::string > array_field;
    ::smoke::ErrorCodeToMessageMap map_field;
    EquatableStruct( );
    EquatableStruct( const bool bool_field, const int32_t int_field, const int64_t long_field, const float float_field, const double double_field, const ::std::string& string_field, const ::smoke::NestedEquatableStruct& struct_field, const ::smoke::SomeEnum enum_field, const ::std::vector< ::std::string >& array_field, const ::smoke::ErrorCodeToMessageMap& map_field );
    bool operator==( const EquatableStruct& rhs ) const;
    bool operator!=( const EquatableStruct& rhs ) const;
};
struct _GLUECODIUM_CPP_EXPORT EquatableNullableStruct {
    ::gluecodium::optional< bool > bool_field;
    ::gluecodium::optional< int32_t > int_field;
    ::gluecodium::optional< uint16_t > uint_field;
    ::gluecodium::optional< float > float_field;
    ::gluecodium::optional< ::std::string > string_field;
    ::gluecodium::optional< ::smoke::NestedEquatableStruct > struct_field;
    ::gluecodium::optional< ::smoke::SomeEnum > enum_field;
    ::gluecodium::optional< ::std::vector< ::std::string > > array_field;
    ::gluecodium::optional< ::smoke::ErrorCodeToMessageMap > map_field;
    EquatableNullableStruct( );
    EquatableNullableStruct( const ::gluecodium::optional< bool >& bool_field, const ::gluecodium::optional< int32_t >& int_field, const ::gluecodium::optional< uint16_t >& uint_field, const ::gluecodium::optional< float >& float_field, const ::gluecodium::optional< ::std::string >& string_field, const ::gluecodium::optional< ::smoke::NestedEquatableStruct >& struct_field, const ::gluecodium::optional< ::smoke::SomeEnum >& enum_field, const ::gluecodium::optional< ::std::vector< ::std::string > >& array_field, const ::gluecodium::optional< ::smoke::ErrorCodeToMessageMap >& map_field );
    bool operator==( const EquatableNullableStruct& rhs ) const;
    bool operator!=( const EquatableNullableStruct& rhs ) const;
};
}
namespace gluecodium {
template<>
struct hash< ::smoke::SomeEnum > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::SomeEnum& t ) const;
};
template<>
struct hash< ::smoke::EquatableStruct > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::EquatableStruct& t ) const;
};
template<>
struct hash< ::smoke::EquatableNullableStruct > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::EquatableNullableStruct& t ) const;
};
template<>
struct hash< ::smoke::NestedEquatableStruct > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::NestedEquatableStruct& t ) const;
};
}