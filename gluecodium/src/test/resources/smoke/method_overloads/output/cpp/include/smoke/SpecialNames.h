// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT SpecialNames {
public:
    SpecialNames();
    virtual ~SpecialNames() = 0;
public:
    virtual void create(  ) = 0;
    virtual void release(  ) = 0;
    virtual void create_proxy(  ) = 0;
    virtual void _uppercase(  ) = 0;
};
}