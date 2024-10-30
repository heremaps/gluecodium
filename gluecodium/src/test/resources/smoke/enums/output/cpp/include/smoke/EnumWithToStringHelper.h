// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string_view>

namespace smoke {
enum class _GLUECODIUM_CPP_EXPORT EnumWithToStringHelper {
    FIRST,
    SECOND
};

std::string_view
_GLUECODIUM_CPP_EXPORT to_string(EnumWithToStringHelper enumeration);


}
