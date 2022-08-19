#include "ffi_smoke_ImmutableStructWithClash.h"
#include "ConversionBase.h"
#include "smoke/ImmutableStructWithClash.h"
#include <cstdint>
#include <stdbool.h>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_ImmutableStructWithClash_create_handle(FfiOpaqueHandle stringField, int32_t intField, bool boolField) {
    auto _result = new (std::nothrow) smoke::ImmutableStructWithClash(gluecodium::ffi::Conversion<bool>::toCpp(boolField), gluecodium::ffi::Conversion<int32_t>::toCpp(intField), gluecodium::ffi::Conversion<std::string>::toCpp(stringField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_ImmutableStructWithClash_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::ImmutableStructWithClash*>(handle);
}
FfiOpaqueHandle
library_smoke_ImmutableStructWithClash_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::ImmutableStructWithClash*>(handle)->string_field
    );
}
int32_t
library_smoke_ImmutableStructWithClash_get_field_intField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        reinterpret_cast<smoke::ImmutableStructWithClash*>(handle)->int_field
    );
}
bool
library_smoke_ImmutableStructWithClash_get_field_boolField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        reinterpret_cast<smoke::ImmutableStructWithClash*>(handle)->bool_field
    );
}
FfiOpaqueHandle
library_smoke_ImmutableStructWithClash_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::ImmutableStructWithClash>(
            gluecodium::ffi::Conversion<smoke::ImmutableStructWithClash>::toCpp(value)
        )
    );
}
void
library_smoke_ImmutableStructWithClash_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::ImmutableStructWithClash>*>(handle);
}
FfiOpaqueHandle
library_smoke_ImmutableStructWithClash_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::ImmutableStructWithClash>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::ImmutableStructWithClash>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
