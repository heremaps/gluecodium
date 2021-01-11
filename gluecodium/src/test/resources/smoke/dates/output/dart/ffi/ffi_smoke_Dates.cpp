#include "ffi_smoke_Dates.h"
#include "ConversionBase.h"
#include "ReverseCache.h"
#include "IsolateContext.h"
#include "gluecodium/TimePointHash.h"
#include "smoke/Dates.h"
#include <chrono>
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
uint64_t
library_smoke_Dates_dateMethod__Date(FfiOpaqueHandle _self, int32_t _isolate_id, uint64_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Dates>>::toCpp(_self)).date_method(
            gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toCpp(input)
        )
    );
}
uint64_t
library_smoke_Dates_dateProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Dates>>::toCpp(_self)).get_date_property()
    );
}
void
library_smoke_Dates_dateProperty_set__Date(FfiOpaqueHandle _self, int32_t _isolate_id, uint64_t value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Dates>>::toCpp(_self)).set_date_property(
            gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_Dates_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::Dates>(
            *reinterpret_cast<std::shared_ptr<::smoke::Dates>*>(handle)
        )
    );
}
void
library_smoke_Dates_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::Dates>*>(handle);
}
FfiOpaqueHandle
library_smoke_Dates_DateStruct_create_handle(uint64_t dateField) {
    auto _result = new (std::nothrow) ::smoke::Dates::DateStruct(gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toCpp(dateField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Dates_DateStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Dates::DateStruct*>(handle);
}
uint64_t
library_smoke_Dates_DateStruct_get_field_dateField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toFfi(
        reinterpret_cast<::smoke::Dates::DateStruct*>(handle)->date_field
    );
}
FfiOpaqueHandle
library_smoke_Dates_DateStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Dates::DateStruct>(
            gluecodium::ffi::Conversion<::smoke::Dates::DateStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Dates_DateStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Dates::DateStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Dates_DateStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Dates::DateStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Dates::DateStruct>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
