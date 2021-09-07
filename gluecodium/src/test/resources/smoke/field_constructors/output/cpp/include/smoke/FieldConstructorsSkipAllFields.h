// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FieldConstructorsSkipAllFields {
    const ::std::string string_field;
    const int32_t int_field;
    FieldConstructorsSkipAllFields( ::std::string string_field, int32_t int_field );
};
}
