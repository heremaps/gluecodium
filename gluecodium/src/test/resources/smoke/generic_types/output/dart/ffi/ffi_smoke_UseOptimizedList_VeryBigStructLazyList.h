#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT void library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT uint64_t library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get_size(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get(FfiOpaqueHandle handle, uint64_t index);
#ifdef __cplusplus
}
#endif
