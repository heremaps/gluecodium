#include "ffi_smoke_DatesSteady.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TimePointHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/DatesSteady.h"
#include <chrono>
#include <memory>
#include <vector>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
uint64_t
library_smoke_DatesSteady_dateMethod__Date(FfiOpaqueHandle _self, int32_t _isolate_id, uint64_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::chrono::steady_clock::time_point>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::DatesSteady>>::toCpp(_self)).date_method(
            gluecodium::ffi::Conversion<std::chrono::steady_clock::time_point>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_DatesSteady_nullableDateMethod__Date(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<gluecodium::optional<std::chrono::steady_clock::time_point>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::DatesSteady>>::toCpp(_self)).nullable_date_method(
            gluecodium::ffi::Conversion<gluecodium::optional<std::chrono::steady_clock::time_point>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_DatesSteady_dateListMethod__ListOf_Date_std_2chrono_2steady_1clock_2time_1point(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::vector<std::chrono::steady_clock::time_point>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::DatesSteady>>::toCpp(_self)).date_list_method(
            gluecodium::ffi::Conversion<std::vector<std::chrono::steady_clock::time_point>>::toCpp(input)
        )
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_DatesSteady_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::DatesSteady>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_DatesSteady_release_handle(handle);
}
void
library_smoke_DatesSteady_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_DatesSteady_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_DatesSteady_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::DatesSteady>(
            *reinterpret_cast<std::shared_ptr<smoke::DatesSteady>*>(handle)
        )
    );
}
void
library_smoke_DatesSteady_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::DatesSteady>*>(handle);
}
FfiOpaqueHandle
library_smoke_DatesSteady_DateStruct_create_handle(uint64_t dateField, FfiOpaqueHandle nullableDateField) {
    auto _result = new (std::nothrow) smoke::DatesSteady::DateStruct(gluecodium::ffi::Conversion<std::chrono::steady_clock::time_point>::toCpp(dateField), gluecodium::ffi::Conversion<gluecodium::optional<std::chrono::steady_clock::time_point>>::toCpp(nullableDateField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_DatesSteady_DateStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::DatesSteady::DateStruct*>(handle);
}
uint64_t
library_smoke_DatesSteady_DateStruct_get_field_dateField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::chrono::steady_clock::time_point>::toFfi(
        reinterpret_cast<smoke::DatesSteady::DateStruct*>(handle)->date_field
    );
}
FfiOpaqueHandle
library_smoke_DatesSteady_DateStruct_get_field_nullableDateField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::chrono::steady_clock::time_point>>::toFfi(
        reinterpret_cast<smoke::DatesSteady::DateStruct*>(handle)->nullable_date_field
    );
}
FfiOpaqueHandle
library_smoke_DatesSteady_DateStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::DatesSteady::DateStruct>(
            gluecodium::ffi::Conversion<smoke::DatesSteady::DateStruct>::toCpp(value)
        )
    );
}
void
library_smoke_DatesSteady_DateStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::DatesSteady::DateStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_DatesSteady_DateStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::DatesSteady::DateStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::DatesSteady::DateStruct>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
