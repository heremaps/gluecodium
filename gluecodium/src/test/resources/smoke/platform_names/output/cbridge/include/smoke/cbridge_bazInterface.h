//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_bazTypes.h"
#include <stdint.h>
_GLUECODIUM_C_EXPORT void smoke_PlatformNamesInterface_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_PlatformNamesInterface_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_PlatformNamesInterface_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_PlatformNamesInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT _baseRef smoke_bazInterface_BazMethod(_baseRef _instance, _baseRef BazParameter);
_GLUECODIUM_C_EXPORT _baseRef smoke_bazInterface_make(_baseRef makeParameter);
_GLUECODIUM_C_EXPORT uint32_t smoke_PlatformNamesInterface_basicProperty_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_PlatformNamesInterface_basicProperty_set(_baseRef _instance, uint32_t newValue);
#ifdef __cplusplus
}
#endif
