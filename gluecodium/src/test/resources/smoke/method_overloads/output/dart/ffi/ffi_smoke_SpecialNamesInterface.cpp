#include "ffi_smoke_SpecialNamesInterface.h"
#include "ConversionBase.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium\TypeRepository.h"
#include "smoke\SpecialNamesInterface.h"
#include <functional>
#include <memory>
#include <memory>
#include <new>
class smoke_SpecialNamesInterface_Proxy : public ::smoke::SpecialNamesInterface {
public:
    smoke_SpecialNamesInterface_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), deleter(deleter), f0(f0) { }
    ~smoke_SpecialNamesInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_SpecialNamesInterface");
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t, FfiOpaqueHandle)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [this, token_local, deleter_local]() {
            (*deleter_local)(token_local, this);
        });
    }
    smoke_SpecialNamesInterface_Proxy(const smoke_SpecialNamesInterface_Proxy&) = delete;
    smoke_SpecialNamesInterface_Proxy& operator=(const smoke_SpecialNamesInterface_Proxy&) = delete;
    void
    dispatch(const ::smoke::SpecialNamesInterface::Callback& callback) const override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle)>(f0))(token,
            gluecodium::ffi::Conversion<::smoke::SpecialNamesInterface::Callback>::toFfi(callback)
        ); });
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const FfiOpaqueHandle deleter;
    const FfiOpaqueHandle f0;
    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};
class smoke_SpecialNamesInterface_Callback_Proxy {
public:
    smoke_SpecialNamesInterface_Callback_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), deleter(deleter), f0(f0) { }
    ~smoke_SpecialNamesInterface_Callback_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_SpecialNamesInterface_Callback");
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t, FfiOpaqueHandle)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [this, token_local, deleter_local]() {
            (*deleter_local)(token_local, this);
        });
    }
    smoke_SpecialNamesInterface_Callback_Proxy(const smoke_SpecialNamesInterface_Callback_Proxy&) = delete;
    smoke_SpecialNamesInterface_Callback_Proxy& operator=(const smoke_SpecialNamesInterface_Callback_Proxy&) = delete;
    void
    operator()() {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t)>(f0))(token
        ); });
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const FfiOpaqueHandle deleter;
    const FfiOpaqueHandle f0;
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
void
library_smoke_SpecialNamesInterface_dispatch__Callback(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle callback) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SpecialNamesInterface>>::toCpp(_self)).dispatch(
            gluecodium::ffi::Conversion<::smoke::SpecialNamesInterface::Callback>::toCpp(callback)
        );
}
void
library_smoke_SpecialNamesInterface_Callback_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            gluecodium::ffi::Conversion<::smoke::SpecialNamesInterface::Callback>::toCpp(_self).operator()();
}
FfiOpaqueHandle
library_smoke_SpecialNamesInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::SpecialNamesInterface>(
            *reinterpret_cast<std::shared_ptr<::smoke::SpecialNamesInterface>*>(handle)
        )
    );
}
void
library_smoke_SpecialNamesInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::SpecialNamesInterface>*>(handle);
}
FfiOpaqueHandle
library_smoke_SpecialNamesInterface_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::SpecialNamesInterface>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_SpecialNamesInterface_Callback_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) ::smoke::SpecialNamesInterface::Callback(
            *reinterpret_cast<::smoke::SpecialNamesInterface::Callback*>(handle)
        )
    );
}
void
library_smoke_SpecialNamesInterface_Callback_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::SpecialNamesInterface::Callback*>(handle);
}
FfiOpaqueHandle
library_smoke_SpecialNamesInterface_Callback_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::SpecialNamesInterface::Callback>(
            gluecodium::ffi::Conversion<::smoke::SpecialNamesInterface::Callback>::toCpp(value)
        )
    );
}
void
library_smoke_SpecialNamesInterface_Callback_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::SpecialNamesInterface::Callback>*>(handle);
}
FfiOpaqueHandle
library_smoke_SpecialNamesInterface_Callback_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::SpecialNamesInterface::Callback>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::SpecialNamesInterface::Callback>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_SpecialNamesInterface_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_SpecialNamesInterface_Proxy>(token, isolate_id, "smoke_SpecialNamesInterface");
    std::shared_ptr<smoke_SpecialNamesInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SpecialNamesInterface_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SpecialNamesInterface_Proxy>(
            new (std::nothrow) smoke_SpecialNamesInterface_Proxy(token, isolate_id, deleter, f0)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_SpecialNamesInterface", *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_SpecialNamesInterface_Callback_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_SpecialNamesInterface_Callback_Proxy>(token, isolate_id, "smoke_SpecialNamesInterface_Callback");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_SpecialNamesInterface_Callback_Proxy>(token, isolate_id, deleter, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_SpecialNamesInterface_Callback", cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::smoke::SpecialNamesInterface::Callback(
            std::bind(&smoke_SpecialNamesInterface_Callback_Proxy::operator(), cached_proxy)
        )
    );
}
FfiOpaqueHandle
library_smoke_SpecialNamesInterface_Callback_get_raw_pointer(FfiOpaqueHandle handle) {
    return handle;
}
FfiOpaqueHandle
library_smoke_SpecialNamesInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_repository = ::gluecodium::get_type_repository(static_cast<::smoke::SpecialNamesInterface*>(nullptr));
    const auto& type_id = type_repository.get_id(reinterpret_cast<std::shared_ptr<::smoke::SpecialNamesInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
