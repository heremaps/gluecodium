// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/ImmutableStructNoClash.h"
#include <cstdint>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT MutableStructImmutableFields {
    ::smoke::ImmutableStructNoClash struct_field = {};
    int32_t int_field = 42;
    bool bool_field = true;
    MutableStructImmutableFields(  );
    MutableStructImmutableFields( ::smoke::ImmutableStructNoClash struct_field, int32_t int_field, bool bool_field );
};
}
