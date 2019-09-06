// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Hash.h"
#include <cstdint>
namespace smoke {
enum class TCEnum {
    FIRST,
    SECOND
};
}
namespace genium {
template<>
struct hash< ::smoke::TCEnum > {
    _GENIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::TCEnum& t ) const;
};
}