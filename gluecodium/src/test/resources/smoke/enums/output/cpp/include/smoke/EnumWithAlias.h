// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <system_error>

namespace smoke {
enum class _GLUECODIUM_CPP_EXPORT EnumWithAlias {
    ONE = 2,
    TWO,
    THREE,
    FIRST = ::smoke::EnumWithAlias::ONE,
    THE_BEST = ::smoke::EnumWithAlias::FIRST
};



_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::EnumWithAlias value ) noexcept;
}

namespace std
{
template <>
struct is_error_code_enum< ::smoke::EnumWithAlias > : public std::true_type { };
}
