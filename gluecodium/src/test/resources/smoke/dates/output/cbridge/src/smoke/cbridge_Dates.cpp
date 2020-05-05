//
//
#include "cbridge/include/DateHandle.h"
#include "cbridge/include/smoke/cbridge_Dates.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/Dates.h"
#include <chrono>
#include <memory>
#include <new>
void smoke_Dates_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::Dates>>(handle);
}
_baseRef smoke_Dates_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::Dates>>(handle)))
        : 0;
}
const void* smoke_Dates_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? get_wrapper_cache().get_cached_wrapper(get_pointer<std::shared_ptr<::smoke::Dates>>(handle)->get())
        : nullptr;
}
void smoke_Dates_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    get_wrapper_cache().cache_wrapper(get_pointer<std::shared_ptr<::smoke::Dates>>(handle)->get(), swift_pointer);
}
void smoke_Dates_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!wrapper_cache_is_alive) return;
    get_wrapper_cache().remove_cached_wrapper(get_pointer<std::shared_ptr<::smoke::Dates>>(handle)->get());
}
_baseRef
smoke_Dates_DateStruct_create_handle( double dateField )
{
    ::smoke::Dates::DateStruct* _struct = new ( std::nothrow ) ::smoke::Dates::DateStruct();
    _struct->date_field = Conversion<std::chrono::system_clock::time_point>::toCpp( dateField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Dates_DateStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Dates::DateStruct>( handle );
}
_baseRef
smoke_Dates_DateStruct_create_optional_handle(double dateField)
{
    auto _struct = new ( std::nothrow ) ::gluecodium::optional<::smoke::Dates::DateStruct>( ::smoke::Dates::DateStruct( ) );
    (*_struct)->date_field = Conversion<std::chrono::system_clock::time_point>::toCpp( dateField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Dates_DateStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::Dates::DateStruct>*>( handle ) );
}
void smoke_Dates_DateStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::Dates::DateStruct>*>( handle );
}
double smoke_Dates_DateStruct_dateField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Dates::DateStruct>(handle);
return Conversion<std::chrono::system_clock::time_point>::toBaseRef(struct_pointer->date_field);
}
double smoke_Dates_dateMethod(_baseRef _instance, double input) {
    return Conversion<std::chrono::system_clock::time_point>::toBaseRef(get_pointer<std::shared_ptr<::smoke::Dates>>(_instance)->get()->date_method(Conversion<std::chrono::system_clock::time_point>::toCpp(input)));
}
double smoke_Dates_dateProperty_get(_baseRef _instance) {
    return Conversion<std::chrono::system_clock::time_point>::toBaseRef(get_pointer<std::shared_ptr<::smoke::Dates>>(_instance)->get()->get_date_property());
}
void smoke_Dates_dateProperty_set(_baseRef _instance, double newValue) {
    return get_pointer<std::shared_ptr<::smoke::Dates>>(_instance)->get()->set_date_property(Conversion<std::chrono::system_clock::time_point>::toCpp(newValue));
}
