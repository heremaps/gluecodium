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
namespace smoke {
struct _GENIUM_CPP_EXPORT Vector {
    double x;
    double y;
    Vector( );
    Vector( const double x, const double y );

    double distance_to( const ::smoke::Vector& other ) const;
    ::smoke::Vector add( const ::smoke::Vector& other ) const;
};
}
