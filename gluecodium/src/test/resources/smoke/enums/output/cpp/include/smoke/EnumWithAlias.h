// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
namespace smoke {
enum class EnumWithAlias {
    ONE = 2,
    TWO,
    THREE,
    FIRST = ::smoke::EnumWithAlias::ONE,
    THE_BEST = ::smoke::EnumWithAlias::FIRST
};
}
