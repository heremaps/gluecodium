//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_SkipSetter_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipSetter_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_SkipSetter_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SkipSetter_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_SkipSetter_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_SkipSetter_get_typed(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    _baseRef(*smoke_SkipSetter_foo_get)(void* swift_pointer);
} smoke_SkipSetter_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipSetter_create_proxy(smoke_SkipSetter_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_SkipSetter_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipSetter_foo_get(_baseRef _instance);
#ifdef __cplusplus
}
#endif
