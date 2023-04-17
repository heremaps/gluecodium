#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipTypesTags_create_handle();
_GLUECODIUM_FFI_EXPORT void library_smoke_SkipTypesTags_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipTypesTags_create_handle_nullable(FfiOpaqueHandle value);
_GLUECODIUM_FFI_EXPORT void library_smoke_SkipTypesTags_release_handle_nullable(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_SkipTypesTags_get_value_nullable(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
