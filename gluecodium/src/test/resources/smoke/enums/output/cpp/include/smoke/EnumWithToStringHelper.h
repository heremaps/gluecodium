// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/StringView.h"
#include <cstdint>

namespace smoke {
enum class EnumWithToStringHelper {
    FIRST,
    SECOND
};

::gluecodium::string_view
_GLUECODIUM_CPP_EXPORT to_string(EnumWithToStringHelper enumeration);



}
