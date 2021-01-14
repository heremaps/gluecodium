// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT ParentClass {
public:
    ParentClass();
    virtual ~ParentClass() = 0;
public:
    virtual void root_method(  ) = 0;
};
}
