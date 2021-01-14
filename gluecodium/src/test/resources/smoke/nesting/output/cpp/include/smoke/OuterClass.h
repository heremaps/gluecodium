// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT OuterClass {
public:
    OuterClass();
    virtual ~OuterClass() = 0;
public:
    class _GLUECODIUM_CPP_EXPORT InnerClass {
    public:
        InnerClass();
        virtual ~InnerClass() = 0;
    public:
        virtual ::std::string foo( const ::std::string& input ) = 0;
    };
    class _GLUECODIUM_CPP_EXPORT InnerInterface {
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
