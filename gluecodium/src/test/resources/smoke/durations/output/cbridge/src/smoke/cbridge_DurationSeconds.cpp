//
//
#include "cbridge/include/smoke/cbridge_DurationSeconds.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/DurationHash.h"
#include "gluecodium/Optional.h"
#include "smoke/DurationSeconds.h"
#include <chrono>
#include <memory>
#include <new>
void smoke_DurationSeconds_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::DurationSeconds >>(handle);
}
_baseRef smoke_DurationSeconds_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::DurationSeconds >>(handle)))
        : 0;
}
const void* smoke_DurationSeconds_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::DurationSeconds >>(handle)->get())
        : nullptr;
}
void smoke_DurationSeconds_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::DurationSeconds >>(handle)->get(), swift_pointer);
}
void smoke_DurationSeconds_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::DurationSeconds >>(handle)->get());
}
double smoke_DurationSeconds_durationFunction(_baseRef _instance, double input) {
    return Conversion<::std::chrono::seconds>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::DurationSeconds >>(_instance)->get()->duration_function(Conversion<::std::chrono::seconds>::toCpp(input)));
}
_baseRef smoke_DurationSeconds_nullableDurationFunction(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< ::std::chrono::seconds >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::DurationSeconds >>(_instance)->get()->nullable_duration_function(Conversion<::gluecodium::optional< ::std::chrono::seconds >>::toCpp(input)));
}
double smoke_DurationSeconds_durationProperty_get(_baseRef _instance) {
    return Conversion<::std::chrono::seconds>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::DurationSeconds >>(_instance)->get()->get_duration_property());
}
void smoke_DurationSeconds_durationProperty_set(_baseRef _instance, double value) {
    return get_pointer<::std::shared_ptr< ::smoke::DurationSeconds >>(_instance)->get()->set_duration_property(Conversion<::std::chrono::seconds>::toCpp(value));
}
_baseRef
smoke_DurationSeconds_DurationStruct_create_handle( double durationField )
{
    ::smoke::DurationSeconds::DurationStruct* _struct = new ( ::std::nothrow ) ::smoke::DurationSeconds::DurationStruct();
    _struct->duration_field = Conversion<::std::chrono::seconds>::toCpp( durationField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_DurationSeconds_DurationStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::DurationSeconds::DurationStruct>( handle );
}
_baseRef
smoke_DurationSeconds_DurationStruct_create_optional_handle(double durationField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::DurationSeconds::DurationStruct>( ::smoke::DurationSeconds::DurationStruct( ) );
    (*_struct)->duration_field = Conversion<::std::chrono::seconds>::toCpp( durationField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_DurationSeconds_DurationStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::DurationSeconds::DurationStruct>*>( handle ) );
}
void smoke_DurationSeconds_DurationStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::DurationSeconds::DurationStruct>*>( handle );
}
double smoke_DurationSeconds_DurationStruct_durationField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::DurationSeconds::DurationStruct>(handle);
    return Conversion<::std::chrono::seconds>::toBaseRef(struct_pointer->duration_field);
}
