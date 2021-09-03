// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT ImmutableStructNoClash {
    const ::std::string string_field = "nonsense";
    const int32_t int_field = 42;
    const bool bool_field = true;
    ImmutableStructNoClash(  );
    ImmutableStructNoClash( ::std::string string_field, int32_t int_field, bool bool_field );
};
}
