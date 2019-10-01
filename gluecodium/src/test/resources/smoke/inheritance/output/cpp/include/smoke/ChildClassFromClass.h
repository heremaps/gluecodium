// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "smoke/ParentClass.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT ChildClassFromClass: public ::smoke::ParentClass {
public:
    ChildClassFromClass();
    virtual ~ChildClassFromClass() = 0;
public:
    virtual void child_class_method(  ) = 0;
};
}