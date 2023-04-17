// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace smoke {
/**
 * \deprecated
 */
struct _GLUECODIUM_CPP_EXPORT DeprecatedWithNoMessage {
    ::std::string field = "";
    DeprecatedWithNoMessage( );
    explicit DeprecatedWithNoMessage( ::std::string field );
};
}
