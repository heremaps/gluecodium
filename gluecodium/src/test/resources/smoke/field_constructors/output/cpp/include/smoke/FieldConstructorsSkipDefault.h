// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FieldConstructorsSkipDefault {
    ::std::string string_field = "";
    int32_t int_field = 42;
    FieldConstructorsSkipDefault( );
    FieldConstructorsSkipDefault( ::std::string string_field );
};
}
