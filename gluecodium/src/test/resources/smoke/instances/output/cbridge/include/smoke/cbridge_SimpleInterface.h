//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_SimpleInterface_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SimpleInterface_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_SimpleInterface_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SimpleInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_SimpleInterface_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_SimpleInterface_get_typed(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    _baseRef(*smoke_SimpleInterface_getStringValue)(void* swift_pointer);
    _baseRef(*smoke_SimpleInterface_useSimpleInterface)(void* swift_pointer, _baseRef input);
} smoke_SimpleInterface_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_SimpleInterface_create_proxy(smoke_SimpleInterface_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_SimpleInterface_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SimpleInterface_getStringValue(_baseRef _instance);
_GLUECODIUM_C_EXPORT _baseRef smoke_SimpleInterface_useSimpleInterface(_baseRef _instance, _baseRef input);
#ifdef __cplusplus
}
#endif
