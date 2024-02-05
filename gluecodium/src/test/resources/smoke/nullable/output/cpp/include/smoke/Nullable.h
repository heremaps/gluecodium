// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <memory>
#include <optional>
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
    virtual ~Nullable();


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
        std::optional< ::std::string > string_field = std::optional< ::std::string >();
        std::optional< bool > bool_field = std::optional< bool >();
        std::optional< double > double_field = std::optional< double >();
        std::optional< ::smoke::Nullable::SomeStruct > struct_field = std::optional< ::smoke::Nullable::SomeStruct >();
        std::optional< ::smoke::Nullable::SomeEnum > enum_field = std::optional< ::smoke::Nullable::SomeEnum >();
        std::optional< ::smoke::Nullable::SomeArray > array_field = std::optional< ::smoke::Nullable::SomeArray >();
        std::optional< ::std::vector< ::std::string > > inline_array_field = std::optional< ::std::vector< ::std::string > >();
        std::optional< ::smoke::Nullable::SomeMap > map_field = std::optional< ::smoke::Nullable::SomeMap >();
        ::std::shared_ptr< ::smoke::SomeInterface > instance_field = ::std::shared_ptr< ::smoke::SomeInterface >();

        NullableStruct( );
        NullableStruct( std::optional< ::std::string > string_field, std::optional< bool > bool_field, std::optional< double > double_field, std::optional< ::smoke::Nullable::SomeStruct > struct_field, std::optional< ::smoke::Nullable::SomeEnum > enum_field, std::optional< ::smoke::Nullable::SomeArray > array_field, std::optional< ::std::vector< ::std::string > > inline_array_field, std::optional< ::smoke::Nullable::SomeMap > map_field, ::std::shared_ptr< ::smoke::SomeInterface > instance_field );

    };

    struct _GLUECODIUM_CPP_EXPORT NullableIntsStruct {
        std::optional< int8_t > int8_field = std::optional< int8_t >();
        std::optional< int16_t > int16_field = std::optional< int16_t >();
        std::optional< int32_t > int32_field = std::optional< int32_t >();
        std::optional< int64_t > int64_field = std::optional< int64_t >();
        std::optional< uint8_t > uint8_field = std::optional< uint8_t >();
        std::optional< uint16_t > uint16_field = std::optional< uint16_t >();
        std::optional< uint32_t > uint32_field = std::optional< uint32_t >();
        std::optional< uint64_t > uint64_field = std::optional< uint64_t >();

        NullableIntsStruct( );
        NullableIntsStruct( std::optional< int8_t > int8_field, std::optional< int16_t > int16_field, std::optional< int32_t > int32_field, std::optional< int64_t > int64_field, std::optional< uint8_t > uint8_field, std::optional< uint16_t > uint16_field, std::optional< uint32_t > uint32_field, std::optional< uint64_t > uint64_field );

    };

public:
    virtual std::optional< ::std::string > method_with_string( const std::optional< ::std::string >& input ) = 0;
    virtual std::optional< bool > method_with_boolean( const std::optional< bool >& input ) = 0;
    virtual std::optional< double > method_with_double( const std::optional< double >& input ) = 0;
    virtual std::optional< int64_t > method_with_int( const std::optional< int64_t >& input ) = 0;
    virtual std::optional< ::smoke::Nullable::SomeStruct > method_with_some_struct( const std::optional< ::smoke::Nullable::SomeStruct >& input ) = 0;
    virtual std::optional< ::smoke::Nullable::SomeEnum > method_with_some_enum( const std::optional< ::smoke::Nullable::SomeEnum >& input ) = 0;
    virtual std::optional< ::smoke::Nullable::SomeArray > method_with_some_array( const std::optional< ::smoke::Nullable::SomeArray >& input ) = 0;
    virtual std::optional< ::std::vector< ::std::string > > method_with_inline_array( const std::optional< ::std::vector< ::std::string > >& input ) = 0;
    virtual std::optional< ::smoke::Nullable::SomeMap > method_with_some_map( const std::optional< ::smoke::Nullable::SomeMap >& input ) = 0;
    virtual ::std::shared_ptr< ::smoke::SomeInterface > method_with_instance( const ::std::shared_ptr< ::smoke::SomeInterface >& input ) = 0;
    virtual std::optional< ::std::string > get_string_property(  ) const = 0;
    virtual void set_string_property( const std::optional< ::std::string >& value ) = 0;

    virtual std::optional< bool > is_bool_property(  ) const = 0;
    virtual void set_bool_property( const std::optional< bool >& value ) = 0;

    virtual std::optional< double > get_double_property(  ) const = 0;
    virtual void set_double_property( const std::optional< double >& value ) = 0;

    virtual std::optional< int64_t > get_int_property(  ) const = 0;
    virtual void set_int_property( const std::optional< int64_t >& value ) = 0;

    virtual std::optional< ::smoke::Nullable::SomeStruct > get_struct_property(  ) const = 0;
    virtual void set_struct_property( const std::optional< ::smoke::Nullable::SomeStruct >& value ) = 0;

    virtual std::optional< ::smoke::Nullable::SomeEnum > get_enum_property(  ) const = 0;
    virtual void set_enum_property( const std::optional< ::smoke::Nullable::SomeEnum >& value ) = 0;

    virtual std::optional< ::smoke::Nullable::SomeArray > get_array_property(  ) const = 0;
    virtual void set_array_property( const std::optional< ::smoke::Nullable::SomeArray >& value ) = 0;

    virtual std::optional< ::std::vector< ::std::string > > get_inline_array_property(  ) const = 0;
    virtual void set_inline_array_property( const std::optional< ::std::vector< ::std::string > >& value ) = 0;

    virtual std::optional< ::smoke::Nullable::SomeMap > get_map_property(  ) const = 0;
    virtual void set_map_property( const std::optional< ::smoke::Nullable::SomeMap >& value ) = 0;

    virtual ::std::shared_ptr< ::smoke::SomeInterface > get_instance_property(  ) const = 0;
    virtual void set_instance_property( const ::std::shared_ptr< ::smoke::SomeInterface >& value ) = 0;

};


}
