//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_NoCacheInterface_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_NoCacheInterface_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_NoCacheInterface_get_typed(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    void(*smoke_NoCacheInterface_foo)(void* swift_pointer);
} smoke_NoCacheInterface_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_NoCacheInterface_create_proxy(smoke_NoCacheInterface_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT void smoke_NoCacheInterface_foo(_baseRef _instance);
#ifdef __cplusplus
}
#endif
