// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/StructsWithConstantsInterface.h"
#include <utility>
namespace smoke {
StructsWithConstantsInterface::StructsWithConstantsInterface() {
}
StructsWithConstantsInterface::~StructsWithConstantsInterface() {
}
const ::smoke::RouteUtils::RouteType StructsWithConstantsInterface::MultiRoute::DEFAULT_TYPE = ::smoke::RouteUtils::RouteType::NONE;
StructsWithConstantsInterface::MultiRoute::MultiRoute( )
    : descriptions{ }, type{ }
{
}
StructsWithConstantsInterface::MultiRoute::MultiRoute( ::std::vector< ::std::string > descriptions, ::smoke::RouteUtils::RouteType type )
    : descriptions( std::move( descriptions ) ), type( std::move( type ) )
{
}
}
