// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "smoke/ParentInterface.h"
namespace smoke {
class _GENIUM_CPP_EXPORT ChildClassFromInterface: public ::smoke::ParentInterface {
public:
    ChildClassFromInterface();
    virtual ~ChildClassFromInterface() = 0;
public:
virtual void child_class_method(  ) = 0;
};
}