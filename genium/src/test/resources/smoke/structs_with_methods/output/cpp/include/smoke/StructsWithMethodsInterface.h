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
class _GENIUM_CPP_EXPORT StructsWithMethodsInterface {
public:
    virtual ~StructsWithMethodsInterface() = 0;
public:
struct _GENIUM_CPP_EXPORT Vector3 {
    double x;
    double y;
    double z;
    Vector3( );
    Vector3( const double x, const double y, const double z );
    double distance_to( const ::smoke::StructsWithMethodsInterface::Vector3& other ) const;
    ::smoke::StructsWithMethodsInterface::Vector3 add( const ::smoke::StructsWithMethodsInterface::Vector3& other ) const;
};
};
}
