//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_InterfaceWithStatic_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_InterfaceWithStatic_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_InterfaceWithStatic_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_InterfaceWithStatic_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_InterfaceWithStatic_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_InterfaceWithStatic_get_typed(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    _baseRef(*smoke_InterfaceWithStatic_regularFunction)(void* swift_pointer);
    _baseRef(*smoke_InterfaceWithStatic_regularProperty_get)(void* swift_pointer);
    void(*smoke_InterfaceWithStatic_regularProperty_set)(void* swift_pointer, _baseRef value);
} smoke_InterfaceWithStatic_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_InterfaceWithStatic_create_proxy(smoke_InterfaceWithStatic_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_InterfaceWithStatic_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_InterfaceWithStatic_regularFunction(_baseRef _instance);
_GLUECODIUM_C_EXPORT _baseRef smoke_InterfaceWithStatic_staticFunction();
_GLUECODIUM_C_EXPORT _baseRef smoke_InterfaceWithStatic_regularProperty_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_InterfaceWithStatic_regularProperty_set(_baseRef _instance, _baseRef value);
_GLUECODIUM_C_EXPORT _baseRef smoke_InterfaceWithStatic_staticProperty_get();
_GLUECODIUM_C_EXPORT void smoke_InterfaceWithStatic_staticProperty_set(_baseRef value);
#ifdef __cplusplus
}
#endif
