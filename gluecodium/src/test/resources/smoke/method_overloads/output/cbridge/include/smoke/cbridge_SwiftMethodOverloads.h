//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_SwiftMethodOverloads_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SwiftMethodOverloads_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_SwiftMethodOverloads_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SwiftMethodOverloads_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_SwiftMethodOverloads_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SwiftMethodOverloads_three_String(_baseRef _instance, _baseRef input);
_GLUECODIUM_C_EXPORT void smoke_SwiftMethodOverloads_three__3String_4(_baseRef _instance, _baseRef input);
#ifdef __cplusplus
}
#endif
