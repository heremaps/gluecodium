// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/ParentInterface.h"
#include "smoke/ParentNarrowOne.h"
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT FirstParentIsInterfaceInterface: public ::smoke::ParentInterface, public ::smoke::ParentNarrowOne {
public:
    FirstParentIsInterfaceInterface();
    virtual ~FirstParentIsInterfaceInterface() = 0;
public:
    virtual void child_function(  ) = 0;
    virtual ::std::string get_child_property(  ) const = 0;
    virtual void set_child_property( const ::std::string& value ) = 0;
};
}
