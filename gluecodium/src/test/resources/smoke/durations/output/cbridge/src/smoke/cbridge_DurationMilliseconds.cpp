//
//
#include "cbridge/include/smoke/cbridge_DurationMilliseconds.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/DurationHash.h"
#include "gluecodium/Optional.h"
#include "smoke/DurationMilliseconds.h"
#include <chrono>
#include <memory>
#include <new>
void smoke_DurationMilliseconds_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::DurationMilliseconds >>(handle);
}
_baseRef smoke_DurationMilliseconds_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::DurationMilliseconds >>(handle)))
        : 0;
}
const void* smoke_DurationMilliseconds_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::DurationMilliseconds >>(handle)->get())
        : nullptr;
}
void smoke_DurationMilliseconds_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::DurationMilliseconds >>(handle)->get(), swift_pointer);
}
void smoke_DurationMilliseconds_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::DurationMilliseconds >>(handle)->get());
}
double smoke_DurationMilliseconds_durationFunction(_baseRef _instance, double input) {
    return Conversion<std::chrono::milliseconds>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::DurationMilliseconds >>(_instance)->get()->duration_function(Conversion<std::chrono::milliseconds>::toCpp(input)));
}
_baseRef smoke_DurationMilliseconds_nullableDurationFunction(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< std::chrono::milliseconds >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::DurationMilliseconds >>(_instance)->get()->nullable_duration_function(Conversion<::gluecodium::optional< std::chrono::milliseconds >>::toCpp(input)));
}
double smoke_DurationMilliseconds_durationProperty_get(_baseRef _instance) {
    return Conversion<std::chrono::milliseconds>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::DurationMilliseconds >>(_instance)->get()->get_duration_property());
}
void smoke_DurationMilliseconds_durationProperty_set(_baseRef _instance, double value) {
    return get_pointer<::std::shared_ptr< ::smoke::DurationMilliseconds >>(_instance)->get()->set_duration_property(Conversion<std::chrono::milliseconds>::toCpp(value));
}
_baseRef
smoke_DurationMilliseconds_DurationStruct_create_handle( double durationField )
{
    ::smoke::DurationMilliseconds::DurationStruct* _struct = new ( ::std::nothrow ) ::smoke::DurationMilliseconds::DurationStruct();
    _struct->duration_field = Conversion<std::chrono::milliseconds>::toCpp( durationField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_DurationMilliseconds_DurationStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::DurationMilliseconds::DurationStruct>( handle );
}
_baseRef
smoke_DurationMilliseconds_DurationStruct_create_optional_handle(double durationField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::DurationMilliseconds::DurationStruct>( ::smoke::DurationMilliseconds::DurationStruct( ) );
    (*_struct)->duration_field = Conversion<std::chrono::milliseconds>::toCpp( durationField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_DurationMilliseconds_DurationStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::DurationMilliseconds::DurationStruct>*>( handle ) );
}
void smoke_DurationMilliseconds_DurationStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::DurationMilliseconds::DurationStruct>*>( handle );
}
double smoke_DurationMilliseconds_DurationStruct_durationField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::DurationMilliseconds::DurationStruct>(handle);
    return Conversion<std::chrono::milliseconds>::toBaseRef(struct_pointer->duration_field);
}
