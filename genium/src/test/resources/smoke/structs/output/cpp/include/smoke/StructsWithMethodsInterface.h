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
#include "genium/TypeRepository.h"
#include <string>
#include <system_error>
namespace smoke {
class _GENIUM_CPP_EXPORT StructsWithMethodsInterface {
public:
    StructsWithMethodsInterface();
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
    static bool validate( const double x, const double y, const double z );
    static ::smoke::StructsWithMethodsInterface::Vector3 create( const ::std::string& input );
    static ::genium::Return< ::smoke::StructsWithMethodsInterface::Vector3, ::std::error_code > create( const ::smoke::StructsWithMethodsInterface::Vector3& other );
};
};
}
