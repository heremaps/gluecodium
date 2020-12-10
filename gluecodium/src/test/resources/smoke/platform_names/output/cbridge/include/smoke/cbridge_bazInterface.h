//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdint.h>
_GLUECODIUM_C_EXPORT void smoke_bazInterface_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_bazInterface_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_bazInterface_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_bazInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_bazInterface_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_bazInterface_BazMethod(_baseRef _instance, _baseRef BazParameter);
_GLUECODIUM_C_EXPORT _baseRef smoke_bazInterface_make(_baseRef makeParameter);
_GLUECODIUM_C_EXPORT uint32_t smoke_bazInterface_BAZ_PROPERTY_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_bazInterface_BAZ_PROPERTY_set(_baseRef _instance, uint32_t value);
#ifdef __cplusplus
}
#endif
