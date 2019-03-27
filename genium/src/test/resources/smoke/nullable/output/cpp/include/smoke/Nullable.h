// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "Export.h"
#include "Optional.h"
#include "smoke/SomeInterface.h"
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
    class SomeInterface;
}
namespace smoke {
class _GENIUM_CPP_EXPORT Nullable {
public:
    virtual ~Nullable() = 0;
public:
enum class SomeEnum {
    ON,
    OFF
};
using SomeArray = ::std::vector< ::std::string >;
using SomeMap = ::std::unordered_map< int64_t, ::std::string >;
struct _GENIUM_CPP_EXPORT SomeStruct {
    ::std::string string_field;
    SomeStruct( );
    SomeStruct( const ::std::string& string_field );
};
struct _GENIUM_CPP_EXPORT NullableStruct {
    ::genium::optional< ::std::string > string_field;
    ::genium::optional< bool > bool_field;
    ::genium::optional< double > double_field;
    ::genium::optional< ::smoke::Nullable::SomeStruct > struct_field;
    ::genium::optional< ::smoke::Nullable::SomeEnum > enum_field;
    ::genium::optional< ::smoke::Nullable::SomeArray > array_field;
    ::genium::optional< ::std::vector< ::std::string > > inline_array_field;
    ::genium::optional< ::smoke::Nullable::SomeMap > map_field;
    ::std::shared_ptr< ::smoke::SomeInterface > instance_field;
    NullableStruct( );
    NullableStruct( const ::genium::optional< ::std::string >& string_field, const ::genium::optional< bool >& bool_field, const ::genium::optional< double >& double_field, const ::genium::optional< ::smoke::Nullable::SomeStruct >& struct_field, const ::genium::optional< ::smoke::Nullable::SomeEnum >& enum_field, const ::genium::optional< ::smoke::Nullable::SomeArray >& array_field, const ::genium::optional< ::std::vector< ::std::string > >& inline_array_field, const ::genium::optional< ::smoke::Nullable::SomeMap >& map_field, const ::std::shared_ptr< ::smoke::SomeInterface >& instance_field );
};
struct _GENIUM_CPP_EXPORT NullableIntsStruct {
    ::genium::optional< int8_t > int8_field;
    ::genium::optional< int16_t > int16_field;
    ::genium::optional< int32_t > int32_field;
    ::genium::optional< int64_t > int64_field;
    ::genium::optional< uint8_t > uint8_field;
    ::genium::optional< uint16_t > uint16_field;
    ::genium::optional< uint32_t > uint32_field;
    ::genium::optional< uint64_t > uint64_field;
    NullableIntsStruct( );
    NullableIntsStruct( const ::genium::optional< int8_t >& int8_field, const ::genium::optional< int16_t >& int16_field, const ::genium::optional< int32_t >& int32_field, const ::genium::optional< int64_t >& int64_field, const ::genium::optional< uint8_t >& uint8_field, const ::genium::optional< uint16_t >& uint16_field, const ::genium::optional< uint32_t >& uint32_field, const ::genium::optional< uint64_t >& uint64_field );
};
public:
virtual ::genium::optional< ::std::string > method_with_string( const ::genium::optional< ::std::string >& input ) = 0;
virtual ::genium::optional< bool > method_with_boolean( const ::genium::optional< bool >& input ) = 0;
virtual ::genium::optional< double > method_with_double( const ::genium::optional< double >& input ) = 0;
virtual ::genium::optional< int64_t > method_with_int( const ::genium::optional< int64_t >& input ) = 0;
virtual ::genium::optional< ::smoke::Nullable::SomeStruct > method_with_some_struct( const ::genium::optional< ::smoke::Nullable::SomeStruct >& input ) = 0;
virtual ::genium::optional< ::smoke::Nullable::SomeEnum > method_with_some_enum( const ::genium::optional< ::smoke::Nullable::SomeEnum >& input ) = 0;
virtual ::genium::optional< ::smoke::Nullable::SomeArray > method_with_some_array( const ::genium::optional< ::smoke::Nullable::SomeArray >& input ) = 0;
virtual ::genium::optional< ::std::vector< ::std::string > > method_with_inline_array( const ::genium::optional< ::std::vector< ::std::string > >& input ) = 0;
virtual ::genium::optional< ::smoke::Nullable::SomeMap > method_with_some_map( const ::genium::optional< ::smoke::Nullable::SomeMap >& input ) = 0;
virtual ::std::shared_ptr< ::smoke::SomeInterface > method_with_instance( const ::std::shared_ptr< ::smoke::SomeInterface >& input ) = 0;
virtual ::genium::optional< ::std::string > get_string_attribute(  ) const = 0;
virtual void set_string_attribute( const ::genium::optional< ::std::string >& value ) = 0;
virtual ::genium::optional< bool > is_bool_attribute(  ) const = 0;
virtual void set_bool_attribute( const ::genium::optional< bool >& value ) = 0;
virtual ::genium::optional< double > get_double_attribute(  ) const = 0;
virtual void set_double_attribute( const ::genium::optional< double >& value ) = 0;
virtual ::genium::optional< int64_t > get_int_attribute(  ) const = 0;
virtual void set_int_attribute( const ::genium::optional< int64_t >& value ) = 0;
virtual ::genium::optional< ::smoke::Nullable::SomeStruct > get_struct_attribute(  ) const = 0;
virtual void set_struct_attribute( const ::genium::optional< ::smoke::Nullable::SomeStruct >& value ) = 0;
virtual ::genium::optional< ::smoke::Nullable::SomeEnum > get_enum_attribute(  ) const = 0;
virtual void set_enum_attribute( const ::genium::optional< ::smoke::Nullable::SomeEnum >& value ) = 0;
virtual ::genium::optional< ::smoke::Nullable::SomeArray > get_array_attribute(  ) const = 0;
virtual void set_array_attribute( const ::genium::optional< ::smoke::Nullable::SomeArray >& value ) = 0;
virtual ::genium::optional< ::std::vector< ::std::string > > get_inline_array_attribute(  ) const = 0;
virtual void set_inline_array_attribute( const ::genium::optional< ::std::vector< ::std::string > >& value ) = 0;
virtual ::genium::optional< ::smoke::Nullable::SomeMap > get_map_attribute(  ) const = 0;
virtual void set_map_attribute( const ::genium::optional< ::smoke::Nullable::SomeMap >& value ) = 0;
virtual ::std::shared_ptr< ::smoke::SomeInterface > get_instance_attribute(  ) const = 0;
virtual void set_instance_attribute( const ::std::shared_ptr< ::smoke::SomeInterface >& value ) = 0;
};
}