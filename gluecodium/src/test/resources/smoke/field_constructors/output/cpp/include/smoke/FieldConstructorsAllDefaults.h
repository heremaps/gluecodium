// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FieldConstructorsAllDefaults {
    ::std::string string_field = "nonsense";
    int32_t int_field = 42;
    bool bool_field = true;
    FieldConstructorsAllDefaults(  );
    explicit FieldConstructorsAllDefaults( int32_t int_field );
    FieldConstructorsAllDefaults( int32_t int_field, ::std::string string_field );
    FieldConstructorsAllDefaults( bool bool_field, int32_t int_field, ::std::string string_field );
};
}
