//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdint.h>
typedef uint32_t smoke_Enums_ExternalEnum;
typedef uint32_t smoke_Enums_VeryExternalEnum;
_GLUECODIUM_C_EXPORT void smoke_Enums_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Enums_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_Enums_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_Enums_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_Enums_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_Enums_methodWithExternalEnum(smoke_Enums_ExternalEnum input);
#ifdef __cplusplus
}
#endif
