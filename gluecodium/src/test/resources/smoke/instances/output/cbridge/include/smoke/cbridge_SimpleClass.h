//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_SimpleClass_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SimpleClass_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_SimpleClass_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SimpleClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_SimpleClass_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SimpleClass_getStringValue(_baseRef _instance);
_GLUECODIUM_C_EXPORT _baseRef smoke_SimpleClass_useSimpleClass(_baseRef _instance, _baseRef input);
#ifdef __cplusplus
}
#endif
