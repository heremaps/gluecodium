//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdbool.h>
_GLUECODIUM_C_EXPORT void smoke_ChildClassWithBool_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_ChildClassWithBool_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_ChildClassWithBool_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildClassWithBool_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_ChildClassWithBool_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_ChildClassWithBool_get_typed(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildClassWithBool_rootMethod(_baseRef _instance, bool input1);
#ifdef __cplusplus
}
#endif
