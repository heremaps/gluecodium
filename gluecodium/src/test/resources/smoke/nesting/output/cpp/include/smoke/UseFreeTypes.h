// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include "smoke/FreeEnum.h"
#include "smoke/FreePoint.h"
#include "smoke/FreeTypeDef.h"
#include <system_error>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT UseFreeTypes {
public:
    UseFreeTypes();
    virtual ~UseFreeTypes() = 0;
public:
    virtual ::gluecodium::Return< ::smoke::FreeTypeDef, ::std::error_code > do_stuff( const ::smoke::FreePoint& point, const ::smoke::FreeEnum mode ) = 0;
};
}