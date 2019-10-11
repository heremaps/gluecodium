// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <system_error>
#include <vector>
namespace package {
enum class Enum {
    NA_N
};
struct _GLUECODIUM_CPP_EXPORT Struct {
    ::package::Enum null = ::package::Enum::NA_N;
    Struct( );
    Struct( const ::package::Enum null );
};
using List = ::std::vector< ::package::Struct >;
_GLUECODIUM_CPP_EXPORT extern const ::package::Enum CONST;
_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::package::Enum value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::package::Enum > : public std::true_type { };
}
