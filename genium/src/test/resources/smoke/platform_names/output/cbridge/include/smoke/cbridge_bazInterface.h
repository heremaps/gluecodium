//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_bazTypes.h"
#include <stdint.h>
_GENIUM_C_EXPORT void smoke_PlatformNamesInterface_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_PlatformNamesInterface_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_PlatformNamesInterface_BazMethod(_baseRef _instance, _baseRef BazParameter);
_GENIUM_C_EXPORT _baseRef smoke_PlatformNamesInterface_make(_baseRef makeParameter);
_GENIUM_C_EXPORT uint32_t smoke_PlatformNamesInterface_basicAttribute_get(_baseRef _instance);
_GENIUM_C_EXPORT void smoke_PlatformNamesInterface_basicAttribute_set(_baseRef _instance, uint32_t newValue);
#ifdef __cplusplus
}
#endif
