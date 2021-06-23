#include "ffi_smoke_SkipField.h"
#include "ConversionBase.h"
#include "smoke/SkipField.h"
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_SkipField_create_handle(FfiOpaqueHandle field) {
    auto _result = new (std::nothrow) smoke::SkipField(gluecodium::ffi::Conversion<std::string>::toCpp(field));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_SkipField_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::SkipField*>(handle);
}
FfiOpaqueHandle
library_smoke_SkipField_get_field_field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::SkipField*>(handle)->field
    );
}
FfiOpaqueHandle
library_smoke_SkipField_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::SkipField>(
            gluecodium::ffi::Conversion<smoke::SkipField>::toCpp(value)
        )
    );
}
void
library_smoke_SkipField_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::SkipField>*>(handle);
}
FfiOpaqueHandle
library_smoke_SkipField_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::SkipField>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::SkipField>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
