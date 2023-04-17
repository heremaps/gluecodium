//
//
#include "cbridge/include/smoke/cbridge_StructsWithMethods.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/StructsWithMethods.h"
#include "smoke/ValidationUtils.h"
#include <memory>
#include <new>
#include <optional>
_baseRef
smoke_StructsWithMethods_Vector_create_handle( double x, double y )
{
    ::smoke::StructsWithMethods::Vector* _struct = new ( ::std::nothrow ) ::smoke::StructsWithMethods::Vector();
    _struct->x = x;
    _struct->y = y;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_StructsWithMethods_Vector_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::StructsWithMethods::Vector>( handle );
}
_baseRef
smoke_StructsWithMethods_Vector_create_optional_handle(double x, double y)
{
    auto _struct = new ( ::std::nothrow ) std::optional<::smoke::StructsWithMethods::Vector>( ::smoke::StructsWithMethods::Vector( ) );
    (*_struct)->x = x;
    (*_struct)->y = y;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_StructsWithMethods_Vector_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::smoke::StructsWithMethods::Vector>*>( handle ) );
}
void smoke_StructsWithMethods_Vector_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::smoke::StructsWithMethods::Vector>*>( handle );
}
double smoke_StructsWithMethods_Vector_x_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::StructsWithMethods::Vector>(handle);
    return struct_pointer->x;
}
double smoke_StructsWithMethods_Vector_y_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::StructsWithMethods::Vector>(handle);
    return struct_pointer->y;
}
double smoke_StructsWithMethods_Vector_distanceTo(_baseRef _instance, _baseRef other) {
    return get_pointer<::smoke::StructsWithMethods::Vector>(_instance)->distance_to(Conversion<::smoke::StructsWithMethods::Vector>::toCpp(other));
}
_baseRef smoke_StructsWithMethods_Vector_add(_baseRef _instance, _baseRef other) {
    return Conversion<::smoke::StructsWithMethods::Vector>::toBaseRef(get_pointer<::smoke::StructsWithMethods::Vector>(_instance)->add(Conversion<::smoke::StructsWithMethods::Vector>::toCpp(other)));
}
bool smoke_StructsWithMethods_Vector_validate(double x, double y) {
    return ::smoke::StructsWithMethods::Vector::validate(x, y);
}
_baseRef smoke_StructsWithMethods_Vector_create_Double_Double(double x, double y) {
    return Conversion<::smoke::StructsWithMethods::Vector>::toBaseRef(::smoke::StructsWithMethods::Vector::create(x, y));
}
smoke_StructsWithMethods_Vector_create_Vector_result smoke_StructsWithMethods_Vector_create_Vector(_baseRef other) {
    auto&& RESULT = ::smoke::StructsWithMethods::Vector::create(Conversion<::smoke::StructsWithMethods::Vector>::toCpp(other));
    if (RESULT.has_value()) {
        return {.has_value = true, .returned_value = Conversion<::smoke::StructsWithMethods::Vector>::toBaseRef(RESULT.unsafe_value())};
    } else {
        return {.has_value = false, .error_value = static_cast< uint32_t >(RESULT.error().value())};
    }
}
