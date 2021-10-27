//
//
#include "cbridge/include/smoke/cbridge_StructsWithMethods.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/StructsWithMethods.h"
#include "smoke/ValidationUtils.h"
#include <memory>
#include <new>
_baseRef
smoke_StructsWithMethods_Vector_create_handle( double x, double y )
{
    ::smoke::Vector* _struct = new ( ::std::nothrow ) ::smoke::Vector();
    _struct->x = x;
    _struct->y = y;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_StructsWithMethods_Vector_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Vector>( handle );
}
_baseRef
smoke_StructsWithMethods_Vector_create_optional_handle(double x, double y)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::Vector>( ::smoke::Vector( ) );
    (*_struct)->x = x;
    (*_struct)->y = y;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_StructsWithMethods_Vector_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::Vector>*>( handle ) );
}
void smoke_StructsWithMethods_Vector_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::Vector>*>( handle );
}
double smoke_StructsWithMethods_Vector_x_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Vector>(handle);
    return struct_pointer->x;
}
double smoke_StructsWithMethods_Vector_y_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Vector>(handle);
    return struct_pointer->y;
}
double smoke_StructsWithMethods_Vector_distanceTo(_baseRef _instance, _baseRef other) {
    return get_pointer<::smoke::Vector>(_instance)->distance_to(Conversion<::smoke::Vector>::toCpp(other));
}
_baseRef smoke_StructsWithMethods_Vector_add(_baseRef _instance, _baseRef other) {
    return Conversion<::smoke::Vector>::toBaseRef(get_pointer<::smoke::Vector>(_instance)->add(Conversion<::smoke::Vector>::toCpp(other)));
}
bool smoke_StructsWithMethods_Vector_validate(double x, double y) {
    return ::smoke::Vector::validate(x, y);
}
_baseRef smoke_StructsWithMethods_Vector_create_Double_Double(double x, double y) {
    return Conversion<::smoke::Vector>::toBaseRef(::smoke::Vector::create(x, y));
}
smoke_StructsWithMethods_Vector_create_Vector_result smoke_StructsWithMethods_Vector_create_Vector(_baseRef other) {
    auto&& RESULT = ::smoke::Vector::create(Conversion<::smoke::Vector>::toCpp(other));
    if (RESULT.has_value()) {
        return {.has_value = true, .returned_value = Conversion<::smoke::Vector>::toBaseRef(RESULT.unsafe_value())};
    } else {
        return {.has_value = false, .error_value = static_cast< uint32_t >(RESULT.error().value())};
    }
}
