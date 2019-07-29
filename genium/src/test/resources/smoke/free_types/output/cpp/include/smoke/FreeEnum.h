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
#include <system_error>
namespace smoke {
enum class FreeEnum {
    FOO,
    BAR
};
_GENIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::FreeEnum value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::smoke::FreeEnum > : public std::true_type { };
}
namespace genium {
template<>
struct hash< ::smoke::FreeEnum > {
    std::size_t operator( )( const ::smoke::FreeEnum& t ) const;
};
}
