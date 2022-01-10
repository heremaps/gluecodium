// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT SkipField {
    ::std::string field;
    SkipField( );
    explicit SkipField( ::std::string field );
};
}
