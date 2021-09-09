// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FieldConstructorWithDeprecationAndComment {
    ::std::string string_field;
    FieldConstructorWithDeprecationAndComment( );
    /**
     * Some field constructor
     * \deprecated Shouldn't really use it
     * \param string_field
     */
    FieldConstructorWithDeprecationAndComment( ::std::string string_field );
};
}
