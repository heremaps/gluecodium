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
#include <system_error>
namespace smoke {
struct _GENIUM_CPP_EXPORT Vector {
    double x;
    double y;
    Vector( );
    Vector( const double x, const double y );
    double distance_to( const ::smoke::Vector& other ) const;
    ::smoke::Vector add( const ::smoke::Vector& other ) const;
    static bool validate( const double x, const double y );
    static ::smoke::Vector create( const double x, const double y );
    static ::genium::Return< ::smoke::Vector, ::std::error_code > create( const ::smoke::Vector& other );
};
}
