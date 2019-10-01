// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Hash.h"
#include <cstdint>
#include <string>
namespace smoke {
enum class StateEnum {
    OFF,
    ON
};
_GLUECODIUM_CPP_EXPORT extern const bool BOOL_CONSTANT;
_GLUECODIUM_CPP_EXPORT extern const int32_t INT_CONSTANT;
_GLUECODIUM_CPP_EXPORT extern const uint32_t UINT_CONSTANT;
_GLUECODIUM_CPP_EXPORT extern const float FLOAT_CONSTANT;
_GLUECODIUM_CPP_EXPORT extern const double DOUBLE_CONSTANT;
_GLUECODIUM_CPP_EXPORT extern const ::std::string STRING_CONSTANT;
_GLUECODIUM_CPP_EXPORT extern const ::smoke::StateEnum ENUM_CONSTANT;
}
namespace gluecodium {
template<>
struct hash< ::smoke::StateEnum > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::StateEnum& t ) const;
};
}