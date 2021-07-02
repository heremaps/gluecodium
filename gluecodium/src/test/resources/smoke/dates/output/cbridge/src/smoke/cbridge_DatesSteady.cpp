//
//
#include "cbridge/include/smoke/cbridge_DatesSteady.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/VectorHash.h"
#include "smoke/DatesSteady.h"
#include <memory>
#include <new>
#include <vector>
void smoke_DatesSteady_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::DatesSteady >>(handle);
}
_baseRef smoke_DatesSteady_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::DatesSteady >>(handle)))
        : 0;
}
const void* smoke_DatesSteady_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::DatesSteady >>(handle)->get())
        : nullptr;
}
void smoke_DatesSteady_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::DatesSteady >>(handle)->get(), swift_pointer);
}
void smoke_DatesSteady_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::DatesSteady >>(handle)->get());
}
double smoke_DatesSteady_dateMethod(_baseRef _instance, double input) {
    return Conversion<std::chrono::steady_clock::time_point>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::DatesSteady >>(_instance)->get()->date_method(Conversion<std::chrono::steady_clock::time_point>::toCpp(input)));
}
_baseRef smoke_DatesSteady_nullableDateMethod(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< std::chrono::steady_clock::time_point >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::DatesSteady >>(_instance)->get()->nullable_date_method(Conversion<::gluecodium::optional< std::chrono::steady_clock::time_point >>::toCpp(input)));
}
_baseRef smoke_DatesSteady_dateListMethod(_baseRef _instance, _baseRef input) {
    return Conversion<::std::vector< std::chrono::steady_clock::time_point >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::DatesSteady >>(_instance)->get()->date_list_method(Conversion<::std::vector< std::chrono::steady_clock::time_point >>::toCpp(input)));
}
_baseRef
smoke_DatesSteady_DateStruct_create_handle( double dateField, _baseRef nullableDateField )
{
    ::smoke::DatesSteady::DateStruct* _struct = new ( ::std::nothrow ) ::smoke::DatesSteady::DateStruct();
    _struct->date_field = Conversion<std::chrono::steady_clock::time_point>::toCpp( dateField );
    _struct->nullable_date_field = Conversion<::gluecodium::optional< std::chrono::steady_clock::time_point >>::toCpp( nullableDateField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_DatesSteady_DateStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::DatesSteady::DateStruct>( handle );
}
_baseRef
smoke_DatesSteady_DateStruct_create_optional_handle(double dateField, _baseRef nullableDateField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::DatesSteady::DateStruct>( ::smoke::DatesSteady::DateStruct( ) );
    (*_struct)->date_field = Conversion<std::chrono::steady_clock::time_point>::toCpp( dateField );
    (*_struct)->nullable_date_field = Conversion<::gluecodium::optional< std::chrono::steady_clock::time_point >>::toCpp( nullableDateField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_DatesSteady_DateStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::DatesSteady::DateStruct>*>( handle ) );
}
void smoke_DatesSteady_DateStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::DatesSteady::DateStruct>*>( handle );
}
double smoke_DatesSteady_DateStruct_dateField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::DatesSteady::DateStruct>(handle);
    return Conversion<std::chrono::steady_clock::time_point>::toBaseRef(struct_pointer->date_field);
}
_baseRef smoke_DatesSteady_DateStruct_nullableDateField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::DatesSteady::DateStruct>(handle);
    return Conversion<::gluecodium::optional< std::chrono::steady_clock::time_point >>::toBaseRef(struct_pointer->nullable_date_field);
}
