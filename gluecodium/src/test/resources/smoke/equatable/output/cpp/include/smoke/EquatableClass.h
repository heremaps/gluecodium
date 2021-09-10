// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Hash.h"
#include <cstdint>
#include <memory>
#include <string>
namespace smoke {
    class PointerEquatableClass;
}
namespace smoke {
class _GLUECODIUM_CPP_EXPORT EquatableClass {
public:
    EquatableClass();
    virtual ~EquatableClass() = 0;
public:
    struct _GLUECODIUM_CPP_EXPORT EquatableStruct {
        int32_t int_field;
        ::std::string string_field;
        /// \warning @NotNull
        ::std::shared_ptr< ::smoke::EquatableClass > nested_equatable_instance;
        /// \warning @NotNull
        ::std::shared_ptr< ::smoke::PointerEquatableClass > nested_pointer_equatable_instance;
        EquatableStruct( );
        EquatableStruct( int32_t int_field, ::std::string string_field, ::std::shared_ptr< ::smoke::EquatableClass > nested_equatable_instance, ::std::shared_ptr< ::smoke::PointerEquatableClass > nested_pointer_equatable_instance );
        bool operator==( const EquatableStruct& rhs ) const;
        bool operator!=( const EquatableStruct& rhs ) const;
    };
public:
    bool operator==( const EquatableClass& rhs );
    bool operator!=( const EquatableClass& rhs );
};
}
namespace gluecodium {
template<>
struct hash< ::smoke::EquatableClass > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::EquatableClass& t ) const;
};
template <>
struct EqualityHash< std::shared_ptr< ::smoke::EquatableClass > >
{
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const std::shared_ptr< ::smoke::EquatableClass >& t ) const;
};
template<>
struct hash< ::smoke::EquatableClass::EquatableStruct > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::EquatableClass::EquatableStruct& t ) const;
};
}
