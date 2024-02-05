// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT BasicTypes {
public:
    BasicTypes();
    virtual ~BasicTypes();


public:
    static ::std::string string_function( const ::std::string& input );
    static bool bool_function( const bool input );
    static float float_function( const float input );
    static double double_function( const double input );
    static int8_t byte_function( const int8_t input );
    static int16_t short_function( const int16_t input );
    static int32_t int_function( const int32_t input );
    static int64_t long_function( const int64_t input );
    static uint8_t ubyte_function( const uint8_t input );
    static uint16_t ushort_function( const uint16_t input );
    static uint32_t uint_function( const uint32_t input );
    static uint64_t ulong_function( const uint64_t input );
};


}
