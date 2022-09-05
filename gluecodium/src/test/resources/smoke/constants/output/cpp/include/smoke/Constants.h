// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
#include <string_view>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT Constants {
    static const bool BOOL_CONSTANT;
    static const int32_t INT_CONSTANT;
    static const uint32_t UINT_CONSTANT;
    static const float FLOAT_CONSTANT;
    static const double DOUBLE_CONSTANT;
    static constexpr std::string_view STRING_CONSTANT = "Foo bar";
    enum class StateEnum {
        OFF,
        ON
    };
    static const ::smoke::Constants::StateEnum ENUM_CONSTANT;
};
}
