#include "ffi_smoke_DurationSeconds.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "gluecodium/DurationHash.h"
#include "gluecodium/Optional.h"
#include "smoke/DurationSeconds.h"
#include <chrono>
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
uint64_t
library_smoke_DurationSeconds_durationFunction__Duration(FfiOpaqueHandle _self, int32_t _isolate_id, uint64_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::chrono::seconds>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::DurationSeconds>>::toCpp(_self)).duration_function(
            gluecodium::ffi::Conversion<std::chrono::seconds>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_DurationSeconds_nullableDurationFunction__Duration(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<gluecodium::optional<std::chrono::seconds>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::DurationSeconds>>::toCpp(_self)).nullable_duration_function(
            gluecodium::ffi::Conversion<gluecodium::optional<std::chrono::seconds>>::toCpp(input)
        )
    );
}
uint64_t
library_smoke_DurationSeconds_durationProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::chrono::seconds>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::DurationSeconds>>::toCpp(_self)).get_duration_property()
    );
}
void
library_smoke_DurationSeconds_durationProperty_set__Duration(FfiOpaqueHandle _self, int32_t _isolate_id, uint64_t value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::DurationSeconds>>::toCpp(_self)).set_duration_property(
            gluecodium::ffi::Conversion<std::chrono::seconds>::toCpp(value)
        );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_DurationSeconds_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::DurationSeconds>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_DurationSeconds_release_handle(handle);
}
void
library_smoke_DurationSeconds_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_DurationSeconds_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_DurationSeconds_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::DurationSeconds>(
            *reinterpret_cast<std::shared_ptr<smoke::DurationSeconds>*>(handle)
        )
    );
}
void
library_smoke_DurationSeconds_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::DurationSeconds>*>(handle);
}
FfiOpaqueHandle
library_smoke_DurationSeconds_DurationStruct_create_handle(uint64_t durationField) {
    auto _result = new (std::nothrow) smoke::DurationSeconds::DurationStruct(gluecodium::ffi::Conversion<std::chrono::seconds>::toCpp(durationField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_DurationSeconds_DurationStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::DurationSeconds::DurationStruct*>(handle);
}
uint64_t
library_smoke_DurationSeconds_DurationStruct_get_field_durationField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::chrono::seconds>::toFfi(
        reinterpret_cast<smoke::DurationSeconds::DurationStruct*>(handle)->duration_field
    );
}
FfiOpaqueHandle
library_smoke_DurationSeconds_DurationStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::DurationSeconds::DurationStruct>(
            gluecodium::ffi::Conversion<smoke::DurationSeconds::DurationStruct>::toCpp(value)
        )
    );
}
void
library_smoke_DurationSeconds_DurationStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::DurationSeconds::DurationStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_DurationSeconds_DurationStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::DurationSeconds::DurationStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::DurationSeconds::DurationStruct>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
