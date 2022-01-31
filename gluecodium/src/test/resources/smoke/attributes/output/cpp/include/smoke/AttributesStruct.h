// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT [[OnStruct]] AttributesStruct {
    [[OnConstInStruct]]
    static const bool PI;
    [[OnField]]
    ::std::string field;
    AttributesStruct( );
    explicit AttributesStruct( ::std::string field );
    [[OnFunctionInStruct]]
    void very_fun( [[OnParameterInStruct]] const ::std::string& param ) const;
};
}
