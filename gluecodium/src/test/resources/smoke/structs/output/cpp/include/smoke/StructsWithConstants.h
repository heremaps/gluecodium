// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/RouteUtils.h"
#include <string>
#include <string_view>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructsWithConstants {
    struct _GLUECODIUM_CPP_EXPORT Route {
        static constexpr std::string_view DEFAULT_DESCRIPTION = "Nonsense";
        static const ::smoke::RouteUtils::RouteType DEFAULT_TYPE;
        ::std::string description;
        ::smoke::RouteUtils::RouteType type;
        Route( );
        Route( ::std::string description, ::smoke::RouteUtils::RouteType type );
    };
};
}
