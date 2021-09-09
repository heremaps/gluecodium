// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FieldConstructorWithDeprecationOnly {
    ::std::string string_field;
    FieldConstructorWithDeprecationOnly( );
    /**
     * \deprecated Shouldn't really use it
     * \param string_field
     */
    FieldConstructorWithDeprecationOnly( ::std::string string_field );
};
}
