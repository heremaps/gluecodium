// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructWithConstMethod {
    ::std::string string_field;
    StructWithConstMethod( );
    explicit StructWithConstMethod( ::std::string string_field );
    double double_const(  ) const;
};
}
