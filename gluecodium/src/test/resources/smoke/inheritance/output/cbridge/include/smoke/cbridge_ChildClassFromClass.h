//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromClass_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_ChildClassFromClass_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_ChildClassFromClass_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromClass_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_ChildClassFromClass_get_typed(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromClass_childClassMethod(_baseRef _instance);
#ifdef __cplusplus
}
#endif
