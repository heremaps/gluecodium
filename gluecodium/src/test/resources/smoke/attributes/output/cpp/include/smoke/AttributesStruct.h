// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT [[OnStruct]] AttributesStruct {
    [[OnField]]
    ::std::string field;
    AttributesStruct( );
    AttributesStruct( ::std::string field );
    [[OnConstInStruct]]
    _GLUECODIUM_CPP_EXPORT static const bool PI;
    [[OnFunctionInStruct]]
    void very_fun( [[OnParameterInStruct]] const ::std::string& param ) const;
};
}
