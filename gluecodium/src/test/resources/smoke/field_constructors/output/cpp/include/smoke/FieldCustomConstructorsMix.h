// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FieldCustomConstructorsMix {
    ::std::string string_field = "nonsense";
    int32_t int_field = 42;
    bool bool_field = true;
    FieldCustomConstructorsMix( );
    FieldCustomConstructorsMix( int32_t int_field );
    FieldCustomConstructorsMix( ::std::string string_field, int32_t int_field, bool bool_field );
    static ::smoke::FieldCustomConstructorsMix create_me( const int32_t int_value, const double dummy );
};
}
