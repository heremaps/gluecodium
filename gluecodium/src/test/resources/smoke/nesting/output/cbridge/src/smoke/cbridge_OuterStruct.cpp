//
//
#include "cbridge/include/smoke/cbridge_OuterStruct.h"
#include "cbridge/include/ByteArrayHandle.h"
#include "cbridge/include/DateHandle.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Locale.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TimePointHash.h"
#include "gluecodium/TypeRepository.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/OuterStruct.h"
#include <chrono>
#include <cstdint>
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
_baseRef
smoke_OuterStruct_create_handle( _baseRef field )
{
    ::smoke::OuterStruct* _struct = new ( ::std::nothrow ) ::smoke::OuterStruct();
    _struct->field = Conversion<::std::string>::toCpp( field );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_OuterStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::OuterStruct>( handle );
}
_baseRef
smoke_OuterStruct_create_optional_handle(_baseRef field)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::OuterStruct>( ::smoke::OuterStruct( ) );
    (*_struct)->field = Conversion<::std::string>::toCpp( field );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_OuterStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::OuterStruct>*>( handle ) );
}
void smoke_OuterStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::OuterStruct>*>( handle );
}
_baseRef smoke_OuterStruct_field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::OuterStruct>(handle);
    return Conversion<::std::string>::toBaseRef(struct_pointer->field);
}
_baseRef
smoke_OuterStruct_InnerStruct_create_handle( _baseRef otherField )
{
    ::smoke::OuterStruct::InnerStruct* _struct = new ( ::std::nothrow ) ::smoke::OuterStruct::InnerStruct();
    _struct->other_field = Conversion<::std::vector< ::std::chrono::system_clock::time_point >>::toCpp( otherField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_OuterStruct_InnerStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::OuterStruct::InnerStruct>( handle );
}
_baseRef
smoke_OuterStruct_InnerStruct_create_optional_handle(_baseRef otherField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::OuterStruct::InnerStruct>( ::smoke::OuterStruct::InnerStruct( ) );
    (*_struct)->other_field = Conversion<::std::vector< ::std::chrono::system_clock::time_point >>::toCpp( otherField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_OuterStruct_InnerStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::OuterStruct::InnerStruct>*>( handle ) );
}
void smoke_OuterStruct_InnerStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::OuterStruct::InnerStruct>*>( handle );
}
_baseRef smoke_OuterStruct_InnerStruct_otherField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::OuterStruct::InnerStruct>(handle);
    return Conversion<::std::vector< ::std::chrono::system_clock::time_point >>::toBaseRef(struct_pointer->other_field);
}
void smoke_OuterStruct_InnerStruct_doSomething(_baseRef _instance) {
    return get_pointer<::smoke::OuterStruct::InnerStruct>(_instance)->do_something();
}
void smoke_OuterStruct_InnerClass_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerClass >>(handle);
}
_baseRef smoke_OuterStruct_InnerClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerClass >>(handle)))
        : 0;
}
const void* smoke_OuterStruct_InnerClass_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerClass >>(handle)->get())
        : nullptr;
}
void smoke_OuterStruct_InnerClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerClass >>(handle)->get(), swift_pointer);
}
void smoke_OuterStruct_InnerClass_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerClass >>(handle)->get());
}
_baseRef smoke_OuterStruct_InnerClass_fooBar(_baseRef _instance) {
    return Conversion<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerClass >>(_instance)->get()->foo_bar());
}
void smoke_OuterStruct_InnerInterface_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerInterface >>(handle);
}
_baseRef smoke_OuterStruct_InnerInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerInterface >>(handle)))
        : 0;
}
const void* smoke_OuterStruct_InnerInterface_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerInterface >>(handle)->get())
        : nullptr;
}
void smoke_OuterStruct_InnerInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerInterface >>(handle)->get(), swift_pointer);
}
void smoke_OuterStruct_InnerInterface_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerInterface >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_OuterStruct_InnerInterface(_baseRef handle);
}
namespace {
struct smoke_OuterStruct_InnerInterfaceRegisterInit {
    smoke_OuterStruct_InnerInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_OuterStruct_InnerInterface", &_CBridgeInitsmoke_OuterStruct_InnerInterface);
    }
} s_smoke_OuterStruct_InnerInterface_register_init;
}
void* smoke_OuterStruct_InnerInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository().get_id(get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerInterface >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_OuterStruct_InnerInterface(handle);
}
_baseRef smoke_OuterStruct_InnerInterface_barBaz(_baseRef _instance) {
    return Conversion<::std::unordered_map< ::std::string, ::std::shared_ptr< ::std::vector< uint8_t > > >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerInterface >>(_instance)->get()->bar_baz());
}
class smoke_OuterStruct_InnerInterfaceProxy : public ::smoke::OuterStruct::InnerInterface, public CachedProxyBase<smoke_OuterStruct_InnerInterfaceProxy> {
public:
    smoke_OuterStruct_InnerInterfaceProxy(smoke_OuterStruct_InnerInterface_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_OuterStruct_InnerInterfaceProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_OuterStruct_InnerInterfaceProxy(const smoke_OuterStruct_InnerInterfaceProxy&) = delete;
    smoke_OuterStruct_InnerInterfaceProxy& operator=(const smoke_OuterStruct_InnerInterfaceProxy&) = delete;
    ::std::unordered_map< ::std::string, ::std::shared_ptr< ::std::vector< uint8_t > > > bar_baz() override {
        auto _call_result = mFunctions.smoke_OuterStruct_InnerInterface_barBaz(mFunctions.swift_pointer);
        return Conversion<::std::unordered_map< ::std::string, ::std::shared_ptr< ::std::vector< uint8_t > > >>::toCppReturn(_call_result);
    }
private:
    smoke_OuterStruct_InnerInterface_FunctionTable mFunctions;
};
_baseRef smoke_OuterStruct_InnerInterface_create_proxy(smoke_OuterStruct_InnerInterface_FunctionTable functionTable) {
    auto proxy = smoke_OuterStruct_InnerInterfaceProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::OuterStruct::InnerInterface >(proxy)) : 0;
}
const void* smoke_OuterStruct_InnerInterface_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_OuterStruct_InnerInterfaceProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::OuterStruct::InnerInterface >>(handle)->get()) : nullptr;
}
smoke_OuterStruct_doNothing_result smoke_OuterStruct_doNothing(_baseRef _instance) {
    auto&& ERROR_VALUE = get_pointer<::smoke::OuterStruct>(_instance)->do_nothing().value();
    return {ERROR_VALUE == 0, static_cast< smoke_OuterStruct_InnerEnum >(ERROR_VALUE)};
}
