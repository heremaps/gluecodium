// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace smoke {
/**
 * SomeStruct
 */
struct _GLUECODIUM_CPP_EXPORT FieldConstructorWithComment {
    /**
     * Some field
     */
    ::std::string string_field;
    FieldConstructorWithComment( );
    /**
     * Some field constructor
     * \param string_field Some field
     */
    FieldConstructorWithComment( ::std::string string_field );
};
}
