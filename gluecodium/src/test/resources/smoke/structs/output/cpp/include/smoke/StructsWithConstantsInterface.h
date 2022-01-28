// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/VectorHash.h"
#include "smoke/RouteUtils.h"
#include <string>
#include <vector>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT StructsWithConstantsInterface {
public:
    StructsWithConstantsInterface();
    virtual ~StructsWithConstantsInterface() = 0;
public:
    struct _GLUECODIUM_CPP_EXPORT MultiRoute {
        static const ::std::string DEFAULT_DESCRIPTION;
        static const ::smoke::RouteType DEFAULT_TYPE;
        ::std::vector< ::std::string > descriptions;
        ::smoke::RouteType type;
        MultiRoute( );
        MultiRoute( ::std::vector< ::std::string > descriptions, ::smoke::RouteType type );
    };
    struct _GLUECODIUM_CPP_EXPORT StructWithConstantsOnly {
        static const ::std::string DEFAULT_DESCRIPTION;
    };
};
}
