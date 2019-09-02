// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Hash.h"
#include <cstdint>
#include <string>
namespace examples {
enum class StateEnum {
    OFF,
    ON
};
_GENIUM_CPP_EXPORT extern const bool BOOL_CONSTANT;
_GENIUM_CPP_EXPORT extern const int32_t INT_CONSTANT;
_GENIUM_CPP_EXPORT extern const float FLOAT_CONSTANT;
_GENIUM_CPP_EXPORT extern const ::std::string STRING_CONSTANT;
_GENIUM_CPP_EXPORT extern const ::examples::StateEnum ENUM_CONSTANT;
}
namespace genium {
template<>
struct hash< ::examples::StateEnum > {
    std::size_t operator( )( const ::examples::StateEnum& t ) const;
};
}