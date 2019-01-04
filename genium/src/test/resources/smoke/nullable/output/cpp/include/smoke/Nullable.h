// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
class Nullable {
public:
    virtual ~Nullable() = 0;
public:
enum class SomeEnum {
    ON,
    OFF
};
using SomeArray = ::std::vector< ::std::string >;
using SomeMap = ::std::unordered_map< int64_t, ::std::string >;
struct SomeStruct {
    ::std::string string_field;
    SomeStruct( );
    SomeStruct( const ::std::string& string_field );
};
struct NullableStruct {
    ::std::shared_ptr< ::std::string > string_field;
    ::std::shared_ptr< bool > bool_field;
    ::std::shared_ptr< double > double_field;
    ::std::shared_ptr< int64_t > int_field;
    ::std::shared_ptr< ::smoke::Nullable::SomeStruct > struct_field;
    ::std::shared_ptr< ::smoke::Nullable::SomeEnum > enum_field;
    ::std::shared_ptr< ::smoke::Nullable::SomeArray > array_field;
    ::std::shared_ptr< ::std::vector< ::std::string > > inline_array_field;
    ::std::shared_ptr< ::smoke::Nullable::SomeMap > map_field;
    NullableStruct( );
    NullableStruct( const ::std::shared_ptr< ::std::string >& string_field, const ::std::shared_ptr< bool >& bool_field, const ::std::shared_ptr< double >& double_field, const ::std::shared_ptr< int64_t >& int_field, const ::std::shared_ptr< ::smoke::Nullable::SomeStruct >& struct_field, const ::std::shared_ptr< ::smoke::Nullable::SomeEnum >& enum_field, const ::std::shared_ptr< ::smoke::Nullable::SomeArray >& array_field, const ::std::shared_ptr< ::std::vector< ::std::string > >& inline_array_field, const ::std::shared_ptr< ::smoke::Nullable::SomeMap >& map_field );
};
public:
virtual ::std::shared_ptr< ::std::string > method_with_string( const ::std::shared_ptr< ::std::string >& input ) = 0;
virtual ::std::shared_ptr< bool > method_with_boolean( const ::std::shared_ptr< bool >& input ) = 0;
virtual ::std::shared_ptr< double > method_with_double( const ::std::shared_ptr< double >& input ) = 0;
virtual ::std::shared_ptr< int64_t > method_with_int( const ::std::shared_ptr< int64_t >& input ) = 0;
virtual ::std::shared_ptr< ::smoke::Nullable::SomeStruct > method_with_some_struct( const ::std::shared_ptr< ::smoke::Nullable::SomeStruct >& input ) = 0;
virtual ::std::shared_ptr< ::smoke::Nullable::SomeEnum > method_with_some_enum( const ::std::shared_ptr< ::smoke::Nullable::SomeEnum >& input ) = 0;
virtual ::std::shared_ptr< ::smoke::Nullable::SomeArray > method_with_some_array( const ::std::shared_ptr< ::smoke::Nullable::SomeArray >& input ) = 0;
virtual ::std::shared_ptr< ::std::vector< ::std::string > > method_with_inline_array( const ::std::shared_ptr< ::std::vector< ::std::string > >& input ) = 0;
virtual ::std::shared_ptr< ::smoke::Nullable::SomeMap > method_with_some_map( const ::std::shared_ptr< ::smoke::Nullable::SomeMap >& input ) = 0;
virtual ::std::shared_ptr< ::std::string > get_string_attribute(  ) const = 0;
virtual void set_string_attribute( const ::std::shared_ptr< ::std::string >& value ) = 0;
virtual ::std::shared_ptr< bool > is_bool_attribute(  ) const = 0;
virtual void set_bool_attribute( const ::std::shared_ptr< bool >& value ) = 0;
virtual ::std::shared_ptr< double > get_double_attribute(  ) const = 0;
virtual void set_double_attribute( const ::std::shared_ptr< double >& value ) = 0;
virtual ::std::shared_ptr< int64_t > get_int_attribute(  ) const = 0;
virtual void set_int_attribute( const ::std::shared_ptr< int64_t >& value ) = 0;
virtual ::std::shared_ptr< ::smoke::Nullable::SomeStruct > get_struct_attribute(  ) const = 0;
virtual void set_struct_attribute( const ::std::shared_ptr< ::smoke::Nullable::SomeStruct >& value ) = 0;
virtual ::std::shared_ptr< ::smoke::Nullable::SomeEnum > get_enum_attribute(  ) const = 0;
virtual void set_enum_attribute( const ::std::shared_ptr< ::smoke::Nullable::SomeEnum >& value ) = 0;
virtual ::std::shared_ptr< ::smoke::Nullable::SomeArray > get_array_attribute(  ) const = 0;
virtual void set_array_attribute( const ::std::shared_ptr< ::smoke::Nullable::SomeArray >& value ) = 0;
virtual ::std::shared_ptr< ::std::vector< ::std::string > > get_inline_array_attribute(  ) const = 0;
virtual void set_inline_array_attribute( const ::std::shared_ptr< ::std::vector< ::std::string > >& value ) = 0;
virtual ::std::shared_ptr< ::smoke::Nullable::SomeMap > get_map_attribute(  ) const = 0;
virtual void set_map_attribute( const ::std::shared_ptr< ::smoke::Nullable::SomeMap >& value ) = 0;
};
}
