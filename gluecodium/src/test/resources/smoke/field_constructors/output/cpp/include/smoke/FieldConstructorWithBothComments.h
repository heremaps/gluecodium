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
struct _GLUECODIUM_CPP_EXPORT FieldConstructorWithBothComments {
    ::std::string string_field;
    /**
     * There are constructors
     */
    FieldConstructorWithBothComments( );
    /**
     * This comment takes precedence
     * \param string_field
     */
    FieldConstructorWithBothComments( ::std::string string_field );
};
}
