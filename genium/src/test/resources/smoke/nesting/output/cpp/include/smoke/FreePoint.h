// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "smoke/FreeEnum.h"
namespace smoke {
struct _GENIUM_CPP_EXPORT FreePoint {
    double x;
    double y;
    FreePoint( );
    FreePoint( const double x, const double y );
    ::smoke::FreePoint flip(  ) const;
    _GENIUM_CPP_EXPORT static const ::smoke::FreeEnum A_BAR;
};
}
