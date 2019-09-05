// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "foo/Bar.h"
#include "genium/Export.h"
#include "genium/Hash.h"
#include "genium/UnorderedMapHash.h"
#include <cstdint>
#include <string>
#include <unordered_map>
namespace smoke {
class _GENIUM_CPP_EXPORT Enums {
public:
    Enums();
    virtual ~Enums() = 0;
public:
    enum class SimpleEnum {
        FIRST,
        SECOND
    };
    enum class InternalErrorCode {
        ERROR_NONE,
        ERROR_FATAL = 999
    };
    using ExampleMap = ::std::unordered_map< ::smoke::Enums::SimpleEnum, uint64_t, ::genium::hash< ::smoke::Enums::SimpleEnum > >;
    struct _GENIUM_CPP_EXPORT ErrorStruct {
        ::smoke::Enums::InternalErrorCode type;
        ::std::string message;
        ErrorStruct( );
        ErrorStruct( const ::smoke::Enums::InternalErrorCode type, const ::std::string& message );
    };
public:
    static ::smoke::Enums::SimpleEnum method_with_enumeration( const ::smoke::Enums::SimpleEnum input );
    static ::smoke::Enums::InternalErrorCode flip_enum_value( const ::smoke::Enums::InternalErrorCode input );
    static ::smoke::Enums::InternalErrorCode extract_enum_from_struct( const ::smoke::Enums::ErrorStruct& input );
    static ::smoke::Enums::ErrorStruct create_struct_with_enum_inside( const ::smoke::Enums::InternalErrorCode type, const ::std::string& message );
    static void method_with_external_enum( const ::smoke::Enums::External_Enum input );
};
}
namespace genium {
template<>
struct hash< ::smoke::Enums::SimpleEnum > {
    std::size_t operator( )( const ::smoke::Enums::SimpleEnum& t ) const;
};
template<>
struct hash< ::smoke::Enums::InternalErrorCode > {
    std::size_t operator( )( const ::smoke::Enums::InternalErrorCode& t ) const;
};
}
