// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Hash.h"
#include <cstdint>
namespace examples {
enum class ShoeSizes {
    SMALL = 39,
    BIGGER_THAN_SMALL,
    NORMAL = 43,
    BIG = 46
};
}
namespace genium {
template<>
struct hash< ::examples::ShoeSizes > {
    std::size_t operator( )( const ::examples::ShoeSizes& t ) const;
};
}