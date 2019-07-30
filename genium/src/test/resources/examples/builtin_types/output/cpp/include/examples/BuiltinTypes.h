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
#include "genium/VectorHash.h"
#include <cstdint>
#include <memory>
#include <string>
#include <vector>
namespace examples {
class _GENIUM_CPP_EXPORT BuiltinTypes {
public:
    virtual ~BuiltinTypes() = 0;
public:
static uint8_t method_with_u_int8( const uint8_t input_number );
static int32_t method_with_int32( const int32_t input_number );
static uint64_t method_with_u_int64( const uint64_t input_number );
static bool method_with_boolean( const bool input_condition );
static double method_with_double( const double input_number );
static ::std::string method_with_string( const ::std::string& input_string );
static ::std::shared_ptr< ::std::vector< uint8_t > > method_with_byte_buffer( const ::std::shared_ptr< ::std::vector< uint8_t > >& input_buffer );
};
}
