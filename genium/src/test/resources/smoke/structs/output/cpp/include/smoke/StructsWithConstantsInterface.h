// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/VectorHash.h"
#include "smoke/RouteUtils.h"
#include <string>
#include <vector>
namespace smoke {
class _GENIUM_CPP_EXPORT StructsWithConstantsInterface {
public:
    StructsWithConstantsInterface();
    virtual ~StructsWithConstantsInterface() = 0;
public:
struct _GENIUM_CPP_EXPORT MultiRoute {
    ::std::vector< ::std::string > descriptions;
    ::smoke::RouteType type;
    MultiRoute( );
    MultiRoute( const ::std::vector< ::std::string >& descriptions, const ::smoke::RouteType type );
    _GENIUM_CPP_EXPORT static const ::std::string DEFAULT_DESCRIPTION;
    _GENIUM_CPP_EXPORT static const ::smoke::RouteType DEFAULT_TYPE;
};
};
}