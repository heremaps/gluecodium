#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include "dart_api_dl.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT void library_smoke_ChildClassFromInterface_childClassMethod(FfiOpaqueHandle _self, int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT void library_smoke_ChildClassFromInterface_rootMethod(FfiOpaqueHandle _self, int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_ChildClassFromInterface_rootProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT void library_smoke_ChildClassFromInterface_rootProperty_set(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value);
_GLUECODIUM_FFI_EXPORT void library_smoke_ChildClassFromInterface_register_finalizer(
    FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_ChildClassFromInterface_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_ChildClassFromInterface_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_ChildClassFromInterface_get_type_id(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
