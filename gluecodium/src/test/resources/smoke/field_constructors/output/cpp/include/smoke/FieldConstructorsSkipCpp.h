// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FieldConstructorsSkipCpp {
    ::std::string string_field = "";
    int32_t int_field = 42;
    FieldConstructorsSkipCpp( );
    FieldConstructorsSkipCpp( ::std::string string_field, int32_t int_field );
};
}
