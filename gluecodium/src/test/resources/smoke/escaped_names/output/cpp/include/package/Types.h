// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <system_error>
#include <vector>
namespace package {
struct _GLUECODIUM_CPP_EXPORT Types {
    enum class Enum {
        NA_N
    };
    struct _GLUECODIUM_CPP_EXPORT Struct {
        ::package::Types::Enum null = ::package::Types::Enum::NA_N;
        Struct( );
        explicit Struct( ::package::Types::Enum null );
    };
    static const ::package::Types::Enum CONST;
    using ULong = ::std::vector< ::package::Types::Struct >;
};
_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::package::Types::Enum value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::package::Types::Enum > : public std::true_type { };
}
