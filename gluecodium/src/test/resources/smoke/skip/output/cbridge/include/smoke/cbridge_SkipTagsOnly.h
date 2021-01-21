//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_SkipTagsOnly_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipTagsOnly_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_SkipTagsOnly_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SkipTagsOnly_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_SkipTagsOnly_remove_swift_object_from_wrapper_cache(_baseRef handle);
#ifdef __cplusplus
}
#endif
