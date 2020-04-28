//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/StringHandle.h"
_GLUECODIUM_C_EXPORT void smoke_SkipFunctions_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipFunctions_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_SkipFunctions_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SkipFunctions_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipFunctions_notInJava(_baseRef input);
_GLUECODIUM_C_EXPORT float smoke_SkipFunctions_notInDart(float input);
#ifdef __cplusplus
}
#endif
