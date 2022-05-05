//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_ChildClassNameClash_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_ChildClassNameClash_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_ChildClassNameClash_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildClassNameClash_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_ChildClassNameClash_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_ChildClassNameClash_get_typed(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildClassNameClash_parentMethod_(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_ChildClassNameClash_parentMethod_String(_baseRef _instance, _baseRef input);
#ifdef __cplusplus
}
#endif
