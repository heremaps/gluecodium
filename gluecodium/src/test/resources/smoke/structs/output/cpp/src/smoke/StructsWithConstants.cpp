// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/StructsWithConstants.h"
#include <utility>
namespace smoke {
const ::smoke::RouteUtils::RouteType StructsWithConstants::Route::DEFAULT_TYPE = ::smoke::RouteUtils::RouteType::EQUESTRIAN;
StructsWithConstants::Route::Route( )
    : description{ }, type{ }
{
}
StructsWithConstants::Route::Route( ::std::string description, ::smoke::RouteUtils::RouteType type )
    : description( std::move( description ) ), type( std::move( type ) )
{
}
}
