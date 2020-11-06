//
//
#include "cbridge/include/smoke/cbridge_FreePoint.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/FreePoint.h"
#include <memory>
#include <new>
_baseRef
smoke_FreePoint_create_handle( double x, double y )
{
    ::smoke::FreePoint* _struct = new ( std::nothrow ) ::smoke::FreePoint();
    _struct->x = x;
    _struct->y = y;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_FreePoint_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::FreePoint>( handle );
}
_baseRef
smoke_FreePoint_create_optional_handle(double x, double y)
{
    auto _struct = new ( std::nothrow ) ::gluecodium::optional<::smoke::FreePoint>( ::smoke::FreePoint( ) );
    (*_struct)->x = x;
    (*_struct)->y = y;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_FreePoint_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::FreePoint>*>( handle ) );
}
void smoke_FreePoint_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::FreePoint>*>( handle );
}
double smoke_FreePoint_x_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::FreePoint>(handle);
    return struct_pointer->x;
}
double smoke_FreePoint_y_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::FreePoint>(handle);
    return struct_pointer->y;
}
_baseRef smoke_FreePoint_flip(_baseRef _instance) {
    return Conversion<::smoke::FreePoint>::toBaseRef(get_pointer<::smoke::FreePoint>(_instance)->flip());
}
