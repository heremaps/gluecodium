// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "Export.h"
#include "Hash.h"
#include "Return.h"
#include "VectorHash.h"
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
virtual ::::Return< double, ::std::error_code > someMethod( const ::namerules::NameRules::ExampleStruct& some_argument ) = 0;
virtual uint32_t retrieve_int_property(  ) const = 0;
virtual void STORE_INT_PROPERTY_NOW( const uint32_t value ) = 0;
virtual bool really_boolean_property(  ) const = 0;
virtual void STORE_BOOLEAN_PROPERTY_NOW( const bool value ) = 0;
virtual ::namerules::NameRules::ExampleStruct retrieve_struct_property(  ) const = 0;
virtual void STORE_STRUCT_PROPERTY_NOW( const ::namerules::NameRules::ExampleStruct& value ) = 0;
};
_GENIUM_CPP_EXPORT ::std::error_code make_error_code( ::namerules::NameRules::ExampleError value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::namerules::NameRules::ExampleError > : public std::true_type { };
}
namespace  {
template<>
struct hash< ::namerules::NameRules::ExampleError > {
    std::size_t operator( )( const ::namerules::NameRules::ExampleError& t ) const;
};
}