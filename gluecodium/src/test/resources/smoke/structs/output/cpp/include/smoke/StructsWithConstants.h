// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "smoke/RouteUtils.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT Route {
    ::std::string description;
    ::smoke::RouteType type;
    Route( );
    Route( ::std::string description, ::smoke::RouteType type );
    _GLUECODIUM_CPP_EXPORT static const ::std::string DEFAULT_DESCRIPTION;
    _GLUECODIUM_CPP_EXPORT static const ::smoke::RouteType DEFAULT_TYPE;
};
}
