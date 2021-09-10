// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "ExportGluecodiumCpp.h"
#include "Return.h"
#include "VectorHash.h"
#include <cstdint>
#include <memory>
#include <string>
#include <system_error>
#include <vector>
namespace namerules {
class _GLUECODIUM_CPP_EXPORT NameRules {
public:
    NameRules();
    virtual ~NameRules() = 0;
public:
    enum class ExampleErrorCode {
        NONE,
        FATAL
    };
    using StringArray = ::std::vector< ::std::string >;
    struct _GLUECODIUM_CPP_EXPORT ExampleStruct {
        double m_value;
        ::std::vector< int64_t > m_int_value;
        ExampleStruct( );
        ExampleStruct( double m_value, ::std::vector< int64_t > m_int_value );
    };
public:
    /**
     *
     * \return @NotNull
     */
    static ::std::shared_ptr< ::namerules::NameRules > create(  );
    virtual ::Return< double, ::std::error_code > someMethod( const ::namerules::NameRules::ExampleStruct& some_argument ) = 0;
    virtual uint32_t retrieve_int_property(  ) const = 0;
    virtual void STORE_INT_PROPERTY_NOW( const uint32_t value ) = 0;
    virtual bool really_boolean_property(  ) const = 0;
    virtual void STORE_BOOLEAN_PROPERTY_NOW( const bool value ) = 0;
    virtual ::namerules::NameRules::ExampleStruct retrieve_struct_property(  ) const = 0;
    virtual void STORE_STRUCT_PROPERTY_NOW( const ::namerules::NameRules::ExampleStruct& value ) = 0;
};
_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::namerules::NameRules::ExampleErrorCode value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::namerules::NameRules::ExampleErrorCode > : public std::true_type { };
}
