#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT void library_smoke_ChildInterface_childMethod(FfiOpaqueHandle _self);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_ChildInterface_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_ChildInterface_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_ChildInterface_create_proxy(uint64_t token, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_ChildInterface_get_raw_pointer(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_ChildInterface_get_type_id(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
