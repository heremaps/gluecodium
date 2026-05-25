// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <array>
#include <cstdint>

namespace smoke {
enum class EnumWithAccessibleValues {
    FOO,
    BAR,
    BAZ,
    FOO_ALIAS = ::smoke::EnumWithAccessibleValues::FOO
};


std::array<EnumWithAccessibleValues, 3>
_GLUECODIUM_CPP_EXPORT EnumWithAccessibleValues_enumerators();


}
