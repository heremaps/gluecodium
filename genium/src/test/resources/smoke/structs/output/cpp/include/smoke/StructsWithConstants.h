// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "smoke/RouteUtils.h"
#include <string>
namespace smoke {
struct _GENIUM_CPP_EXPORT Route {
    ::std::string description;
    ::smoke::RouteType type;
    Route( );
    Route( const ::std::string& description, const ::smoke::RouteType type );
    _GENIUM_CPP_EXPORT static const ::std::string DEFAULT_DESCRIPTION;
    _GENIUM_CPP_EXPORT static const ::smoke::RouteType DEFAULT_TYPE;
};
}
