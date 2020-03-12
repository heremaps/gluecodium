// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <string>
namespace smoke {
namespace off {
class _GLUECODIUM_CPP_EXPORT NestedPackages {
public:
    NestedPackages();
    virtual ~NestedPackages() = 0;
public:
    struct _GLUECODIUM_CPP_EXPORT SomeStruct {
        ::std::string some_field;
        SomeStruct( );
        SomeStruct( ::std::string some_field );
    };
public:
    static ::smoke::off::NestedPackages::SomeStruct basic_method( const ::smoke::off::NestedPackages::SomeStruct& input );
};
}
}
