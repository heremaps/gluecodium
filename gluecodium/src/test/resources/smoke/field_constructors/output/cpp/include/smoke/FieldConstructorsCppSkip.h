// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FieldConstructorsCppSkip {
    ::std::string string_field = "";
    int32_t int_field = 42;
    FieldConstructorsCppSkip( );
    FieldConstructorsCppSkip( ::std::string string_field, int32_t int_field );
};
}
