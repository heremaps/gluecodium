// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/FreeEnum.h"
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FreePoint {
    _GLUECODIUM_CPP_EXPORT static const ::smoke::FreeEnum A_BAR;
    double x;
    double y;
    FreePoint( );
    FreePoint( double x, double y );
    ::smoke::FreePoint flip(  ) const;
};
}
