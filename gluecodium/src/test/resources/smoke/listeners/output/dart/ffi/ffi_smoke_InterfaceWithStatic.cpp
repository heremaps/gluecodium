#include "ffi_smoke_InterfaceWithStatic.h"
#include "ConversionBase.h"
#include "ReverseCache.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/InterfaceWithStatic.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
class smoke_InterfaceWithStatic_Proxy : public ::smoke::InterfaceWithStatic {
public:
    smoke_InterfaceWithStatic_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s)
        : token(token), isolate_id(isolate_id), deleter(deleter), f0(f0), p0g(p0g), p0s(p0s) { }
    ~smoke_InterfaceWithStatic_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_InterfaceWithStatic");
        gluecodium::ffi::remove_cached_token(this, isolate_id);
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [token_local, deleter_local]() {
            (*deleter_local)(token_local);
        });
    }
    smoke_InterfaceWithStatic_Proxy(const smoke_InterfaceWithStatic_Proxy&) = delete;
    smoke_InterfaceWithStatic_Proxy& operator=(const smoke_InterfaceWithStatic_Proxy&) = delete;
    std::string
    regular_function() override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle*)>(f0))(token,
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    std::string
    get_regular_property() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle*)>(p0g))(token, &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    void
    set_regular_property(const std::string& value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle)>(p0s))(token,
            gluecodium::ffi::Conversion<std::string>::toFfi(value)
        ); });
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const FfiOpaqueHandle deleter;
    const FfiOpaqueHandle f0;
    const FfiOpaqueHandle p0g;
    const FfiOpaqueHandle p0s;
    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_regularFunction(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::InterfaceWithStatic>>::toCpp(_self)).regular_function()
    );
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_staticFunction(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        ::smoke::InterfaceWithStatic::static_function()
    );
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_regularProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::InterfaceWithStatic>>::toCpp(_self)).get_regular_property()
    );
}
void
library_smoke_InterfaceWithStatic_regularProperty_set__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::InterfaceWithStatic>>::toCpp(_self)).set_regular_property(
            gluecodium::ffi::Conversion<std::string>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_staticProperty_get(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        ::smoke::InterfaceWithStatic::get_static_property()
    );
}
void
library_smoke_InterfaceWithStatic_staticProperty_set__String(int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            ::smoke::InterfaceWithStatic::set_static_property(
            gluecodium::ffi::Conversion<std::string>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::InterfaceWithStatic>(
            *reinterpret_cast<std::shared_ptr<::smoke::InterfaceWithStatic>*>(handle)
        )
    );
}
void
library_smoke_InterfaceWithStatic_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::InterfaceWithStatic>*>(handle);
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_InterfaceWithStatic_Proxy>(token, isolate_id, "smoke_InterfaceWithStatic");
    std::shared_ptr<smoke_InterfaceWithStatic_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_InterfaceWithStatic_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_InterfaceWithStatic_Proxy>(
            new (std::nothrow) smoke_InterfaceWithStatic_Proxy(token, isolate_id, deleter, f0, p0g, p0s)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_InterfaceWithStatic", *proxy_ptr);
        gluecodium::ffi::cache_token(proxy_ptr->get(), isolate_id, token);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<::smoke::InterfaceWithStatic>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
