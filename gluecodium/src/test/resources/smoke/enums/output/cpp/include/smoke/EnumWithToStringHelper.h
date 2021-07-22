// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
namespace smoke {
enum class EnumWithToStringHelper {
    FIRST,
    SECOND
};
std::string
_GLUECODIUM_CPP_EXPORT to_string(EnumWithToStringHelper enumeration);
}
