#include "ffi_smoke_EnableIfField.h"
#include "ConversionBase.h"
#include "smoke/EnableIfField.h"
#include <cstdint>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_EnableIfField_create_handle(int32_t intField, bool boolField) {
    auto _result = new (std::nothrow) smoke::EnableIfField();
    _result->int_field = gluecodium::ffi::Conversion<int32_t>::toCpp(intField);
    _result->bool_field = gluecodium::ffi::Conversion<bool>::toCpp(boolField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_EnableIfField_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::EnableIfField*>(handle);
}
int32_t
library_smoke_EnableIfField_get_field_intField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        reinterpret_cast<smoke::EnableIfField*>(handle)->int_field
    );
}
bool
library_smoke_EnableIfField_get_field_boolField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        reinterpret_cast<smoke::EnableIfField*>(handle)->bool_field
    );
}
FfiOpaqueHandle
library_smoke_EnableIfField_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::EnableIfField>(
            gluecodium::ffi::Conversion<smoke::EnableIfField>::toCpp(value)
        )
    );
}
void
library_smoke_EnableIfField_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::EnableIfField>*>(handle);
}
FfiOpaqueHandle
library_smoke_EnableIfField_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::EnableIfField>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::EnableIfField>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
