// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Hash.h"
#include <cstdint>
namespace examples {
enum class ShoeSizes {
    SMALL = 39,
    BIGGER_THAN_SMALL,
    NORMAL = 43,
    BIG = 46
};
}
namespace gluecodium {
template<>
struct hash< ::examples::ShoeSizes > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::examples::ShoeSizes& t ) const;
};
}