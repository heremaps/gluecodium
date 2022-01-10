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
struct _GLUECODIUM_CPP_EXPORT FieldConstructorWithParentComment {
    ::std::string string_field;
    /**
     * There are constructors
     */
    FieldConstructorWithParentComment( );
    /**
     * There are constructors
     * \param string_field
     */
    explicit FieldConstructorWithParentComment( ::std::string string_field );
};
}
