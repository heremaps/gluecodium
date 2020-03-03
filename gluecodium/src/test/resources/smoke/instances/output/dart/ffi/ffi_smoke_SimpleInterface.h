#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SimpleInterface_getStringValue(FfiOpaqueHandle _self);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SimpleInterface_useSimpleInterface__SimpleInterface(FfiOpaqueHandle _self, FfiOpaqueHandle input);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SimpleInterface_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_SimpleInterface_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SimpleInterface_create_proxy(uint64_t token, FfiOpaqueHandle f0, FfiOpaqueHandle f1);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SimpleInterface_get_raw_pointer(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SimpleInterface_get_type_id(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
