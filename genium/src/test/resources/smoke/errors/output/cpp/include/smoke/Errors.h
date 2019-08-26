// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "foo/Bar.h"
#include "genium/Export.h"
#include "genium/Hash.h"
#include "genium/Return.h"
#include "genium/TypeRepository.h"
#include <cstdint>
#include <string>
#include <system_error>
namespace smoke {
class _GENIUM_CPP_EXPORT Errors {
public:
    Errors();
    virtual ~Errors() = 0;
public:
enum class InternalError {
    ERROR_NONE,
    ERROR_FATAL
};
using Boom = ::std::error_code;
public:
static ::std::error_code method_with_errors(  );
static ::std::error_code method_with_external_errors(  );
static ::genium::Return< ::std::string, ::std::error_code > method_with_errors_and_return_value(  );
static ::std::error_code method_with_aliased_error(  );
};
_GENIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::Errors::InternalError value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::smoke::Errors::InternalError > : public std::true_type { };
}
namespace genium {
template<>
struct hash< ::smoke::Errors::InternalError > {
    std::size_t operator( )( const ::smoke::Errors::InternalError& t ) const;
};
}
