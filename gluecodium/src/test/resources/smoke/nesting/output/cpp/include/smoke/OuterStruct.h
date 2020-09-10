// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT OuterStruct {
    ::std::string field;
    OuterStruct( );
    OuterStruct( ::std::string field );
    struct _GLUECODIUM_CPP_EXPORT InnerStruct {
        ::std::string other_field;
        InnerStruct( );
        InnerStruct( ::std::string other_field );
    };
    class _GLUECODIUM_CPP_EXPORT InnerClass {
    public:
        InnerClass();
        virtual ~InnerClass() = 0;
    public:
        virtual void foo_bar(  ) = 0;
    };
    class _GLUECODIUM_CPP_EXPORT InnerInterface {
    public:
        InnerInterface();
        virtual ~InnerInterface() = 0;
    public:
        virtual void bar_baz(  ) = 0;
    };
};
}
