//
//
#include "cbridge/include/smoke/cbridge_OuterClass.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/OuterClass.h"
#include <memory>
#include <new>
#include <string>
void smoke_OuterClass_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::OuterClass >>(handle);
}
_baseRef smoke_OuterClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::OuterClass >>(handle)))
        : 0;
}
const void* smoke_OuterClass_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterClass >>(handle)->get())
        : nullptr;
}
void smoke_OuterClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterClass >>(handle)->get(), swift_pointer);
}
void smoke_OuterClass_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterClass >>(handle)->get());
}
_baseRef smoke_OuterClass_foo(_baseRef _instance, _baseRef input) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::OuterClass >>(_instance)->get()->foo(Conversion<::std::string>::toCpp(input)));
}
void smoke_OuterClass_InnerClass_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerClass >>(handle);
}
_baseRef smoke_OuterClass_InnerClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerClass >>(handle)))
        : 0;
}
const void* smoke_OuterClass_InnerClass_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerClass >>(handle)->get())
        : nullptr;
}
void smoke_OuterClass_InnerClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerClass >>(handle)->get(), swift_pointer);
}
void smoke_OuterClass_InnerClass_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerClass >>(handle)->get());
}
_baseRef smoke_OuterClass_InnerClass_foo(_baseRef _instance, _baseRef input) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerClass >>(_instance)->get()->foo(Conversion<::std::string>::toCpp(input)));
}
void smoke_OuterClass_InnerInterface_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerInterface >>(handle);
}
_baseRef smoke_OuterClass_InnerInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerInterface >>(handle)))
        : 0;
}
const void* smoke_OuterClass_InnerInterface_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerInterface >>(handle)->get())
        : nullptr;
}
void smoke_OuterClass_InnerInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerInterface >>(handle)->get(), swift_pointer);
}
void smoke_OuterClass_InnerInterface_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerInterface >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_OuterClass_InnerInterface(_baseRef handle);
}
namespace {
struct smoke_OuterClass_InnerInterfaceRegisterInit {
    smoke_OuterClass_InnerInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_OuterClass_InnerInterface", &_CBridgeInitsmoke_OuterClass_InnerInterface);
    }
} s_smoke_OuterClass_InnerInterface_register_init;
}
void* smoke_OuterClass_InnerInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository().get_id(get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerInterface >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_OuterClass_InnerInterface(handle);
}
_baseRef smoke_OuterClass_InnerInterface_foo(_baseRef _instance, _baseRef input) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerInterface >>(_instance)->get()->foo(Conversion<::std::string>::toCpp(input)));
}
class smoke_OuterClass_InnerInterfaceProxy : public ::smoke::OuterClass::InnerInterface, public CachedProxyBase<smoke_OuterClass_InnerInterfaceProxy> {
public:
    smoke_OuterClass_InnerInterfaceProxy(smoke_OuterClass_InnerInterface_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_OuterClass_InnerInterfaceProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_OuterClass_InnerInterfaceProxy(const smoke_OuterClass_InnerInterfaceProxy&) = delete;
    smoke_OuterClass_InnerInterfaceProxy& operator=(const smoke_OuterClass_InnerInterfaceProxy&) = delete;
    ::std::string foo(const ::std::string& input) override {
        auto _call_result = mFunctions.smoke_OuterClass_InnerInterface_foo(mFunctions.swift_pointer, Conversion<::std::string>::toBaseRef(input));
        return Conversion<::std::string>::toCppReturn(_call_result);
    }
private:
    smoke_OuterClass_InnerInterface_FunctionTable mFunctions;
};
_baseRef smoke_OuterClass_InnerInterface_create_proxy(smoke_OuterClass_InnerInterface_FunctionTable functionTable) {
    auto proxy = smoke_OuterClass_InnerInterfaceProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::OuterClass::InnerInterface >(proxy)) : 0;
}
const void* smoke_OuterClass_InnerInterface_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_OuterClass_InnerInterfaceProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::OuterClass::InnerInterface >>(handle)->get()) : nullptr;
}
