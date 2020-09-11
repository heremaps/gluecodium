//
//
#include "cbridge/include/smoke/cbridge_SkipProxy.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium\Optional.h"
#include "gluecodium\TypeRepository.h"
#include "smoke/SkipProxy.h"
#include <memory>
#include <new>
#include <string>
void smoke_SkipProxy_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::SkipProxy>>(handle);
}
_baseRef smoke_SkipProxy_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::SkipProxy>>(handle)))
        : 0;
}
const void* smoke_SkipProxy_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<std::shared_ptr<::smoke::SkipProxy>>(handle)->get())
        : nullptr;
}
void smoke_SkipProxy_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<std::shared_ptr<::smoke::SkipProxy>>(handle)->get(), swift_pointer);
}
void smoke_SkipProxy_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<std::shared_ptr<::smoke::SkipProxy>>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_SkipProxy(_baseRef handle);
}
namespace {
struct smoke_SkipProxyRegisterInit {
    smoke_SkipProxyRegisterInit() {
        get_init_repository().add_init("smoke_SkipProxy", &_CBridgeInitsmoke_SkipProxy);
    }
} s_smoke_SkipProxy_register_init;
}
void* smoke_SkipProxy_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository(static_cast<std::shared_ptr<::smoke::SkipProxy>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::SkipProxy>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_SkipProxy(handle);
}
_baseRef smoke_SkipProxy_notInJava(_baseRef _instance, _baseRef input) {
    return Conversion<std::string>::toBaseRef(get_pointer<std::shared_ptr<::smoke::SkipProxy>>(_instance)->get()->not_in_java(Conversion<std::string>::toCpp(input)));
}
float smoke_SkipProxy_notInDart(_baseRef _instance, float input) {
    return get_pointer<std::shared_ptr<::smoke::SkipProxy>>(_instance)->get()->not_in_dart(input);
}
_baseRef smoke_SkipProxy_skippedInJava_get(_baseRef _instance) {
    return Conversion<std::string>::toBaseRef(get_pointer<std::shared_ptr<::smoke::SkipProxy>>(_instance)->get()->get_skipped_in_java());
}
void smoke_SkipProxy_skippedInJava_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::SkipProxy>>(_instance)->get()->set_skipped_in_java(Conversion<std::string>::toCpp(newValue));
}
float smoke_SkipProxy_skippedInDart_get(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::smoke::SkipProxy>>(_instance)->get()->get_skipped_in_dart();
}
void smoke_SkipProxy_skippedInDart_set(_baseRef _instance, float newValue) {
    return get_pointer<std::shared_ptr<::smoke::SkipProxy>>(_instance)->get()->set_skipped_in_dart(newValue);
}
class smoke_SkipProxyProxy : public std::shared_ptr<::smoke::SkipProxy>::element_type, public CachedProxyBase<smoke_SkipProxyProxy> {
public:
    smoke_SkipProxyProxy(smoke_SkipProxy_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_SkipProxyProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_SkipProxyProxy(const smoke_SkipProxyProxy&) = delete;
    smoke_SkipProxyProxy& operator=(const smoke_SkipProxyProxy&) = delete;
    ::std::string not_in_java(const std::string& input) override {
        auto _call_result = mFunctions.smoke_SkipProxy_notInJava(mFunctions.swift_pointer, Conversion<std::string>::toBaseRef(input));
        return Conversion<std::string>::toCppReturn(_call_result);
    }
    bool not_in_swift(bool input) override {
        return {};
    }
    float not_in_dart(float input) override {
        auto _call_result = mFunctions.smoke_SkipProxy_notInDart(mFunctions.swift_pointer, input);
        return _call_result;
    }
    ::std::string get_skipped_in_java() const override {
        auto _call_result = mFunctions.smoke_SkipProxy_skippedInJava_get(mFunctions.swift_pointer);
        return Conversion<std::string>::toCppReturn(_call_result);
    }
    void set_skipped_in_java(const std::string& newValue) override {
        mFunctions.smoke_SkipProxy_skippedInJava_set(mFunctions.swift_pointer, Conversion<std::string>::toBaseRef(newValue));
    }
    bool is_skipped_in_swift() const override {
        return {};
    }
    void set_skipped_in_swift(bool newValue) override {
    }
    float get_skipped_in_dart() const override {
        auto _call_result = mFunctions.smoke_SkipProxy_skippedInDart_get(mFunctions.swift_pointer);
        return _call_result;
    }
    void set_skipped_in_dart(float newValue) override {
        mFunctions.smoke_SkipProxy_skippedInDart_set(mFunctions.swift_pointer, newValue);
    }
    ::smoke::SkippedEverywhere get_skipped_everywhere() const override {
        return {};
    }
    void set_skipped_everywhere(const ::smoke::SkippedEverywhere& newValue) override {
    }
private:
    smoke_SkipProxy_FunctionTable mFunctions;
};
_baseRef smoke_SkipProxy_create_proxy(smoke_SkipProxy_FunctionTable functionTable) {
    auto proxy = smoke_SkipProxyProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new std::shared_ptr<::smoke::SkipProxy>(proxy)) : 0;
}
const void* smoke_SkipProxy_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_SkipProxyProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::SkipProxy>>(handle)->get()) : nullptr;
}
