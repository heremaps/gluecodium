// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/ParentClass.h"
#include "smoke/ParentInterfaceOne.h"
#include "smoke/ParentInterfaceTwo.h"
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT ClassWithAllParents: public ::smoke::ParentClass, public ::smoke::ParentInterfaceOne, public ::smoke::ParentInterfaceTwo {
public:
    ClassWithAllParents();
    virtual ~ClassWithAllParents() = 0;
public:
    virtual void child_function(  ) = 0;
    virtual ::std::string get_child_property(  ) const = 0;
    virtual void set_child_property( const ::std::string& value ) = 0;
};
}
