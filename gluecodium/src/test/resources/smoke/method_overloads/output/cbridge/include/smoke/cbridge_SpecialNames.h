//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_SpecialNames_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SpecialNames_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_SpecialNames_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SpecialNames_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_SpecialNames_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SpecialNames_create(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_SpecialNames_release(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_SpecialNames_createProxy(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_SpecialNames_Uppercase(_baseRef _instance);
#ifdef __cplusplus
}
#endif
