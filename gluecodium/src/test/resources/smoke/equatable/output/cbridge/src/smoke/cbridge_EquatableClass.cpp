//
//
#include "cbridge/include/smoke/cbridge_EquatableClass.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "smoke/EquatableClass.h"
#include "smoke/PointerEquatableClass.h"
#include <cstdint>
#include <memory>
#include <new>
#include <optional>
#include <string>
void smoke_EquatableClass_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::EquatableClass >>(handle);
}
_baseRef smoke_EquatableClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::EquatableClass >>(handle)))
        : 0;
}
const void* smoke_EquatableClass_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::EquatableClass >>(handle)->get())
        : nullptr;
}
void smoke_EquatableClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::EquatableClass >>(handle)->get(), swift_pointer);
}
void smoke_EquatableClass_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::EquatableClass >>(handle)->get());
}
bool smoke_EquatableClass_equal(_baseRef lhs, _baseRef rhs) {
    return **get_pointer<::std::shared_ptr< ::smoke::EquatableClass >>(lhs) == **get_pointer<::std::shared_ptr< ::smoke::EquatableClass >>(rhs);
}
uint64_t smoke_EquatableClass_hash(_baseRef handle) {
    return ::gluecodium::hash<::smoke::EquatableClass>()(**get_pointer<::std::shared_ptr< ::smoke::EquatableClass >>(handle));
}
_baseRef
smoke_EquatableClass_EquatableStruct_create_handle( int32_t intField, _baseRef stringField, _baseRef nestedEquatableInstance, _baseRef nestedPointerEquatableInstance )
{
    ::smoke::EquatableClass::EquatableStruct* _struct = new ( ::std::nothrow ) ::smoke::EquatableClass::EquatableStruct();
    _struct->int_field = intField;
    _struct->string_field = Conversion<::std::string>::toCpp( stringField );
    _struct->nested_equatable_instance = Conversion<::std::shared_ptr< ::smoke::EquatableClass >>::toCpp( nestedEquatableInstance );
    _struct->nested_pointer_equatable_instance = Conversion<::std::shared_ptr< ::smoke::PointerEquatableClass >>::toCpp( nestedPointerEquatableInstance );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_EquatableClass_EquatableStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::EquatableClass::EquatableStruct>( handle );
}
_baseRef
smoke_EquatableClass_EquatableStruct_create_optional_handle(int32_t intField, _baseRef stringField, _baseRef nestedEquatableInstance, _baseRef nestedPointerEquatableInstance)
{
    auto _struct = new ( ::std::nothrow ) std::optional<::smoke::EquatableClass::EquatableStruct>( ::smoke::EquatableClass::EquatableStruct( ) );
    (*_struct)->int_field = intField;
    (*_struct)->string_field = Conversion<::std::string>::toCpp( stringField );
    (*_struct)->nested_equatable_instance = Conversion<::std::shared_ptr< ::smoke::EquatableClass >>::toCpp( nestedEquatableInstance );
    (*_struct)->nested_pointer_equatable_instance = Conversion<::std::shared_ptr< ::smoke::PointerEquatableClass >>::toCpp( nestedPointerEquatableInstance );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_EquatableClass_EquatableStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::smoke::EquatableClass::EquatableStruct>*>( handle ) );
}
void smoke_EquatableClass_EquatableStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::smoke::EquatableClass::EquatableStruct>*>( handle );
}
int32_t smoke_EquatableClass_EquatableStruct_intField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::EquatableClass::EquatableStruct>(handle);
    return struct_pointer->int_field;
}
_baseRef smoke_EquatableClass_EquatableStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::EquatableClass::EquatableStruct>(handle);
    return Conversion<::std::string>::toBaseRef(struct_pointer->string_field);
}
_baseRef smoke_EquatableClass_EquatableStruct_nestedEquatableInstance_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::EquatableClass::EquatableStruct>(handle);
    return Conversion<::std::shared_ptr< ::smoke::EquatableClass >>::toBaseRef(struct_pointer->nested_equatable_instance);
}
_baseRef smoke_EquatableClass_EquatableStruct_nestedPointerEquatableInstance_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::EquatableClass::EquatableStruct>(handle);
    return Conversion<::std::shared_ptr< ::smoke::PointerEquatableClass >>::toBaseRef(struct_pointer->nested_pointer_equatable_instance);
}
