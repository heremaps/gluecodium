// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/TypeRepository.h"
#include "smoke/ParentInterface.h"
namespace smoke {
class _GENIUM_CPP_EXPORT ChildInterface: public ::smoke::ParentInterface {
public:
    ChildInterface();
    virtual ~ChildInterface() = 0;
public:
    virtual void child_method(  ) = 0;
};
}
