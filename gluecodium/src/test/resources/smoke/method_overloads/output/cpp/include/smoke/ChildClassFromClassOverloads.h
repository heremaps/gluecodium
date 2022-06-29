// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/ParentClass.h"
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT ChildClassFromClassOverloads: public ::smoke::ParentClass {
public:
    ChildClassFromClassOverloads();
    virtual ~ChildClassFromClassOverloads() = 0;
public:
    virtual void foo( const ::std::string& input ) = 0;
    virtual void bar( const ::std::string& input ) = 0;
    using ::smoke::ParentClass::foo;
    using ::smoke::ParentClass::bar;
};
}
