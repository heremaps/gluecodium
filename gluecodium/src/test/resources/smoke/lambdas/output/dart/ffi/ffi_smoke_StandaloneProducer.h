
#pragma once

#include "Export.h"
#include "OpaqueHandle.h"
#include "dart_api_dl.h"
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif




_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_StandaloneProducer_call(FfiOpaqueHandle _self, int32_t _isolate_id);












_GLUECODIUM_FFI_EXPORT void library_smoke_StandaloneProducer_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_StandaloneProducer_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_StandaloneProducer_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_StandaloneProducer_create_handle_nullable(FfiOpaqueHandle value);
_GLUECODIUM_FFI_EXPORT void library_smoke_StandaloneProducer_release_handle_nullable(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_StandaloneProducer_get_value_nullable(FfiOpaqueHandle handle);

_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_StandaloneProducer_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0);




#ifdef __cplusplus
}
#endif
