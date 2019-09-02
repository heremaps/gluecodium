// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Return.h"
#include "smoke/FreeEnum.h"
#include "smoke/FreePoint.h"
#include "smoke/FreeTypeDef.h"
#include <system_error>
namespace smoke {
class _GENIUM_CPP_EXPORT UseFreeTypes {
public:
    UseFreeTypes();
    virtual ~UseFreeTypes() = 0;
public:
virtual ::genium::Return< ::smoke::FreeTypeDef, ::std::error_code > do_stuff( const ::smoke::FreePoint& point, const ::smoke::FreeEnum mode ) = 0;
};
}