//
//
#include "cbridge/include/namerules/cbridge_NameRules.h"
#include "Optional.h"
#include "VectorHash.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "namerules/NameRules.h"
#include <cstdint>
#include <memory>
#include <new>
#include <vector>
void namerules_INameRules_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::namerules::NameRules >>(handle);
}
_baseRef namerules_INameRules_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::namerules::NameRules >>(handle)))
        : 0;
}
const void* namerules_INameRules_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::namerules::NameRules >>(handle)->get())
        : nullptr;
}
void namerules_INameRules_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::namerules::NameRules >>(handle)->get(), swift_pointer);
}
void namerules_INameRules_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::WrapperCache::is_alive) return;
    ::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::namerules::NameRules >>(handle)->get());
}
_baseRef namerules_INameRules_create() {
    return Conversion<::std::shared_ptr< ::namerules::NameRules >>::toBaseRef(::namerules::NameRules::create());
}
namerules_INameRules_someMethod_result namerules_INameRules_someMethod(_baseRef _instance, _baseRef someArgument) {
    auto&& RESULT = get_pointer<::std::shared_ptr< ::namerules::NameRules >>(_instance)->get()->someMethod(Conversion<::namerules::NameRules::ExampleStruct>::toCpp(someArgument));
    if (RESULT.has_value()) {
        return {true, .returned_value = RESULT.unsafe_value()};
    } else {
        return {false, .error_value = static_cast< namerules_INameRules_IExampleErrorCode >(RESULT.error().value())};
    }
}
uint32_t namerules_INameRules_intPropertyPod_get(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::namerules::NameRules >>(_instance)->get()->retrieve_int_property();
}
void namerules_INameRules_intPropertyPod_set(_baseRef _instance, uint32_t value) {
    return get_pointer<::std::shared_ptr< ::namerules::NameRules >>(_instance)->get()->STORE_INT_PROPERTY_NOW(value);
}
bool namerules_INameRules_isBooleanPropertyPod_get(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::namerules::NameRules >>(_instance)->get()->really_boolean_property();
}
void namerules_INameRules_isBooleanPropertyPod_set(_baseRef _instance, bool value) {
    return get_pointer<::std::shared_ptr< ::namerules::NameRules >>(_instance)->get()->STORE_BOOLEAN_PROPERTY_NOW(value);
}
_baseRef namerules_INameRules_structPropertyPod_get(_baseRef _instance) {
    return Conversion<::namerules::NameRules::ExampleStruct>::toBaseRef(get_pointer<::std::shared_ptr< ::namerules::NameRules >>(_instance)->get()->retrieve_struct_property());
}
void namerules_INameRules_structPropertyPod_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::namerules::NameRules >>(_instance)->get()->STORE_STRUCT_PROPERTY_NOW(Conversion<::namerules::NameRules::ExampleStruct>::toCpp(value));
}
_baseRef
namerules_INameRules_IExampleStruct_create_handle( double iValue, _baseRef iIntValue )
{
    ::namerules::NameRules::ExampleStruct* _struct = new ( ::std::nothrow ) ::namerules::NameRules::ExampleStruct();
    _struct->m_value = iValue;
    _struct->m_int_value = Conversion<::std::vector< int64_t >>::toCpp( iIntValue );
    return reinterpret_cast<_baseRef>( _struct );
}
void
namerules_INameRules_IExampleStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::namerules::NameRules::ExampleStruct>( handle );
}
_baseRef
namerules_INameRules_IExampleStruct_create_optional_handle(double iValue, _baseRef iIntValue)
{
    auto _struct = new ( ::std::nothrow ) ::optional<::namerules::NameRules::ExampleStruct>( ::namerules::NameRules::ExampleStruct( ) );
    (*_struct)->m_value = iValue;
    (*_struct)->m_int_value = Conversion<::std::vector< int64_t >>::toCpp( iIntValue );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
namerules_INameRules_IExampleStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::optional<::namerules::NameRules::ExampleStruct>*>( handle ) );
}
void namerules_INameRules_IExampleStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::optional<::namerules::NameRules::ExampleStruct>*>( handle );
}
double namerules_INameRules_IExampleStruct_iValue_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::namerules::NameRules::ExampleStruct>(handle);
    return struct_pointer->m_value;
}
_baseRef namerules_INameRules_IExampleStruct_iIntValue_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::namerules::NameRules::ExampleStruct>(handle);
    return Conversion<::std::vector< int64_t >>::toBaseRef(struct_pointer->m_int_value);
}
