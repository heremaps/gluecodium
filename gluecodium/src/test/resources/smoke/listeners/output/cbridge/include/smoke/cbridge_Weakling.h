//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_Weakling_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Weakling_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_Weakling_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_Weakling_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_Weakling_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_Weakling_get_typed(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    _baseRef(*smoke_Weakling_listener_get)(void* swift_pointer);
    void(*smoke_Weakling_listener_set)(void* swift_pointer, _baseRef value);
} smoke_Weakling_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_Weakling_create_proxy(smoke_Weakling_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_Weakling_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Weakling_listener_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_Weakling_listener_set(_baseRef _instance, _baseRef value);
#ifdef __cplusplus
}
#endif
