// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Optional.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
    class SomeInterface;
}
namespace smoke {
class _GLUECODIUM_CPP_EXPORT Nullable {
public:
    Nullable();
    virtual ~Nullable() = 0;
public:
    enum class SomeEnum {
        ON,
        OFF
    };
    using SomeArray = ::std::vector< ::std::string >;
    using SomeMap = ::std::unordered_map< int64_t, ::std::string >;
    struct _GLUECODIUM_CPP_EXPORT SomeStruct {
        ::std::string string_field;
        SomeStruct( );
        explicit SomeStruct( ::std::string string_field );
    };
    struct _GLUECODIUM_CPP_EXPORT NullableStruct {
        ::gluecodium::optional< ::std::string > string_field;
        ::gluecodium::optional< bool > bool_field;
        ::gluecodium::optional< double > double_field;
        ::gluecodium::optional< ::smoke::Nullable::SomeStruct > struct_field;
        ::gluecodium::optional< ::smoke::Nullable::SomeEnum > enum_field;
        ::gluecodium::optional< ::smoke::Nullable::SomeArray > array_field;
        ::gluecodium::optional< ::std::vector< ::std::string > > inline_array_field;
        ::gluecodium::optional< ::smoke::Nullable::SomeMap > map_field;
        ::std::shared_ptr< ::smoke::SomeInterface > instance_field;
        NullableStruct( );
        NullableStruct( ::gluecodium::optional< ::std::string > string_field, ::gluecodium::optional< bool > bool_field, ::gluecodium::optional< double > double_field, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > struct_field, ::gluecodium::optional< ::smoke::Nullable::SomeEnum > enum_field, ::gluecodium::optional< ::smoke::Nullable::SomeArray > array_field, ::gluecodium::optional< ::std::vector< ::std::string > > inline_array_field, ::gluecodium::optional< ::smoke::Nullable::SomeMap > map_field, ::std::shared_ptr< ::smoke::SomeInterface > instance_field );
    };
    struct _GLUECODIUM_CPP_EXPORT NullableIntsStruct {
        ::gluecodium::optional< int8_t > int8_field;
        ::gluecodium::optional< int16_t > int16_field;
        ::gluecodium::optional< int32_t > int32_field;
        ::gluecodium::optional< int64_t > int64_field;
        ::gluecodium::optional< uint8_t > uint8_field;
        ::gluecodium::optional< uint16_t > uint16_field;
        ::gluecodium::optional< uint32_t > uint32_field;
        ::gluecodium::optional< uint64_t > uint64_field;
        NullableIntsStruct( );
        NullableIntsStruct( ::gluecodium::optional< int8_t > int8_field, ::gluecodium::optional< int16_t > int16_field, ::gluecodium::optional< int32_t > int32_field, ::gluecodium::optional< int64_t > int64_field, ::gluecodium::optional< uint8_t > uint8_field, ::gluecodium::optional< uint16_t > uint16_field, ::gluecodium::optional< uint32_t > uint32_field, ::gluecodium::optional< uint64_t > uint64_field );
    };
public:
    virtual ::gluecodium::optional< ::std::string > method_with_string( const ::gluecodium::optional< ::std::string >& input ) = 0;
    virtual ::gluecodium::optional< bool > method_with_boolean( const ::gluecodium::optional< bool >& input ) = 0;
    virtual ::gluecodium::optional< double > method_with_double( const ::gluecodium::optional< double >& input ) = 0;
    virtual ::gluecodium::optional< int64_t > method_with_int( const ::gluecodium::optional< int64_t >& input ) = 0;
    virtual ::gluecodium::optional< ::smoke::Nullable::SomeStruct > method_with_some_struct( const ::gluecodium::optional< ::smoke::Nullable::SomeStruct >& input ) = 0;
    virtual ::gluecodium::optional< ::smoke::Nullable::SomeEnum > method_with_some_enum( const ::gluecodium::optional< ::smoke::Nullable::SomeEnum >& input ) = 0;
    virtual ::gluecodium::optional< ::smoke::Nullable::SomeArray > method_with_some_array( const ::gluecodium::optional< ::smoke::Nullable::SomeArray >& input ) = 0;
    virtual ::gluecodium::optional< ::std::vector< ::std::string > > method_with_inline_array( const ::gluecodium::optional< ::std::vector< ::std::string > >& input ) = 0;
    virtual ::gluecodium::optional< ::smoke::Nullable::SomeMap > method_with_some_map( const ::gluecodium::optional< ::smoke::Nullable::SomeMap >& input ) = 0;
    virtual ::std::shared_ptr< ::smoke::SomeInterface > method_with_instance( const ::std::shared_ptr< ::smoke::SomeInterface >& input ) = 0;
    virtual ::gluecodium::optional< ::std::string > get_string_property(  ) const = 0;
    virtual void set_string_property( const ::gluecodium::optional< ::std::string >& value ) = 0;
    virtual ::gluecodium::optional< bool > is_bool_property(  ) const = 0;
    virtual void set_bool_property( const ::gluecodium::optional< bool >& value ) = 0;
    virtual ::gluecodium::optional< double > get_double_property(  ) const = 0;
    virtual void set_double_property( const ::gluecodium::optional< double >& value ) = 0;
    virtual ::gluecodium::optional< int64_t > get_int_property(  ) const = 0;
    virtual void set_int_property( const ::gluecodium::optional< int64_t >& value ) = 0;
    virtual ::gluecodium::optional< ::smoke::Nullable::SomeStruct > get_struct_property(  ) const = 0;
    virtual void set_struct_property( const ::gluecodium::optional< ::smoke::Nullable::SomeStruct >& value ) = 0;
    virtual ::gluecodium::optional< ::smoke::Nullable::SomeEnum > get_enum_property(  ) const = 0;
    virtual void set_enum_property( const ::gluecodium::optional< ::smoke::Nullable::SomeEnum >& value ) = 0;
    virtual ::gluecodium::optional< ::smoke::Nullable::SomeArray > get_array_property(  ) const = 0;
    virtual void set_array_property( const ::gluecodium::optional< ::smoke::Nullable::SomeArray >& value ) = 0;
    virtual ::gluecodium::optional< ::std::vector< ::std::string > > get_inline_array_property(  ) const = 0;
    virtual void set_inline_array_property( const ::gluecodium::optional< ::std::vector< ::std::string > >& value ) = 0;
    virtual ::gluecodium::optional< ::smoke::Nullable::SomeMap > get_map_property(  ) const = 0;
    virtual void set_map_property( const ::gluecodium::optional< ::smoke::Nullable::SomeMap >& value ) = 0;
    virtual ::std::shared_ptr< ::smoke::SomeInterface > get_instance_property(  ) const = 0;
    virtual void set_instance_property( const ::std::shared_ptr< ::smoke::SomeInterface >& value ) = 0;
};
}
