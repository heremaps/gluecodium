// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/ParentInterface.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT ChildInterface: public ::smoke::ParentInterface {
public:
    ChildInterface();
    virtual ~ChildInterface() = 0;
public:
    virtual void child_method(  ) = 0;
};
}
