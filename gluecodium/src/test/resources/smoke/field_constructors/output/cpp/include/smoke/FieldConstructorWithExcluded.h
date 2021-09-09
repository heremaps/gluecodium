// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT FieldConstructorWithExcluded {
    /**
     * Some field
     */
    ::std::string string_field;
    FieldConstructorWithExcluded( );
    /**
     * Some field constructor
     * \private
     * \param string_field Some field
     */
    FieldConstructorWithExcluded( ::std::string string_field );
};
}
