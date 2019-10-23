// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "foo/Bar.h"
#include "gluecodium/Export.h"
#include "gluecodium/Return.h"
#include "smoke/Payload.h"
#include <cstdint>
#include <string>
#include <system_error>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT Errors {
public:
    Errors();
    virtual ~Errors() = 0;
public:
    enum class InternalErrorCode {
        ERROR_NONE,
        ERROR_FATAL
    };
public:
    static ::std::error_code method_with_errors(  );
    static ::std::error_code method_with_external_errors(  );
    static ::gluecodium::Return< ::std::string, ::std::error_code > method_with_errors_and_return_value(  );
    static ::gluecodium::Return< void, ::smoke::Payload > method_with_payload_error(  );
    static ::gluecodium::Return< ::std::string, ::smoke::Payload > method_with_payload_error_and_return_value(  );
};
_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::Errors::InternalErrorCode value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::smoke::Errors::InternalErrorCode > : public std::true_type { };
}
