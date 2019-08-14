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
#include "genium/VectorHash.h"
#include "smoke/PropertiesInterface.h"
#include <cstdint>
#include <memory>
#include <string>
#include <vector>
namespace smoke {
    class PropertiesInterface;
}
namespace smoke {
class _GENIUM_CPP_EXPORT Properties {
public:
    virtual ~Properties() = 0;
public:
enum class InternalError {
    ERROR_NONE,
    ERROR_FATAL = 999
};
struct _GENIUM_CPP_EXPORT ExampleStruct {
    double value;
    ExampleStruct( );
    ExampleStruct( const double value );
};
public:
virtual uint32_t get_built_in_type_attribute(  ) const = 0;
virtual void set_built_in_type_attribute( const uint32_t value ) = 0;
virtual float get_readonly_attribute(  ) const = 0;
virtual ::smoke::Properties::ExampleStruct get_struct_attribute(  ) const = 0;
virtual void set_struct_attribute( const ::smoke::Properties::ExampleStruct& value ) = 0;
virtual ::std::vector< ::std::string > get_array_attribute(  ) const = 0;
virtual void set_array_attribute( const ::std::vector< ::std::string >& value ) = 0;
virtual ::smoke::Properties::InternalError get_complex_type_attribute(  ) const = 0;
virtual void set_complex_type_attribute( const ::smoke::Properties::InternalError value ) = 0;
virtual ::std::shared_ptr< ::std::vector< uint8_t > > get_byte_buffer_attribute(  ) const = 0;
virtual void set_byte_buffer_attribute( const ::std::shared_ptr< ::std::vector< uint8_t > >& value ) = 0;
/**
 *
 * \return @NotNull
 */
virtual ::std::shared_ptr< ::smoke::PropertiesInterface > get_instance_attribute(  ) const = 0;
/**
 *
 * \param[in] value @NotNull
 */
virtual void set_instance_attribute( const ::std::shared_ptr< ::smoke::PropertiesInterface >& value ) = 0;
virtual bool is_boolean_attribute(  ) const = 0;
virtual void set_boolean_attribute( const bool value ) = 0;
static ::std::string get_static_attribute(  );
static void set_static_attribute( const ::std::string& value );
static ::smoke::Properties::ExampleStruct get_static_readonly_attribute(  );
};
}
namespace genium {
template<>
struct hash< ::smoke::Properties::InternalError > {
    std::size_t operator( )( const ::smoke::Properties::InternalError& t ) const;
};
}