// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/RouteUtils.h"
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructsWithConstants {
    struct _GLUECODIUM_CPP_EXPORT Route {
        static const ::std::string DEFAULT_DESCRIPTION;
        static const ::smoke::RouteUtils::RouteType DEFAULT_TYPE;
        ::std::string description;
        ::smoke::RouteUtils::RouteType type;
        Route( );
        Route( ::std::string description, ::smoke::RouteUtils::RouteType type );
    };
};
}
