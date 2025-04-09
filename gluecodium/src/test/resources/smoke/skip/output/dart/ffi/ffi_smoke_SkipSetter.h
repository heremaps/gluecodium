
#pragma once

#include "Export.h"
#include "OpaqueHandle.h"
#include "dart_api_dl.h"
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif





_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipSetter_foo_get(FfiOpaqueHandle _self, int32_t _isolate_id);












_GLUECODIUM_FFI_EXPORT void library_smoke_SkipSetter_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipSetter_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_SkipSetter_release_handle(FfiOpaqueHandle handle);

_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipSetter_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle p0g);



_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipSetter_get_type_id(FfiOpaqueHandle handle);

#ifdef __cplusplus
}
#endif
