#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include "dart_api_dl.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT void library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle);
_GLUECODIUM_FFI_EXPORT uint64_t library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get_size(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get(FfiOpaqueHandle handle, uint64_t index);
#ifdef __cplusplus
}
#endif
