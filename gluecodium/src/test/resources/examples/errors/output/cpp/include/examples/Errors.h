// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Return.h"
#include <cstdint>
#include <string>
#include <system_error>
namespace examples {
class _GLUECODIUM_CPP_EXPORT Errors {
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
    static ::gluecodium::Return< ::std::string, ::std::error_code > get_something_or_fail(  );
};
_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::examples::Errors::InternalErrorCode value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::examples::Errors::InternalErrorCode > : public std::true_type { };
}
