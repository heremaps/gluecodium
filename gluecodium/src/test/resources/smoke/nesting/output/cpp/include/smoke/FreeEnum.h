// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <system_error>

namespace smoke {
enum class _GLUECODIUM_CPP_EXPORT FreeEnum {
    FOO,
    BAR
};



_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::FreeEnum value ) noexcept;
}

namespace std
{
template <>
struct is_error_code_enum< ::smoke::FreeEnum > : public std::true_type { };
}
