// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Hash.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <optional>
#include <string>
#include <unordered_map>
#include <vector>

namespace smoke {
struct _GLUECODIUM_CPP_EXPORT Equatable {
    struct _GLUECODIUM_CPP_EXPORT NestedEquatableStruct {
        ::std::string foo_field;

        NestedEquatableStruct( );
        explicit NestedEquatableStruct( ::std::string foo_field );

        bool operator==( const NestedEquatableStruct& rhs ) const;
        bool operator!=( const NestedEquatableStruct& rhs ) const;

    };

    enum class _GLUECODIUM_CPP_EXPORT SomeEnum {
        FOO,
        BAR
    };


    using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::std::string >;

    struct _GLUECODIUM_CPP_EXPORT EquatableStruct {
        bool bool_field;
        int32_t int_field;
        int64_t long_field;
        float float_field;
        double double_field;
        ::std::string string_field;
        ::smoke::Equatable::NestedEquatableStruct struct_field;
        ::smoke::Equatable::SomeEnum enum_field;
        ::std::vector< ::std::string > array_field;
        ::smoke::Equatable::ErrorCodeToMessageMap map_field;

        EquatableStruct( );
        EquatableStruct( bool bool_field, int32_t int_field, int64_t long_field, float float_field, double double_field, ::std::string string_field, ::smoke::Equatable::NestedEquatableStruct struct_field, ::smoke::Equatable::SomeEnum enum_field, ::std::vector< ::std::string > array_field, ::smoke::Equatable::ErrorCodeToMessageMap map_field );

        bool operator==( const EquatableStruct& rhs ) const;
        bool operator!=( const EquatableStruct& rhs ) const;

    };

    struct _GLUECODIUM_CPP_EXPORT EquatableNullableStruct {
        std::optional< bool > bool_field = std::optional< bool >();
        std::optional< int32_t > int_field = std::optional< int32_t >();
        std::optional< uint16_t > uint_field = std::optional< uint16_t >();
        std::optional< float > float_field = std::optional< float >();
        std::optional< ::std::string > string_field = std::optional< ::std::string >();
        std::optional< ::smoke::Equatable::NestedEquatableStruct > struct_field = std::optional< ::smoke::Equatable::NestedEquatableStruct >();
        std::optional< ::smoke::Equatable::SomeEnum > enum_field = std::optional< ::smoke::Equatable::SomeEnum >();
        std::optional< ::std::vector< ::std::string > > array_field = std::optional< ::std::vector< ::std::string > >();
        std::optional< ::smoke::Equatable::ErrorCodeToMessageMap > map_field = std::optional< ::smoke::Equatable::ErrorCodeToMessageMap >();

        EquatableNullableStruct( );
        EquatableNullableStruct( std::optional< bool > bool_field, std::optional< int32_t > int_field, std::optional< uint16_t > uint_field, std::optional< float > float_field, std::optional< ::std::string > string_field, std::optional< ::smoke::Equatable::NestedEquatableStruct > struct_field, std::optional< ::smoke::Equatable::SomeEnum > enum_field, std::optional< ::std::vector< ::std::string > > array_field, std::optional< ::smoke::Equatable::ErrorCodeToMessageMap > map_field );

        bool operator==( const EquatableNullableStruct& rhs ) const;
        bool operator!=( const EquatableNullableStruct& rhs ) const;

    };

};


}

namespace gluecodium {
template<>
struct hash< ::smoke::Equatable::EquatableStruct > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::Equatable::EquatableStruct& t ) const;
};
template<>
struct hash< ::smoke::Equatable::EquatableNullableStruct > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::Equatable::EquatableNullableStruct& t ) const;
};
template<>
struct hash< ::smoke::Equatable::NestedEquatableStruct > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::Equatable::NestedEquatableStruct& t ) const;
};
}
