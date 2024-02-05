// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/ParentInterface.h"

namespace smoke {
class _GLUECODIUM_CPP_EXPORT ChildInterface: public ::smoke::ParentInterface {
public:
    ChildInterface();
    virtual ~ChildInterface();


public:
    virtual void child_method(  ) = 0;
};


}
