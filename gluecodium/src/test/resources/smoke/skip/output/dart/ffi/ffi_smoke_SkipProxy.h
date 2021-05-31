#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include "dart_api_dl.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipProxy_notInJava__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input);
_GLUECODIUM_FFI_EXPORT bool library_smoke_SkipProxy_notInSwift__Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, bool input);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipProxy_skippedInJava_get(FfiOpaqueHandle _self, int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT void library_smoke_SkipProxy_skippedInJava_set__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value);
_GLUECODIUM_FFI_EXPORT bool library_smoke_SkipProxy_isSkippedInSwift_get(FfiOpaqueHandle _self, int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT void library_smoke_SkipProxy_isSkippedInSwift_set__Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, bool value);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipProxy_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_SkipProxy_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipProxy_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s, FfiOpaqueHandle p1g, FfiOpaqueHandle p1s);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipProxy_get_type_id(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
