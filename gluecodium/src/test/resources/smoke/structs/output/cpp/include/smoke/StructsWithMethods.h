// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Return.h"
#include <cstdint>
#include <system_error>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT Vector {
    double x;
    double y;
    Vector( );
    Vector( double x, double y );
    double distance_to( const ::smoke::Vector& other ) const;
    ::smoke::Vector add( const ::smoke::Vector& other ) const;
    static bool validate( const double x, const double y );
    static ::smoke::Vector create( const double x, const double y );
    static ::gluecodium::Return< ::smoke::Vector, ::std::error_code > create( const ::smoke::Vector& other );
    static ::smoke::Vector create( const uint64_t input );
};
}
