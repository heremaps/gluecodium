// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/TypeRepository.h"
#include <string>
namespace smoke {
class _GENIUM_CPP_EXPORT OuterClass {
public:
    OuterClass();
    virtual ~OuterClass() = 0;
public:
    class _GENIUM_CPP_EXPORT InnerClass {
    public:
        InnerClass();
        virtual ~InnerClass() = 0;
    public:
        virtual ::std::string foo( const ::std::string& input ) = 0;
    };
    class _GENIUM_CPP_EXPORT InnerInterface {
    public:
        InnerInterface();
        virtual ~InnerInterface() = 0;
    public:
        virtual ::std::string foo( const ::std::string& input ) = 0;
    };
public:
    virtual ::std::string foo( const ::std::string& input ) = 0;
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::OuterClass::InnerInterface*);
}
