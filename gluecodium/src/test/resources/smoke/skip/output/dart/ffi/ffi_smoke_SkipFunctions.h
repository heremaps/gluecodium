#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include "dart_api_dl.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipFunctions_notInJava__String(int32_t _isolate_id, FfiOpaqueHandle input);
_GLUECODIUM_FFI_EXPORT bool library_smoke_SkipFunctions_notInSwift__Boolean(int32_t _isolate_id, bool input);
_GLUECODIUM_FFI_EXPORT void library_smoke_SkipFunctions_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipFunctions_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_SkipFunctions_release_handle(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
