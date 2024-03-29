#include "ffi_smoke_Errors.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "foo/Bar.h"
#include "smoke/Errors.h"
#include "smoke/Payload.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
void
library_smoke_Errors_methodWithErrors_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<void, smoke::Errors::InternalErrorCode>*>(handle);
}
uint32_t
library_smoke_Errors_methodWithErrors_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Errors::InternalErrorCode>::toFfi(
        reinterpret_cast<gluecodium::Return<void, smoke::Errors::InternalErrorCode>*>(handle)->error()
    );
}
bool
library_smoke_Errors_methodWithErrors_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<void, smoke::Errors::InternalErrorCode>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_Errors_methodWithErrors(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result = smoke::Errors::method_with_errors();
    if (_cpp_call_result.value() == 0) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<void, smoke::Errors::InternalErrorCode>(true));
    }
    auto _error_code = _cpp_call_result;
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<void, smoke::Errors::InternalErrorCode>(
        static_cast<smoke::Errors::InternalErrorCode>(_error_code.value())
    ));
}
void
library_smoke_Errors_methodWithExternalErrors_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<void, fire::SomeEnum>*>(handle);
}
uint32_t
library_smoke_Errors_methodWithExternalErrors_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<fire::SomeEnum>::toFfi(
        reinterpret_cast<gluecodium::Return<void, fire::SomeEnum>*>(handle)->error()
    );
}
bool
library_smoke_Errors_methodWithExternalErrors_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<void, fire::SomeEnum>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_Errors_methodWithExternalErrors(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result = smoke::Errors::method_with_external_errors();
    if (_cpp_call_result.value() == 0) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<void, fire::SomeEnum>(true));
    }
    auto _error_code = _cpp_call_result;
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<void, fire::SomeEnum>(
        static_cast<fire::SomeEnum>(_error_code.value())
    ));
}
void
library_smoke_Errors_methodWithErrorsAndReturnValue_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<std::string, smoke::Errors::InternalErrorCode>*>(handle);
}
FfiOpaqueHandle
library_smoke_Errors_methodWithErrorsAndReturnValue_return_get_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<gluecodium::Return<std::string, smoke::Errors::InternalErrorCode>*>(handle)->unsafe_value()
    );
}
uint32_t
library_smoke_Errors_methodWithErrorsAndReturnValue_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Errors::InternalErrorCode>::toFfi(
        reinterpret_cast<gluecodium::Return<std::string, smoke::Errors::InternalErrorCode>*>(handle)->error()
    );
}
bool
library_smoke_Errors_methodWithErrorsAndReturnValue_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<std::string, smoke::Errors::InternalErrorCode>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_Errors_methodWithErrorsAndReturnValue(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result = smoke::Errors::method_with_errors_and_return_value();
    if (_cpp_call_result.has_value()) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::string, smoke::Errors::InternalErrorCode>(
            std::forward<std::string>(_cpp_call_result.unsafe_value())
        ));
    }
    auto _error_code = _cpp_call_result.error();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::string, smoke::Errors::InternalErrorCode>(
        static_cast<smoke::Errors::InternalErrorCode>(_error_code.value())
    ));
}
void
library_smoke_Errors_methodWithPayloadError_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<void, smoke::Payload>*>(handle);
}
FfiOpaqueHandle
library_smoke_Errors_methodWithPayloadError_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Payload>::toFfi(
        reinterpret_cast<gluecodium::Return<void, smoke::Payload>*>(handle)->error()
    );
}
bool
library_smoke_Errors_methodWithPayloadError_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<void, smoke::Payload>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_Errors_methodWithPayloadError(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result = smoke::Errors::method_with_payload_error();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<void, smoke::Payload>(
        std::forward<gluecodium::Return<void, smoke::Payload>>(_cpp_call_result)
    ));
}
void
library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<std::string, smoke::Payload>*>(handle);
}
FfiOpaqueHandle
library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_get_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<gluecodium::Return<std::string, smoke::Payload>*>(handle)->unsafe_value()
    );
}
FfiOpaqueHandle
library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Payload>::toFfi(
        reinterpret_cast<gluecodium::Return<std::string, smoke::Payload>*>(handle)->error()
    );
}
bool
library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<std::string, smoke::Payload>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_Errors_methodWithPayloadErrorAndReturnValue(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result = smoke::Errors::method_with_payload_error_and_return_value();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::string, smoke::Payload>(
        std::forward<gluecodium::Return<std::string, smoke::Payload>>(_cpp_call_result)
    ));
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Errors_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::Errors>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_Errors_release_handle(handle);
}
void
library_smoke_Errors_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Errors_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Errors_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::Errors>(
            *reinterpret_cast<std::shared_ptr<smoke::Errors>*>(handle)
        )
    );
}
void
library_smoke_Errors_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::Errors>*>(handle);
}
FfiOpaqueHandle
library_smoke_Errors_InternalErrorCode_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Errors::InternalErrorCode>(
            gluecodium::ffi::Conversion<smoke::Errors::InternalErrorCode>::toCpp(value)
        )
    );
}
void
library_smoke_Errors_InternalErrorCode_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Errors::InternalErrorCode>*>(handle);
}
uint32_t
library_smoke_Errors_InternalErrorCode_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Errors::InternalErrorCode>::toFfi(
        **reinterpret_cast<std::optional<smoke::Errors::InternalErrorCode>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Errors_ExternalErrors_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<fire::SomeEnum>(
            gluecodium::ffi::Conversion<fire::SomeEnum>::toCpp(value)
        )
    );
}
void
library_smoke_Errors_ExternalErrors_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<fire::SomeEnum>*>(handle);
}
uint32_t
library_smoke_Errors_ExternalErrors_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<fire::SomeEnum>::toFfi(
        **reinterpret_cast<std::optional<fire::SomeEnum>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
