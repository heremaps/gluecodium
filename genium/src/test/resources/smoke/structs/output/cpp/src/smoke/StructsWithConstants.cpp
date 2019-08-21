// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#include "smoke/StructsWithConstants.h"
namespace genium {
}
namespace smoke {
const ::std::string Route::DEFAULT_DESCRIPTION = "Nonsense";
const ::smoke::RouteType Route::DEFAULT_TYPE = ::smoke::RouteType::EQUESTRIAN;
Route::Route( )
    : description{ }, type{ }
{
}
Route::Route( const ::std::string& description, const ::smoke::RouteType type )
    : description( description ), type( type )
{
}
}