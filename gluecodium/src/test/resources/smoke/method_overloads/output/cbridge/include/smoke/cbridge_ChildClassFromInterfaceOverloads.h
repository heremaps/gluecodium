//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdint.h>
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterfaceOverloads_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_ChildClassFromInterfaceOverloads_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_ChildClassFromInterfaceOverloads_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterfaceOverloads_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterfaceOverloads_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_ChildClassFromInterfaceOverloads_get_typed(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterfaceOverloads_foo_String(_baseRef _instance, _baseRef input);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterfaceOverloads_bar_String(_baseRef _instance, _baseRef input);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterfaceOverloads_foo_(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterfaceOverloads_foo_Int(_baseRef _instance, int32_t input);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterfaceOverloads_bar(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_ChildClassFromInterfaceOverloads_baz(_baseRef _instance);
#ifdef __cplusplus
}
#endif
