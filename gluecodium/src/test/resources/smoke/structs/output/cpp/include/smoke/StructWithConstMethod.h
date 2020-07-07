// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructWithConstMethod {
    ::std::string string_field;
    StructWithConstMethod( );
    StructWithConstMethod( ::std::string string_field );
    double double_const(  ) const;
};
}
