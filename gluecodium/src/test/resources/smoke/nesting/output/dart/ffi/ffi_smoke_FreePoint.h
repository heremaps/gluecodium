#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle smoke_FreePoint_flip(FfiOpaqueHandle _self);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle smoke_FreePoint_create_handle(double, double);
_GLUECODIUM_FFI_EXPORT void smoke_FreePoint_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT double smoke_FreePoint_get_field_x(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT double smoke_FreePoint_get_field_y(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle smoke_FreePoint_create_handle_nullable(FfiOpaqueHandle value);
_GLUECODIUM_FFI_EXPORT void smoke_FreePoint_release_handle_nullable(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle smoke_FreePoint_get_value_nullable(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
