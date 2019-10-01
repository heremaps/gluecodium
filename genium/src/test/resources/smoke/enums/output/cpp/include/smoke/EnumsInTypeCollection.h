// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Hash.h"
#include <cstdint>
namespace smoke {
enum class TCEnum {
    FIRST,
    SECOND
};
}
namespace gluecodium {
template<>
struct hash< ::smoke::TCEnum > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::TCEnum& t ) const;
};
}