#include "ffi_smoke_SimpleInterface.h"
#include "ConversionBase.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "smoke/SimpleInterface.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
class smoke_SimpleInterface_Proxy : public ::smoke::SimpleInterface {
public:
    smoke_SimpleInterface_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle f1)
        : token(token), isolate_id(isolate_id), deleter(deleter), f0(f0), f1(f1) { }
    ~smoke_SimpleInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_SimpleInterface");
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t, FfiOpaqueHandle)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [this, token_local, deleter_local]() {
            (*deleter_local)(token_local, this);
        });
    }
    smoke_SimpleInterface_Proxy(const smoke_SimpleInterface_Proxy&) = delete;
    smoke_SimpleInterface_Proxy& operator=(const smoke_SimpleInterface_Proxy&) = delete;
    std::string
    get_string_value() override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle*)>(f0))(token,
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    std::shared_ptr<::smoke::SimpleInterface>
    use_simple_interface(const std::shared_ptr<::smoke::SimpleInterface>& input) override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle, FfiOpaqueHandle*)>(f1))(token,
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toFfi(input),
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp(_result_handle);
        delete reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*>(_result_handle);
        return _result;
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const FfiOpaqueHandle deleter;
    const FfiOpaqueHandle f0;
    const FfiOpaqueHandle f1;
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
library_smoke_SimpleInterface_getStringValue(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp(_self)).get_string_value()
    );
}
FfiOpaqueHandle
library_smoke_SimpleInterface_useSimpleInterface__SimpleInterface(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp(_self)).use_simple_interface(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_SimpleInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::SimpleInterface>(
            *reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*>(handle)
        )
    );
}
void
library_smoke_SimpleInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*>(handle);
}
FfiOpaqueHandle
library_smoke_SimpleInterface_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_SimpleInterface_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle f1) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_SimpleInterface_Proxy>(token, isolate_id, "smoke_SimpleInterface");
    std::shared_ptr<smoke_SimpleInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SimpleInterface_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SimpleInterface_Proxy>(
            new (std::nothrow) smoke_SimpleInterface_Proxy(token, isolate_id, deleter, f0, f1)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_SimpleInterface", *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_SimpleInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_repository = ::gluecodium::get_type_repository(static_cast<::smoke::SimpleInterface*>(nullptr));
    const auto& type_id = type_repository.get_id(reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
