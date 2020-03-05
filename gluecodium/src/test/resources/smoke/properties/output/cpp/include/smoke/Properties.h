// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <memory>
#include <string>
#include <vector>
namespace smoke {
    class PropertiesInterface;
}
namespace smoke {
class _GLUECODIUM_CPP_EXPORT Properties {
public:
    Properties();
    virtual ~Properties() = 0;
public:
    enum class InternalErrorCode {
        ERROR_NONE,
        ERROR_FATAL = 999
    };
    struct _GLUECODIUM_CPP_EXPORT ExampleStruct {
        double value;
        ExampleStruct( );
        ExampleStruct( double value );
    };
public:
    virtual uint32_t get_built_in_type_property(  ) const = 0;
    virtual void set_built_in_type_property( const uint32_t value ) = 0;
    virtual float get_readonly_property(  ) const = 0;
    virtual ::smoke::Properties::ExampleStruct get_struct_property(  ) const = 0;
    virtual void set_struct_property( const ::smoke::Properties::ExampleStruct& value ) = 0;
    virtual ::std::vector< ::std::string > get_array_property(  ) const = 0;
    virtual void set_array_property( const ::std::vector< ::std::string >& value ) = 0;
    virtual ::smoke::Properties::InternalErrorCode get_complex_type_property(  ) const = 0;
    virtual void set_complex_type_property( const ::smoke::Properties::InternalErrorCode value ) = 0;
    virtual ::std::shared_ptr< ::std::vector< uint8_t > > get_byte_buffer_property(  ) const = 0;
    virtual void set_byte_buffer_property( const ::std::shared_ptr< ::std::vector< uint8_t > >& value ) = 0;
    /**
     *
     * \return @NotNull
     */
    virtual ::std::shared_ptr< ::smoke::PropertiesInterface > get_instance_property(  ) const = 0;
    /**
     *
     * \param[in] value @NotNull
     */
    virtual void set_instance_property( const ::std::shared_ptr< ::smoke::PropertiesInterface >& value ) = 0;
    virtual bool is_boolean_property(  ) const = 0;
    virtual void set_boolean_property( const bool value ) = 0;
    static ::std::string get_static_property(  );
    static void set_static_property( const ::std::string& value );
    static ::smoke::Properties::ExampleStruct get_static_readonly_property(  );
};
}
