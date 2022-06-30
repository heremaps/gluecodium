// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include <cstdint>
#include <system_error>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructsWithMethods {
    struct _GLUECODIUM_CPP_EXPORT Vector {
        double x;
        double y;
        Vector( );
        Vector( double x, double y );
        double distance_to( const ::smoke::StructsWithMethods::Vector& other ) const;
        ::smoke::StructsWithMethods::Vector add( const ::smoke::StructsWithMethods::Vector& other ) const;
        static bool validate( const double x, const double y );
        static ::smoke::StructsWithMethods::Vector create( const double x, const double y );
        static ::gluecodium::Return< ::smoke::StructsWithMethods::Vector, ::std::error_code > create( const ::smoke::StructsWithMethods::Vector& other );
        static ::smoke::StructsWithMethods::Vector create( const uint64_t input );
    };
};
}
