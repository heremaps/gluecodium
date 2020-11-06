//
//
#include "cbridge/include/smoke/cbridge_StructsWithMethodsInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/StructsWithMethodsInterface.h"
#include "smoke/ValidationUtils.h"
#include <memory>
#include <new>
#include <string>
void smoke_StructsWithMethodsInterface_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::StructsWithMethodsInterface>>(handle);
}
_baseRef smoke_StructsWithMethodsInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::StructsWithMethodsInterface>>(handle)))
        : 0;
}
const void* smoke_StructsWithMethodsInterface_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<std::shared_ptr<::smoke::StructsWithMethodsInterface>>(handle)->get())
        : nullptr;
}
void smoke_StructsWithMethodsInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<std::shared_ptr<::smoke::StructsWithMethodsInterface>>(handle)->get(), swift_pointer);
}
void smoke_StructsWithMethodsInterface_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<std::shared_ptr<::smoke::StructsWithMethodsInterface>>(handle)->get());
}
_baseRef
smoke_StructsWithMethodsInterface_Vector3_create_handle( double x, double y, double z )
{
    ::smoke::StructsWithMethodsInterface::Vector3* _struct = new ( std::nothrow ) ::smoke::StructsWithMethodsInterface::Vector3();
    _struct->x = x;
    _struct->y = y;
    _struct->z = z;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_StructsWithMethodsInterface_Vector3_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::StructsWithMethodsInterface::Vector3>( handle );
}
_baseRef
smoke_StructsWithMethodsInterface_Vector3_create_optional_handle(double x, double y, double z)
{
    auto _struct = new ( std::nothrow ) ::gluecodium::optional<::smoke::StructsWithMethodsInterface::Vector3>( ::smoke::StructsWithMethodsInterface::Vector3( ) );
    (*_struct)->x = x;
    (*_struct)->y = y;
    (*_struct)->z = z;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_StructsWithMethodsInterface_Vector3_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::StructsWithMethodsInterface::Vector3>*>( handle ) );
}
void smoke_StructsWithMethodsInterface_Vector3_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::StructsWithMethodsInterface::Vector3>*>( handle );
}
double smoke_StructsWithMethodsInterface_Vector3_x_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::StructsWithMethodsInterface::Vector3>(handle);
    return struct_pointer->x;
}
double smoke_StructsWithMethodsInterface_Vector3_y_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::StructsWithMethodsInterface::Vector3>(handle);
    return struct_pointer->y;
}
double smoke_StructsWithMethodsInterface_Vector3_z_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::StructsWithMethodsInterface::Vector3>(handle);
    return struct_pointer->z;
}
double smoke_StructsWithMethodsInterface_Vector3_distanceTo(_baseRef _instance, _baseRef other) {
    return get_pointer<::smoke::StructsWithMethodsInterface::Vector3>(_instance)->distance_to(Conversion<::smoke::StructsWithMethodsInterface::Vector3>::toCpp(other));
}
_baseRef smoke_StructsWithMethodsInterface_Vector3_add(_baseRef _instance, _baseRef other) {
    return Conversion<::smoke::StructsWithMethodsInterface::Vector3>::toBaseRef(get_pointer<::smoke::StructsWithMethodsInterface::Vector3>(_instance)->add(Conversion<::smoke::StructsWithMethodsInterface::Vector3>::toCpp(other)));
}
bool smoke_StructsWithMethodsInterface_Vector3_validate(double x, double y, double z) {
    return ::smoke::StructsWithMethodsInterface::Vector3::validate(x, y, z);
}
_baseRef smoke_StructsWithMethodsInterface_Vector3_create_String(_baseRef input) {
    return Conversion<::smoke::StructsWithMethodsInterface::Vector3>::toBaseRef(::smoke::StructsWithMethodsInterface::Vector3::create(Conversion<std::string>::toCpp(input)));
}
smoke_StructsWithMethodsInterface_Vector3_create_Vector3_result smoke_StructsWithMethodsInterface_Vector3_create_Vector3(_baseRef other) {
    auto&& RESULT = ::smoke::StructsWithMethodsInterface::Vector3::create(Conversion<::smoke::StructsWithMethodsInterface::Vector3>::toCpp(other));
    if (RESULT.has_value()) {
        return {true, .returned_value = Conversion<::smoke::StructsWithMethodsInterface::Vector3>::toBaseRef(RESULT.unsafe_value())};
    } else {
        return {false, .error_value = static_cast< smoke_ValidationUtils_ValidationErrorCode >(RESULT.error().value())};
    }
}
void smoke_StructsWithMethodsInterface_StructWithStaticMethodsOnly_doStuff() {
    return ::smoke::StructsWithMethodsInterface::StructWithStaticMethodsOnly::do_stuff();
}
