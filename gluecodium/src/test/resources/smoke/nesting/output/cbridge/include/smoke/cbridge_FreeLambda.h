//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdint.h>
_GLUECODIUM_C_EXPORT void smoke_FreeLambda_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_FreeLambda_copy_handle(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    uint32_t(*smoke_FreeLambda_call)(void* swift_pointer, double p0);
} smoke_FreeLambda_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_FreeLambda_create_proxy(smoke_FreeLambda_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT _baseRef smoke_FreeLambda_create_optional_proxy(smoke_FreeLambda_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_FreeLambda_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT uint32_t smoke_FreeLambda_call(_baseRef _instance, double p0);
#ifdef __cplusplus
}
#endif
