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
#include "genium/Return.h"
#include <cstdint>
#include <memory>
#include <string>
#include <system_error>
#include <vector>
namespace namerules {
    class NameRules;
}
namespace namerules {
class _GENIUM_CPP_EXPORT NameRules {
public:
    virtual ~NameRules() = 0;
public:
enum class ExampleError {
    NONE,
    FATAL
};
using StringArray = ::std::vector< ::std::string >;
struct _GENIUM_CPP_EXPORT ExampleStruct {
    double m_value;
    ::std::vector< int64_t > m_int_value;
    ExampleStruct( );
    ExampleStruct( const double m_value, const ::std::vector< int64_t >& m_int_value );
};
public:
/**
 *
 * \return @NotNull
 */
static ::std::shared_ptr< ::namerules::NameRules > create(  );
virtual ::genium::Return< double, ::std::error_code > someMethod( const ::namerules::NameRules::ExampleStruct& some_argument ) = 0;
virtual uint32_t retrieve_int_attribute(  ) const = 0;
virtual void STORE_INT_ATTRIBUTE_NOW( const uint32_t value ) = 0;
virtual bool really_boolean_attribute(  ) const = 0;
virtual void STORE_BOOLEAN_ATTRIBUTE_NOW( const bool value ) = 0;
virtual ::namerules::NameRules::ExampleStruct retrieve_struct_attribute(  ) const = 0;
virtual void STORE_STRUCT_ATTRIBUTE_NOW( const ::namerules::NameRules::ExampleStruct& value ) = 0;
};
_GENIUM_CPP_EXPORT ::std::error_code make_error_code( ::namerules::NameRules::ExampleError value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum <::namerules::NameRules::ExampleError> : public std::true_type { };
}
