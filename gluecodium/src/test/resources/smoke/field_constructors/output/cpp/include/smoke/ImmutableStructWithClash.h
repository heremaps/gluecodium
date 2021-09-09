// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT ImmutableStructWithClash {
    const ::std::string string_field = "nonsense";
    const int32_t int_field = 42;
    const bool bool_field = true;
    ImmutableStructWithClash(  );
    ImmutableStructWithClash( bool bool_field, int32_t int_field, ::std::string string_field );
};
}
