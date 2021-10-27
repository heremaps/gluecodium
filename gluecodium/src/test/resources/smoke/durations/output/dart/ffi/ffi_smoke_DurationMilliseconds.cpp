#include "ffi_smoke_DurationMilliseconds.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "gluecodium/DurationHash.h"
#include "gluecodium/Optional.h"
#include "smoke/DurationMilliseconds.h"
#include <chrono>
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
uint64_t
library_smoke_DurationMilliseconds_durationFunction__Duration(FfiOpaqueHandle _self, int32_t _isolate_id, uint64_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::chrono::milliseconds>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::DurationMilliseconds>>::toCpp(_self)).duration_function(
            gluecodium::ffi::Conversion<std::chrono::milliseconds>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_DurationMilliseconds_nullableDurationFunction__Duration_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<gluecodium::optional<std::chrono::milliseconds>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::DurationMilliseconds>>::toCpp(_self)).nullable_duration_function(
            gluecodium::ffi::Conversion<gluecodium::optional<std::chrono::milliseconds>>::toCpp(input)
        )
    );
}
uint64_t
library_smoke_DurationMilliseconds_durationProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::chrono::milliseconds>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::DurationMilliseconds>>::toCpp(_self)).get_duration_property()
    );
}
void
library_smoke_DurationMilliseconds_durationProperty_set__Duration(FfiOpaqueHandle _self, int32_t _isolate_id, uint64_t value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::DurationMilliseconds>>::toCpp(_self)).set_duration_property(
            gluecodium::ffi::Conversion<std::chrono::milliseconds>::toCpp(value)
        );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_DurationMilliseconds_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::DurationMilliseconds>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_DurationMilliseconds_release_handle(handle);
}
void
library_smoke_DurationMilliseconds_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_DurationMilliseconds_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_DurationMilliseconds_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::DurationMilliseconds>(
            *reinterpret_cast<std::shared_ptr<smoke::DurationMilliseconds>*>(handle)
        )
    );
}
void
library_smoke_DurationMilliseconds_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::DurationMilliseconds>*>(handle);
}
FfiOpaqueHandle
library_smoke_DurationMilliseconds_DurationStruct_create_handle(uint64_t durationField) {
    auto _result = new (std::nothrow) smoke::DurationMilliseconds::DurationStruct();
    _result->duration_field = gluecodium::ffi::Conversion<std::chrono::milliseconds>::toCpp(durationField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_DurationMilliseconds_DurationStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::DurationMilliseconds::DurationStruct*>(handle);
}
uint64_t
library_smoke_DurationMilliseconds_DurationStruct_get_field_durationField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::chrono::milliseconds>::toFfi(
        reinterpret_cast<smoke::DurationMilliseconds::DurationStruct*>(handle)->duration_field
    );
}
FfiOpaqueHandle
library_smoke_DurationMilliseconds_DurationStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::DurationMilliseconds::DurationStruct>(
            gluecodium::ffi::Conversion<smoke::DurationMilliseconds::DurationStruct>::toCpp(value)
        )
    );
}
void
library_smoke_DurationMilliseconds_DurationStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::DurationMilliseconds::DurationStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_DurationMilliseconds_DurationStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::DurationMilliseconds::DurationStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::DurationMilliseconds::DurationStruct>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
