
#pragma once

#include "Export.h"
#include "OpaqueHandle.h"
#include "dart_api_dl.h"
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif




_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SimpleInterface_getStringValue(FfiOpaqueHandle _self, int32_t _isolate_id);



_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SimpleInterface_useSimpleInterface__SimpleInterface(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input);












_GLUECODIUM_FFI_EXPORT void library_smoke_SimpleInterface_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SimpleInterface_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_SimpleInterface_release_handle(FfiOpaqueHandle handle);

_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SimpleInterface_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0, FfiOpaqueHandle f1);



_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SimpleInterface_get_type_id(FfiOpaqueHandle handle);

#ifdef __cplusplus
}
#endif
