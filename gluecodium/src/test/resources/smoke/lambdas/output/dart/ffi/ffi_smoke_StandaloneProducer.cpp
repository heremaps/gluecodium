#include "ffi_smoke_StandaloneProducer.h"
#include "ConversionBase.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "smoke/StandaloneProducer.h"
#include <functional>
#include <string>
#include <memory>
#include <new>
class smoke_StandaloneProducer_Proxy {
public:
    smoke_StandaloneProducer_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), deleter(deleter), f0(f0) { }
    ~smoke_StandaloneProducer_Proxy() {
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t, FfiOpaqueHandle)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [this, token_local, deleter_local]() {
            (*deleter_local)(token_local, this);
        });
    }
    std::string
    operator()() {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle*)>(f0))(token,
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
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
FfiOpaqueHandle
library_smoke_StandaloneProducer_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        gluecodium::ffi::Conversion<::smoke::StandaloneProducer>::toCpp(_self).operator()()
    );
}
FfiOpaqueHandle
library_smoke_StandaloneProducer_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) ::smoke::StandaloneProducer(
            *reinterpret_cast<::smoke::StandaloneProducer*>(handle)
        )
    );
}
void
library_smoke_StandaloneProducer_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::StandaloneProducer*>(handle);
}
FfiOpaqueHandle
library_smoke_StandaloneProducer_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::StandaloneProducer>(
            gluecodium::ffi::Conversion<::smoke::StandaloneProducer>::toCpp(value)
        )
    );
}
void
library_smoke_StandaloneProducer_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::StandaloneProducer>*>(handle);
}
FfiOpaqueHandle
library_smoke_StandaloneProducer_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::StandaloneProducer>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::StandaloneProducer>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_StandaloneProducer_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_StandaloneProducer_Proxy>(token);
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_StandaloneProducer_Proxy>(token, isolate_id, deleter, f0);
        gluecodium::ffi::cache_proxy(token, cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::smoke::StandaloneProducer(
            std::bind(&smoke_StandaloneProducer_Proxy::operator(), cached_proxy)
        )
    );
}
FfiOpaqueHandle
library_smoke_StandaloneProducer_get_raw_pointer(FfiOpaqueHandle handle) {
    return handle;
}
#ifdef __cplusplus
}
#endif
