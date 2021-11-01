#pragma once
#include "Export.h"
#include "dart_api_dl.h"
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT Dart_Handle library_get_cached_dart_handle(FfiOpaqueHandle handle, Dart_Handle null_handle);
_GLUECODIUM_FFI_EXPORT void library_cache_dart_handle(FfiOpaqueHandle handle, int32_t isolate_id, Dart_Handle dart_handle);
_GLUECODIUM_FFI_EXPORT void library_cache_dart_handle_by_raw_pointer(void* raw_pointer, int32_t isolate_id, Dart_Handle dart_handle);
_GLUECODIUM_FFI_EXPORT void library_uncache_dart_handle_by_raw_pointer(void* raw_pointer, int32_t isolate_id);
#ifdef __cplusplus
}
#endif
