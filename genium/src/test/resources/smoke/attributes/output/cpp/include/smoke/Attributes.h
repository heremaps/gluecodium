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

#include <string>
#include <vector>

namespace smoke {

class Attributes {
public:
    virtual ~Attributes() = 0;

public:
enum class InternalError {
    ERROR_NONE,
    ERROR_FATAL = 999
};

struct ExampleStruct {
    double value;
};

public:
virtual uint32_t get_built_in_type_attribute(  ) = 0;
virtual void set_built_in_type_attribute( const uint32_t value ) = 0;
virtual float get_readonly_attribute(  ) = 0;
virtual ::smoke::Attributes::ExampleStruct get_struct_attribute(  ) = 0;
virtual void set_struct_attribute( const ::smoke::Attributes::ExampleStruct& value ) = 0;
virtual ::std::vector< ::std::string > get_array_attribute(  ) = 0;
virtual void set_array_attribute( const ::std::vector< ::std::string >& value ) = 0;
virtual ::smoke::Attributes::InternalError get_complex_type_attribute(  ) = 0;
virtual void set_complex_type_attribute( const ::smoke::Attributes::InternalError value ) = 0;
virtual ::std::vector< uint8_t > get_byte_buffer_attribute(  ) = 0;
virtual void set_byte_buffer_attribute( const ::std::vector< uint8_t >& value ) = 0;

};

}
