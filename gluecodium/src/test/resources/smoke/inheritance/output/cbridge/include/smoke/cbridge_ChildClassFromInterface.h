//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterface_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_ChildClassFromInterface_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_ChildClassFromInterface_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterface_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_ChildClassFromInterface_get_typed(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterface_childClassMethod(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterface_rootMethod(_baseRef _instance);
_GLUECODIUM_C_EXPORT _baseRef smoke_ChildClassFromInterface_rootProperty_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterface_rootProperty_set(_baseRef _instance, _baseRef value);
#ifdef __cplusplus
}
#endif
