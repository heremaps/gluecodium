#include "ffi_smoke_ErrorsInterface.h"
#include "ConversionBase.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "smoke/ErrorsInterface.h"
#include "smoke/Payload.h"
#include <memory>
#include <string>
#include <system_error>
#include <memory>
#include <new>
class smoke_ErrorsInterface_Proxy : public ::smoke::ErrorsInterface {
public:
    smoke_ErrorsInterface_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle f2, FfiOpaqueHandle f3, FfiOpaqueHandle f4)
        : token(token), isolate_id(isolate_id), deleter(deleter), f0(f0), f1(f1), f2(f2), f3(f3), f4(f4) { }
    ~smoke_ErrorsInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, "smoke_ErrorsInterface");
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t, FfiOpaqueHandle)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [this, token_local, deleter_local]() {
            (*deleter_local)(token_local, this);
        });
    }
    smoke_ErrorsInterface_Proxy(const smoke_ErrorsInterface_Proxy&) = delete;
    smoke_ErrorsInterface_Proxy& operator=(const smoke_ErrorsInterface_Proxy&) = delete;
    std::error_code
    method_with_errors() override {
        uint32_t _error_handle;
        bool _error_flag;
        dispatch([&]() { _error_flag = (*reinterpret_cast<bool (*)(uint64_t, uint32_t*)>(f0))(token,
            &_error_handle
        ); });
        return make_error_code(gluecodium::ffi::Conversion<::smoke::ErrorsInterface::InternalError>::toCpp(_error_flag ? (uint32_t)_error_handle : 0));
    }
    std::error_code
    method_with_external_errors() override {
        uint32_t _error_handle;
        bool _error_flag;
        dispatch([&]() { _error_flag = (*reinterpret_cast<bool (*)(uint64_t, uint32_t*)>(f1))(token,
            &_error_handle
        ); });
        return make_error_code(gluecodium::ffi::Conversion<::smoke::ErrorsInterface::ExternalErrors>::toCpp(_error_flag ? (uint32_t)_error_handle : 0));
    }
    gluecodium::Return<std::string, std::error_code>
    method_with_errors_and_return_value() override {
        FfiOpaqueHandle _result_handle;
        uint32_t _error_handle;
        bool _error_flag;
        dispatch([&]() { _error_flag = (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle*, uint32_t*)>(f2))(token,
            &_result_handle,
            &_error_handle
        ); });
        if (_error_flag) {
            return make_error_code(gluecodium::ffi::Conversion<::smoke::ErrorsInterface::InternalError>::toCpp(_error_flag ? (uint32_t)_error_handle : 0));
        } else {
            auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
            delete reinterpret_cast<std::string*>(_result_handle);
            return _result;
        }
    }
    gluecodium::Return<void, ::smoke::Payload>
    method_with_payload_error() override {
        FfiOpaqueHandle _error_handle;
        bool _error_flag;
        dispatch([&]() { _error_flag = (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle*)>(f3))(token,
            &_error_handle
        ); });
        auto _error_result = gluecodium::ffi::Conversion<::smoke::Payload>::toCpp(_error_handle);
        delete reinterpret_cast<::smoke::Payload*>(_error_handle);
        return _error_result;
    }
    gluecodium::Return<std::string, ::smoke::Payload>
    method_with_payload_error_and_return_value() override {
        FfiOpaqueHandle _result_handle;
        FfiOpaqueHandle _error_handle;
        bool _error_flag;
        dispatch([&]() { _error_flag = (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle*, FfiOpaqueHandle*)>(f4))(token,
            &_result_handle,
            &_error_handle
        ); });
        if (_error_flag) {
            auto _error_result = gluecodium::ffi::Conversion<::smoke::Payload>::toCpp(_error_handle);
            delete reinterpret_cast<::smoke::Payload*>(_error_handle);
            return _error_result;
        } else {
            auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
            delete reinterpret_cast<std::string*>(_result_handle);
            return _result;
        }
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const FfiOpaqueHandle deleter;
    const FfiOpaqueHandle f0;
    const FfiOpaqueHandle f1;
    const FfiOpaqueHandle f2;
    const FfiOpaqueHandle f3;
    const FfiOpaqueHandle f4;
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
library_smoke_ErrorsInterface_methodWithErrors_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<void, ::smoke::ErrorsInterface::InternalError>*>(handle);
}
uint32_t
library_smoke_ErrorsInterface_methodWithErrors_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<::smoke::ErrorsInterface::InternalError>::toFfi(
        reinterpret_cast<gluecodium::Return<void, ::smoke::ErrorsInterface::InternalError>*>(handle)->error()
    );
}
bool
library_smoke_ErrorsInterface_methodWithErrors_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<void, ::smoke::ErrorsInterface::InternalError>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_methodWithErrors(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result =         (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ErrorsInterface>>::toCpp(_self)).method_with_errors();
    if (_cpp_call_result.value() == 0) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<void, ::smoke::ErrorsInterface::InternalError>(true));
    }
    auto _error_code = _cpp_call_result;
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<void, ::smoke::ErrorsInterface::InternalError>(
        static_cast<::smoke::ErrorsInterface::InternalError>(_error_code.value())
    ));
}
void
library_smoke_ErrorsInterface_methodWithExternalErrors_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<void, ::smoke::ErrorsInterface::ExternalErrors>*>(handle);
}
uint32_t
library_smoke_ErrorsInterface_methodWithExternalErrors_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<::smoke::ErrorsInterface::ExternalErrors>::toFfi(
        reinterpret_cast<gluecodium::Return<void, ::smoke::ErrorsInterface::ExternalErrors>*>(handle)->error()
    );
}
bool
library_smoke_ErrorsInterface_methodWithExternalErrors_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<void, ::smoke::ErrorsInterface::ExternalErrors>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_methodWithExternalErrors(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result =         (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ErrorsInterface>>::toCpp(_self)).method_with_external_errors();
    if (_cpp_call_result.value() == 0) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<void, ::smoke::ErrorsInterface::ExternalErrors>(true));
    }
    auto _error_code = _cpp_call_result;
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<void, ::smoke::ErrorsInterface::ExternalErrors>(
        static_cast<::smoke::ErrorsInterface::ExternalErrors>(_error_code.value())
    ));
}
void
library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<std::string, ::smoke::ErrorsInterface::InternalError>*>(handle);
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_get_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<gluecodium::Return<std::string, ::smoke::ErrorsInterface::InternalError>*>(handle)->unsafe_value()
    );
}
uint32_t
library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<::smoke::ErrorsInterface::InternalError>::toFfi(
        reinterpret_cast<gluecodium::Return<std::string, ::smoke::ErrorsInterface::InternalError>*>(handle)->error()
    );
}
bool
library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<std::string, ::smoke::ErrorsInterface::InternalError>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result =         (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ErrorsInterface>>::toCpp(_self)).method_with_errors_and_return_value();
    if (_cpp_call_result.has_value()) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::string, ::smoke::ErrorsInterface::InternalError>(
            std::forward<std::string>(_cpp_call_result.unsafe_value())
        ));
    }
    auto _error_code = _cpp_call_result.error();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::string, ::smoke::ErrorsInterface::InternalError>(
        static_cast<::smoke::ErrorsInterface::InternalError>(_error_code.value())
    ));
}
void
library_smoke_ErrorsInterface_methodWithPayloadError_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<void, ::smoke::Payload>*>(handle);
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_methodWithPayloadError_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<::smoke::Payload>::toFfi(
        reinterpret_cast<gluecodium::Return<void, ::smoke::Payload>*>(handle)->error()
    );
}
bool
library_smoke_ErrorsInterface_methodWithPayloadError_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<void, ::smoke::Payload>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_methodWithPayloadError(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result =         ::smoke::ErrorsInterface::method_with_payload_error();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<void, ::smoke::Payload>(
        std::forward<gluecodium::Return<void, ::smoke::Payload>>(_cpp_call_result)
    ));
}
void
library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<std::string, ::smoke::Payload>*>(handle);
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_return_get_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<gluecodium::Return<std::string, ::smoke::Payload>*>(handle)->unsafe_value()
    );
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<::smoke::Payload>::toFfi(
        reinterpret_cast<gluecodium::Return<std::string, ::smoke::Payload>*>(handle)->error()
    );
}
bool
library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<std::string, ::smoke::Payload>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result =         ::smoke::ErrorsInterface::method_with_payload_error_and_return_value();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::string, ::smoke::Payload>(
        std::forward<gluecodium::Return<std::string, ::smoke::Payload>>(_cpp_call_result)
    ));
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::ErrorsInterface>(
            *reinterpret_cast<std::shared_ptr<::smoke::ErrorsInterface>*>(handle)
        )
    );
}
void
library_smoke_ErrorsInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::ErrorsInterface>*>(handle);
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::ErrorsInterface>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle f2, FfiOpaqueHandle f3, FfiOpaqueHandle f4) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_ErrorsInterface_Proxy>(token, "smoke_ErrorsInterface");
    std::shared_ptr<smoke_ErrorsInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ErrorsInterface_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ErrorsInterface_Proxy>(
            new (std::nothrow) smoke_ErrorsInterface_Proxy(token, isolate_id, deleter, f0, f1, f2, f3, f4)
        );
        gluecodium::ffi::cache_proxy(token, "smoke_ErrorsInterface", *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_InternalError_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::ErrorsInterface::InternalError>(
            gluecodium::ffi::Conversion<::smoke::ErrorsInterface::InternalError>::toCpp(value)
        )
    );
}
void
library_smoke_ErrorsInterface_InternalError_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::ErrorsInterface::InternalError>*>(handle);
}
uint32_t
library_smoke_ErrorsInterface_InternalError_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::ErrorsInterface::InternalError>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::ErrorsInterface::InternalError>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_ExternalErrors_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::ErrorsInterface::ExternalErrors>(
            gluecodium::ffi::Conversion<::smoke::ErrorsInterface::ExternalErrors>::toCpp(value)
        )
    );
}
void
library_smoke_ErrorsInterface_ExternalErrors_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::ErrorsInterface::ExternalErrors>*>(handle);
}
uint32_t
library_smoke_ErrorsInterface_ExternalErrors_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::ErrorsInterface::ExternalErrors>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::ErrorsInterface::ExternalErrors>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_ErrorsInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_repository = ::gluecodium::get_type_repository(static_cast<::smoke::ErrorsInterface*>(nullptr));
    const auto& type_id = type_repository.get_id(reinterpret_cast<std::shared_ptr<::smoke::ErrorsInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
