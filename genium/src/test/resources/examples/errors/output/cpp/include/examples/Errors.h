// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Hash.h"
#include "genium/Return.h"
#include <cstdint>
#include <string>
#include <system_error>
namespace examples {
class _GENIUM_CPP_EXPORT Errors {
public:
    Errors();
    virtual ~Errors() = 0;
public:
enum class InternalErrorCode {
    NONE,
    CRASHED,
    EXPLODED
};
public:
static ::std::error_code start_something_or_fail(  );
static ::genium::Return< ::std::string, ::std::error_code > get_something_or_fail(  );
};
_GENIUM_CPP_EXPORT ::std::error_code make_error_code( ::examples::Errors::InternalErrorCode value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::examples::Errors::InternalErrorCode > : public std::true_type { };
}
namespace genium {
template<>
struct hash< ::examples::Errors::InternalErrorCode > {
    std::size_t operator( )( const ::examples::Errors::InternalErrorCode& t ) const;
};
}
