//
//
#include "cbridge/include/smoke/cbridge_OuterInterface.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/OuterInterface.h"
#include <memory>
#include <new>
#include <string>
void smoke_OuterInterface_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::OuterInterface >>(handle);
}
_baseRef smoke_OuterInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::OuterInterface >>(handle)))
        : 0;
}
const void* smoke_OuterInterface_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterInterface >>(handle)->get())
        : nullptr;
}
void smoke_OuterInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterInterface >>(handle)->get(), swift_pointer);
}
void smoke_OuterInterface_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterInterface >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_OuterInterface(_baseRef handle);
}
namespace {
struct smoke_OuterInterfaceRegisterInit {
    smoke_OuterInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_OuterInterface", &_CBridgeInitsmoke_OuterInterface);
    }
} s_smoke_OuterInterface_register_init;
}
void* smoke_OuterInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository(static_cast<::std::shared_ptr< ::smoke::OuterInterface >::element_type*>(nullptr)).get_id(get_pointer<::std::shared_ptr< ::smoke::OuterInterface >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_OuterInterface(handle);
}
_baseRef smoke_OuterInterface_foo(_baseRef _instance, _baseRef input) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::OuterInterface >>(_instance)->get()->foo(Conversion<::std::string>::toCpp(input)));
}
class smoke_OuterInterfaceProxy : public ::smoke::OuterInterface, public CachedProxyBase<smoke_OuterInterfaceProxy> {
public:
    smoke_OuterInterfaceProxy(smoke_OuterInterface_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_OuterInterfaceProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_OuterInterfaceProxy(const smoke_OuterInterfaceProxy&) = delete;
    smoke_OuterInterfaceProxy& operator=(const smoke_OuterInterfaceProxy&) = delete;
    ::std::string foo(const ::std::string& input) override {
        auto _call_result = mFunctions.smoke_OuterInterface_foo(mFunctions.swift_pointer, Conversion<::std::string>::toBaseRef(input));
        return Conversion<::std::string>::toCppReturn(_call_result);
    }
private:
    smoke_OuterInterface_FunctionTable mFunctions;
};
_baseRef smoke_OuterInterface_create_proxy(smoke_OuterInterface_FunctionTable functionTable) {
    auto proxy = smoke_OuterInterfaceProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::OuterInterface >(proxy)) : 0;
}
const void* smoke_OuterInterface_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_OuterInterfaceProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::OuterInterface >>(handle)->get()) : nullptr;
}
void smoke_OuterInterface_InnerClass_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerClass >>(handle);
}
_baseRef smoke_OuterInterface_InnerClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerClass >>(handle)))
        : 0;
}
const void* smoke_OuterInterface_InnerClass_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerClass >>(handle)->get())
        : nullptr;
}
void smoke_OuterInterface_InnerClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerClass >>(handle)->get(), swift_pointer);
}
void smoke_OuterInterface_InnerClass_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerClass >>(handle)->get());
}
_baseRef smoke_OuterInterface_InnerClass_foo(_baseRef _instance, _baseRef input) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerClass >>(_instance)->get()->foo(Conversion<::std::string>::toCpp(input)));
}
void smoke_OuterInterface_InnerInterface_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerInterface >>(handle);
}
_baseRef smoke_OuterInterface_InnerInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerInterface >>(handle)))
        : 0;
}
const void* smoke_OuterInterface_InnerInterface_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerInterface >>(handle)->get())
        : nullptr;
}
void smoke_OuterInterface_InnerInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerInterface >>(handle)->get(), swift_pointer);
}
void smoke_OuterInterface_InnerInterface_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerInterface >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_OuterInterface_InnerInterface(_baseRef handle);
}
namespace {
struct smoke_OuterInterface_InnerInterfaceRegisterInit {
    smoke_OuterInterface_InnerInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_OuterInterface_InnerInterface", &_CBridgeInitsmoke_OuterInterface_InnerInterface);
    }
} s_smoke_OuterInterface_InnerInterface_register_init;
}
void* smoke_OuterInterface_InnerInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository(static_cast<::std::shared_ptr< ::smoke::OuterInterface::InnerInterface >::element_type*>(nullptr)).get_id(get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerInterface >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_OuterInterface_InnerInterface(handle);
}
_baseRef smoke_OuterInterface_InnerInterface_foo(_baseRef _instance, _baseRef input) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerInterface >>(_instance)->get()->foo(Conversion<::std::string>::toCpp(input)));
}
class smoke_OuterInterface_InnerInterfaceProxy : public ::smoke::OuterInterface::InnerInterface, public CachedProxyBase<smoke_OuterInterface_InnerInterfaceProxy> {
public:
    smoke_OuterInterface_InnerInterfaceProxy(smoke_OuterInterface_InnerInterface_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_OuterInterface_InnerInterfaceProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_OuterInterface_InnerInterfaceProxy(const smoke_OuterInterface_InnerInterfaceProxy&) = delete;
    smoke_OuterInterface_InnerInterfaceProxy& operator=(const smoke_OuterInterface_InnerInterfaceProxy&) = delete;
    ::std::string foo(const ::std::string& input) override {
        auto _call_result = mFunctions.smoke_OuterInterface_InnerInterface_foo(mFunctions.swift_pointer, Conversion<::std::string>::toBaseRef(input));
        return Conversion<::std::string>::toCppReturn(_call_result);
    }
private:
    smoke_OuterInterface_InnerInterface_FunctionTable mFunctions;
};
_baseRef smoke_OuterInterface_InnerInterface_create_proxy(smoke_OuterInterface_InnerInterface_FunctionTable functionTable) {
    auto proxy = smoke_OuterInterface_InnerInterfaceProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::OuterInterface::InnerInterface >(proxy)) : 0;
}
const void* smoke_OuterInterface_InnerInterface_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_OuterInterface_InnerInterfaceProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::OuterInterface::InnerInterface >>(handle)->get()) : nullptr;
}
