#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include "dart_api_dl.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT void library_smoke_EnableIfEnabled_enableIfUnquoted(int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT void library_smoke_EnableIfEnabled_enableIfUnquotedList(int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT void library_smoke_EnableIfEnabled_enableIfQuoted(int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT void library_smoke_EnableIfEnabled_enableIfQuotedList(int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT void library_smoke_EnableIfEnabled_enableIfTagged(int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT void library_smoke_EnableIfEnabled_enableIfTaggedList(int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT void library_smoke_EnableIfEnabled_enableIfMixedList(int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT void library_smoke_EnableIfEnabled_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_EnableIfEnabled_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_EnableIfEnabled_release_handle(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
