//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_ChildInterface_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_ChildInterface_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_ChildInterface_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_ChildInterface_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_ChildInterface_get_typed(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    void(*smoke_ParentInterface_rootMethod)(void* swift_pointer);
    _baseRef(*smoke_ParentInterface_rootProperty_get)(void* swift_pointer);
    void(*smoke_ParentInterface_rootProperty_set)(void* swift_pointer, _baseRef newValue);
    void(*smoke_ChildInterface_childMethod)(void* swift_pointer);
} smoke_ChildInterface_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_ChildInterface_create_proxy(smoke_ChildInterface_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_ChildInterface_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_ChildInterface_childMethod(_baseRef _instance);
#ifdef __cplusplus
}
#endif
