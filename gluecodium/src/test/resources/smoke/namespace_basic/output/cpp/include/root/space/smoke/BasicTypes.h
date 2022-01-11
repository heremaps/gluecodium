// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace root {
namespace space {
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT SomeStruct {
    ::std::string some_field;
    SomeStruct( );
    explicit SomeStruct( ::std::string some_field );
};
}
}
}
