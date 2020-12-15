#include "ffi_smoke_SkipProxy.h"
#include "ConversionBase.h"
#include "ReverseCache.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/SkipProxy.h"
#include "smoke/SkippedEverywhere.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
class smoke_SkipProxy_Proxy : public ::smoke::SkipProxy {
public:
    smoke_SkipProxy_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s, FfiOpaqueHandle p1g, FfiOpaqueHandle p1s)
        : token(token), isolate_id(isolate_id), deleter(deleter), f0(f0), f1(f1), p0g(p0g), p0s(p0s), p1g(p1g), p1s(p1s) { }
    ~smoke_SkipProxy_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_SkipProxy");
        gluecodium::ffi::remove_cached_token(this, isolate_id);
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [token_local, deleter_local]() {
            (*deleter_local)(token_local);
        });
    }
    smoke_SkipProxy_Proxy(const smoke_SkipProxy_Proxy&) = delete;
    smoke_SkipProxy_Proxy& operator=(const smoke_SkipProxy_Proxy&) = delete;
    std::string
    not_in_java(const std::string& input) override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle, FfiOpaqueHandle*)>(f0))(token,
            gluecodium::ffi::Conversion<std::string>::toFfi(input),
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    bool
    not_in_swift(const bool input) override {
        bool _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, bool, bool*)>(f1))(token,
            gluecodium::ffi::Conversion<bool>::toFfi(input),
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<bool>::toCpp(_result_handle);
        ;
        return _result;
    }
    float
    not_in_dart(const float input) override {
         return {};
    }
    std::string
    get_skipped_in_java() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle*)>(p0g))(token, &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    void
    set_skipped_in_java(const std::string& value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle)>(p0s))(token,
            gluecodium::ffi::Conversion<std::string>::toFfi(value)
        ); });
    }
    bool
    is_skipped_in_swift() const override {
        bool _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, bool*)>(p1g))(token, &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<bool>::toCpp(_result_handle);
        ;
        return _result;
    }
    void
    set_skipped_in_swift(const bool value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, bool)>(p1s))(token,
            gluecodium::ffi::Conversion<bool>::toFfi(value)
        ); });
    }
    float
    get_skipped_in_dart() const override {
        return {};
    }
    void
    set_skipped_in_dart(const float value) override {
    }
    ::smoke::SkippedEverywhere
    get_skipped_everywhere() const override {
        return {};
    }
    void
    set_skipped_everywhere(const ::smoke::SkippedEverywhere& value) override {
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const FfiOpaqueHandle deleter;
    const FfiOpaqueHandle f0;
    const FfiOpaqueHandle f1;
    const FfiOpaqueHandle p0g;
    const FfiOpaqueHandle p0s;
    const FfiOpaqueHandle p1g;
    const FfiOpaqueHandle p1s;
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
library_smoke_SkipProxy_notInJava__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SkipProxy>>::toCpp(_self)).not_in_java(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}
bool
library_smoke_SkipProxy_notInSwift__Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SkipProxy>>::toCpp(_self)).not_in_swift(
            gluecodium::ffi::Conversion<bool>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_SkipProxy_skippedInJava_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SkipProxy>>::toCpp(_self)).get_skipped_in_java()
    );
}
void
library_smoke_SkipProxy_skippedInJava_set__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SkipProxy>>::toCpp(_self)).set_skipped_in_java(
            gluecodium::ffi::Conversion<std::string>::toCpp(value)
        );
}
bool
library_smoke_SkipProxy_isSkippedInSwift_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SkipProxy>>::toCpp(_self)).is_skipped_in_swift()
    );
}
void
library_smoke_SkipProxy_isSkippedInSwift_set__Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, bool value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SkipProxy>>::toCpp(_self)).set_skipped_in_swift(
            gluecodium::ffi::Conversion<bool>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_SkipProxy_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::SkipProxy>(
            *reinterpret_cast<std::shared_ptr<::smoke::SkipProxy>*>(handle)
        )
    );
}
void
library_smoke_SkipProxy_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::SkipProxy>*>(handle);
}
FfiOpaqueHandle
library_smoke_SkipProxy_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s, FfiOpaqueHandle p1g, FfiOpaqueHandle p1s) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_SkipProxy_Proxy>(token, isolate_id, "smoke_SkipProxy");
    std::shared_ptr<smoke_SkipProxy_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SkipProxy_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SkipProxy_Proxy>(
            new (std::nothrow) smoke_SkipProxy_Proxy(token, isolate_id, deleter, f0, f1, p0g, p0s, p1g, p1s)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_SkipProxy", *proxy_ptr);
        gluecodium::ffi::cache_token(proxy_ptr->get(), isolate_id, token);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_SkipProxy_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_repository = ::gluecodium::get_type_repository(static_cast<::smoke::SkipProxy*>(nullptr));
    const auto& type_id = type_repository.get_id(reinterpret_cast<std::shared_ptr<::smoke::SkipProxy>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
