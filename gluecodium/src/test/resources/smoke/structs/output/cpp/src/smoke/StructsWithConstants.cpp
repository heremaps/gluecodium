// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/StructsWithConstants.h"
#include <utility>
namespace smoke {
const ::std::string Route::DEFAULT_DESCRIPTION = "Nonsense";
const ::smoke::RouteType Route::DEFAULT_TYPE = ::smoke::RouteType::EQUESTRIAN;
Route::Route( )
    : description{ }, type{ }
{
}
Route::Route( ::std::string description, ::smoke::RouteType type )
    : description( std::move( description ) ), type( std::move( type ) )
{
}
}
