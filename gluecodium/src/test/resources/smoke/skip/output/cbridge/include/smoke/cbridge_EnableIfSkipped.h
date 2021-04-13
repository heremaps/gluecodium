//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_EnableIfSkipped_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_EnableIfSkipped_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_EnableIfSkipped_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_EnableIfSkipped_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_EnableIfSkipped_remove_swift_object_from_wrapper_cache(_baseRef handle);
#ifdef __cplusplus
}
#endif
