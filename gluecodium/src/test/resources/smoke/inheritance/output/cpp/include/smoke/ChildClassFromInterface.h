// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/ParentInterface.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT ChildClassFromInterface: public ::smoke::ParentInterface {
public:
    ChildClassFromInterface();
    virtual ~ChildClassFromInterface() = 0;
public:
    virtual void child_class_method(  ) = 0;
};
}