#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipFunctions_notInJava__String(int32_t _isolate_id, FfiOpaqueHandle input);
_GLUECODIUM_FFI_EXPORT bool library_smoke_SkipFunctions_notInSwift__Boolean(int32_t _isolate_id, bool input);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipFunctions_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_SkipFunctions_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipFunctions_get_raw_pointer(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
