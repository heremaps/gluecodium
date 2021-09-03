// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FieldConstructorWithExcludedOnly {
    ::std::string string_field;
    FieldConstructorWithExcludedOnly( );
    /**
     * \private
     * \param string_field
     */
    FieldConstructorWithExcludedOnly( ::std::string string_field );
};
}
