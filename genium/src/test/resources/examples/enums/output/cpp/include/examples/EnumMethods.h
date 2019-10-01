// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "examples/Enums.h"
#include "gluecodium/Export.h"
namespace examples {
class _GLUECODIUM_CPP_EXPORT EnumMethods {
public:
    EnumMethods();
    virtual ~EnumMethods() = 0;
public:
    static ::examples::ShoeSizes method_with_enumeration( const ::examples::ShoeSizes input );
};
}