// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT EnableIfTypesEnabled {
    static const bool PLACE_HOLDER_ENABLED;
    enum class EnableMe {
        NOPE
    };
    struct _GLUECODIUM_CPP_EXPORT EnableMeToo {
        ::smoke::EnableIfTypesEnabled::EnableMe field;
        EnableMeToo( );
        explicit EnableMeToo( ::smoke::EnableIfTypesEnabled::EnableMe field );
    };
};
}
