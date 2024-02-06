// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/ParentClass.h"

namespace smoke {
class _GLUECODIUM_CPP_EXPORT ChildClassFromClass: public ::smoke::ParentClass {
public:
    ChildClassFromClass();
    virtual ~ChildClassFromClass();


public:
    virtual void child_class_method(  ) = 0;
};


}
