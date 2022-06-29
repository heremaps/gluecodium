// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/ParentInterface.h"
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT ChildClassFromInterfaceOverloads: public ::smoke::ParentInterface {
public:
    ChildClassFromInterfaceOverloads();
    virtual ~ChildClassFromInterfaceOverloads() = 0;
public:
    virtual void foo( const ::std::string& input ) = 0;
    virtual void bar( const ::std::string& input ) = 0;
    using ::smoke::ParentInterface::foo;
    using ::smoke::ParentInterface::bar;
};
}
