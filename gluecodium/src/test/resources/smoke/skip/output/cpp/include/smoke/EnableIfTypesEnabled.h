// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
namespace smoke {
enum class EnableMe {
    NOPE
};
struct _GLUECODIUM_CPP_EXPORT EnableMeToo {
    ::smoke::EnableMe field;
    EnableMeToo( );
    explicit EnableMeToo( ::smoke::EnableMe field );
};
_GLUECODIUM_CPP_EXPORT extern const bool PLACE_HOLDER_ENABLED;
}
