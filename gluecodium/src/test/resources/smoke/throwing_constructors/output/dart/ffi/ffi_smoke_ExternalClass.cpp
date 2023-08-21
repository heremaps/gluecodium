#include "ffi_smoke_ExternalClass.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "gluecodium\TypeRepository.h"
#include "smoke\ExternalClass.h"
#include <cstdint>
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
void
library_smoke_ExternalClass_create_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass>, smoke::ExternalClass::ErrorEnum>*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalClass_create_return_get_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::ExternalClass>>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass>, smoke::ExternalClass::ErrorEnum>*>(handle)->unsafe_value()
    );
}
uint32_t
library_smoke_ExternalClass_create_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::ExternalClass::ErrorEnum>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass>, smoke::ExternalClass::ErrorEnum>*>(handle)->error()
    );
}
bool
library_smoke_ExternalClass_create_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass>, smoke::ExternalClass::ErrorEnum>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_ExternalClass_create(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result = smoke::ExternalClass::create();
    if (_cpp_call_result.has_value()) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<smoke::ExternalClass>, smoke::ExternalClass::ErrorEnum>(
            std::forward<std::shared_ptr<smoke::ExternalClass>>(_cpp_call_result.unsafe_value())
        ));
    }
    auto _error_code = _cpp_call_result.error();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<smoke::ExternalClass>, smoke::ExternalClass::ErrorEnum>(
        static_cast<smoke::ExternalClass::ErrorEnum>(_error_code.value())
    ));
}
void
library_smoke_ExternalClass_InternalOne_create_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalClass_InternalOne_create_return_get_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::ExternalClass::InternalOne>>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>*>(handle)->unsafe_value()
    );
}
uint32_t
library_smoke_ExternalClass_InternalOne_create_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::ExternalClass::ErrorEnum>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>*>(handle)->error()
    );
}
bool
library_smoke_ExternalClass_InternalOne_create_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_ExternalClass_InternalOne_create(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result = smoke::ExternalClass::InternalOne::create();
    if (_cpp_call_result.has_value()) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>(
            std::forward<std::shared_ptr<smoke::ExternalClass::InternalOne>>(_cpp_call_result.unsafe_value())
        ));
    }
    auto _error_code = _cpp_call_result.error();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>(
        static_cast<smoke::ExternalClass::ErrorEnum>(_error_code.value())
    ));
}
void
library_smoke_ExternalClass_InternalOne_create__ULong_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalClass_InternalOne_create__ULong_return_get_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::ExternalClass::InternalOne>>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>*>(handle)->unsafe_value()
    );
}
uint32_t
library_smoke_ExternalClass_InternalOne_create__ULong_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::ExternalClass::ErrorEnum>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>*>(handle)->error()
    );
}
bool
library_smoke_ExternalClass_InternalOne_create__ULong_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_ExternalClass_InternalOne_create__ULong(int32_t _isolate_id, uint64_t value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result = smoke::ExternalClass::InternalOne::create(
        gluecodium::ffi::Conversion<uint64_t>::toCpp(value)
    );
    if (_cpp_call_result.has_value()) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>(
            std::forward<std::shared_ptr<smoke::ExternalClass::InternalOne>>(_cpp_call_result.unsafe_value())
        ));
    }
    auto _error_code = _cpp_call_result.error();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalOne>, smoke::ExternalClass::ErrorEnum>(
        static_cast<smoke::ExternalClass::ErrorEnum>(_error_code.value())
    ));
}
void
library_smoke_ExternalClass_InternalTwo_create_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalTwo>, smoke::ExternalClass::ErrorEnum>*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalClass_InternalTwo_create_return_get_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::ExternalClass::InternalTwo>>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalTwo>, smoke::ExternalClass::ErrorEnum>*>(handle)->unsafe_value()
    );
}
uint32_t
library_smoke_ExternalClass_InternalTwo_create_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::ExternalClass::ErrorEnum>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalTwo>, smoke::ExternalClass::ErrorEnum>*>(handle)->error()
    );
}
bool
library_smoke_ExternalClass_InternalTwo_create_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalTwo>, smoke::ExternalClass::ErrorEnum>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_ExternalClass_InternalTwo_create(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result = smoke::ExternalClass::InternalTwo::create();
    if (_cpp_call_result.has_value()) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalTwo>, smoke::ExternalClass::ErrorEnum>(
            std::forward<std::shared_ptr<smoke::ExternalClass::InternalTwo>>(_cpp_call_result.unsafe_value())
        ));
    }
    auto _error_code = _cpp_call_result.error();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<smoke::ExternalClass::InternalTwo>, smoke::ExternalClass::ErrorEnum>(
        static_cast<smoke::ExternalClass::ErrorEnum>(_error_code.value())
    ));
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_ExternalClass_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::ExternalClass>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_ExternalClass_release_handle(handle);
}
void
library_smoke_ExternalClass_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_ExternalClass_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_ExternalClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::ExternalClass>(
            *reinterpret_cast<std::shared_ptr<smoke::ExternalClass>*>(handle)
        )
    );
}
void
library_smoke_ExternalClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::ExternalClass>*>(handle);
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_ExternalClass_InternalOne_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::ExternalClass::InternalOne>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_ExternalClass_InternalOne_release_handle(handle);
}
void
library_smoke_ExternalClass_InternalOne_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_ExternalClass_InternalOne_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_ExternalClass_InternalOne_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::ExternalClass::InternalOne>(
            *reinterpret_cast<std::shared_ptr<smoke::ExternalClass::InternalOne>*>(handle)
        )
    );
}
void
library_smoke_ExternalClass_InternalOne_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::ExternalClass::InternalOne>*>(handle);
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_ExternalClass_InternalTwo_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::ExternalClass::InternalTwo>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_ExternalClass_InternalTwo_release_handle(handle);
}
void
library_smoke_ExternalClass_InternalTwo_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_ExternalClass_InternalTwo_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_ExternalClass_InternalTwo_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::ExternalClass::InternalTwo>(
            *reinterpret_cast<std::shared_ptr<smoke::ExternalClass::InternalTwo>*>(handle)
        )
    );
}
void
library_smoke_ExternalClass_InternalTwo_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::ExternalClass::InternalTwo>*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalClass_ErrorEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::ExternalClass::ErrorEnum>(
            gluecodium::ffi::Conversion<smoke::ExternalClass::ErrorEnum>::toCpp(value)
        )
    );
}
void
library_smoke_ExternalClass_ErrorEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::ExternalClass::ErrorEnum>*>(handle);
}
uint32_t
library_smoke_ExternalClass_ErrorEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::ExternalClass::ErrorEnum>::toFfi(
        **reinterpret_cast<std::optional<smoke::ExternalClass::ErrorEnum>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_ExternalClass_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::ExternalClass>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif