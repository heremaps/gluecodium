#include "ffi_smoke_SkipFieldInPlatform.h"
#include "ConversionBase.h"
#include "smoke/SkipFieldInPlatform.h"
#include <cstdint>
#include <stdbool.h>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_SkipFieldInPlatform_create_handle(int32_t intField, bool boolField) {
    auto _result = new (std::nothrow) smoke::SkipFieldInPlatform();
    _result->int_field = gluecodium::ffi::Conversion<int32_t>::toCpp(intField);
    _result->bool_field = gluecodium::ffi::Conversion<bool>::toCpp(boolField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_SkipFieldInPlatform_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::SkipFieldInPlatform*>(handle);
}
int32_t
library_smoke_SkipFieldInPlatform_get_field_intField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        reinterpret_cast<smoke::SkipFieldInPlatform*>(handle)->int_field
    );
}
bool
library_smoke_SkipFieldInPlatform_get_field_boolField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        reinterpret_cast<smoke::SkipFieldInPlatform*>(handle)->bool_field
    );
}
FfiOpaqueHandle
library_smoke_SkipFieldInPlatform_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::SkipFieldInPlatform>(
            gluecodium::ffi::Conversion<smoke::SkipFieldInPlatform>::toCpp(value)
        )
    );
}
void
library_smoke_SkipFieldInPlatform_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::SkipFieldInPlatform>*>(handle);
}
FfiOpaqueHandle
library_smoke_SkipFieldInPlatform_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::SkipFieldInPlatform>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::SkipFieldInPlatform>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
