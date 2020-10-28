// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <string>
namespace smoke {
/**
 * \deprecated
 */
struct _GLUECODIUM_CPP_EXPORT DeprecatedWithNoMessage {
    ::std::string field;
    DeprecatedWithNoMessage( );
    DeprecatedWithNoMessage( ::std::string field );
};
}
