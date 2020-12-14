// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "foo/Bar.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT Enums {
public:
    Enums();
    virtual ~Enums() = 0;
public:
public:
    static void method_with_external_enum( const ::smoke::Enums::External_Enum input );
};
}
