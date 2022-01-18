#include "ffi_smoke_SkipFieldInPlatformImmutable.h"
#include "ConversionBase.h"
#include "smoke/DummyStruct.h"
#include "smoke/SkipFieldInPlatformImmutable.h"
#include <cstdint>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_SkipFieldInPlatformImmutable_create_handle(int32_t intField, bool boolField) {
    auto _result = new (std::nothrow) smoke::SkipFieldInPlatformImmutable(gluecodium::ffi::Conversion<int32_t>::toCpp(intField), smoke::DummyStruct{}, gluecodium::ffi::Conversion<bool>::toCpp(boolField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_SkipFieldInPlatformImmutable_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::SkipFieldInPlatformImmutable*>(handle);
}
int32_t
library_smoke_SkipFieldInPlatformImmutable_get_field_intField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        reinterpret_cast<smoke::SkipFieldInPlatformImmutable*>(handle)->int_field
    );
}
bool
library_smoke_SkipFieldInPlatformImmutable_get_field_boolField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        reinterpret_cast<smoke::SkipFieldInPlatformImmutable*>(handle)->bool_field
    );
}
FfiOpaqueHandle
library_smoke_SkipFieldInPlatformImmutable_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::SkipFieldInPlatformImmutable>(
            gluecodium::ffi::Conversion<smoke::SkipFieldInPlatformImmutable>::toCpp(value)
        )
    );
}
void
library_smoke_SkipFieldInPlatformImmutable_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::SkipFieldInPlatformImmutable>*>(handle);
}
FfiOpaqueHandle
library_smoke_SkipFieldInPlatformImmutable_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::SkipFieldInPlatformImmutable>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::SkipFieldInPlatformImmutable>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
