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
#include "genium/VectorHash.h"
#include <cstdint>
#include <system_error>
#include <vector>
namespace package {
enum class Enum {
    NA_N
};
struct _GENIUM_CPP_EXPORT Struct {
    ::package::Enum null = ::package::Enum::NA_N;
    Struct( );
    Struct( const ::package::Enum null );
};
using List = ::std::vector< ::package::Struct >;
_GENIUM_CPP_EXPORT extern const ::package::Enum CONST;
_GENIUM_CPP_EXPORT ::std::error_code make_error_code( ::package::Enum value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::package::Enum > : public std::true_type { };
}
namespace genium {
template<>
struct hash< ::package::Enum > {
    std::size_t operator( )( const ::package::Enum& t ) const;
};
}
