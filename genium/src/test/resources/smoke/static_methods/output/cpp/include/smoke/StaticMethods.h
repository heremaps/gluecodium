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
#include <cstdint>
#include <memory>
#include <string>
#include <vector>

namespace smoke {

class _GENIUM_CPP_EXPORT StaticMethods {
public:
    virtual ~StaticMethods() = 0;
public:
static bool return_inverted_boolean( const bool input );
static bool return_and_boolean( const bool input1, const bool input2 );
static ::std::shared_ptr< ::std::vector< uint8_t > > return_input_byte_buffer( const ::std::shared_ptr< ::std::vector< uint8_t > >& input_buffer );
static ::std::shared_ptr< ::std::vector< uint8_t > > return_reverse_byte_buffer( const ::std::shared_ptr< ::std::vector< uint8_t > >& input_buffer );
static ::std::shared_ptr< ::std::vector< uint8_t > > concatenate_byte_buffers( const ::std::shared_ptr< ::std::vector< uint8_t > >& input1, const ::std::shared_ptr< ::std::vector< uint8_t > >& input2 );
static float return_float( const float input_number );
static float return_incremented_float( const float input_number );
static float sum_two_floats( const float input_number1, const float input_number2 );
static double return_double( const double input_number );
static double return_incremented_double( const double input_number );
static double sum_two_doubles( const double input_number1, const double input_number2 );
static int8_t return_next_number_i_n_t8( const int8_t input_number );
static int8_t sum_two_numbers_i_n_t8( const int8_t input_number1, const int8_t input_number2 );
static int8_t return_prime_i_n_t8(  );
static uint8_t return_next_number_u_i_n_t8( const uint8_t input_number );
static uint8_t sum_two_numbers_u_i_n_t8( const uint8_t input_number1, const uint8_t input_number2 );
static uint8_t return_prime_u_i_n_t8(  );
static int16_t return_next_number_i_n_t16( const int16_t input_number );
static int16_t sum_two_numbers_i_n_t16( const int16_t input_number1, const int16_t input_number2 );
static int16_t return_prime_i_n_t16(  );
static uint16_t return_next_number_u_i_n_t16( const uint16_t input_number );
static uint16_t sum_two_numbers_u_i_n_t16( const uint16_t input_number1, const uint16_t input_number2 );
static uint16_t return_prime_u_i_n_t16(  );
static int32_t return_next_number_i_n_t32( const int32_t input_number );
static int32_t sum_two_numbers_i_n_t32( const int32_t input_number1, const int32_t input_number2 );
static int32_t return_prime_i_n_t32(  );
static uint32_t return_next_number_u_i_n_t32( const uint32_t input_number );
static uint32_t sum_two_numbers_u_i_n_t32( const uint32_t input_number1, const uint32_t input_number2 );
static uint32_t return_prime_u_i_n_t32(  );
static int64_t return_next_number_i_n_t64( const int64_t input_number );
static int64_t sum_two_numbers_i_n_t64( const int64_t input_number1, const int64_t input_number2 );
static int64_t return_prime_i_n_t64(  );
static uint64_t return_next_number_u_i_n_t64( const uint64_t input_number );
static uint64_t sum_two_numbers_u_i_n_t64( const uint64_t input_number1, const uint64_t input_number2 );
static uint64_t return_prime_u_i_n_t64(  );
static ::std::string return_input_string( const ::std::string& input_string );
static ::std::string concatenate_strings( const ::std::string& input_string1, const ::std::string& input_string2 );
static ::std::string return_hello_string(  );
static ::std::string return_empty(  );
};
}
