#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT void library_smoke_ChildClassFromInterface_childClassMethod(FfiOpaqueHandle _self, int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_ChildClassFromInterface_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_ChildClassFromInterface_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_ChildClassFromInterface_get_raw_pointer(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_ChildClassFromInterface_get_type_id(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
