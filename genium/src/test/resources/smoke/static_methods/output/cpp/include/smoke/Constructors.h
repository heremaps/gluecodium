// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "Return.h"
#include <cstdint>
#include <memory>
#include <string>
#include <system_error>
namespace smoke {
    class Constructors;
}
namespace smoke {
class Constructors {
public:
    virtual ~Constructors() = 0;
public:
enum class ErrorEnum {
    NONE,
    CRASHED
};
public:
static ::std::shared_ptr< ::smoke::Constructors > create(  );
static ::std::shared_ptr< ::smoke::Constructors > create( const ::std::shared_ptr< ::smoke::Constructors >& other );
static ::std::shared_ptr< ::smoke::Constructors > create( const ::std::string& foo, const uint64_t bar );
static ::genium::Return< ::std::shared_ptr< ::smoke::Constructors >, ::std::error_code > create( const ::std::string& input );
};
::std::error_code make_error_code( ::smoke::Constructors::ErrorEnum value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum <::smoke::Constructors::ErrorEnum> : public std::true_type { };
}
