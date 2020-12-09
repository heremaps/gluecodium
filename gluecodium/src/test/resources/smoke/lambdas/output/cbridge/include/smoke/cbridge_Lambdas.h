//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdint.h>
_GLUECODIUM_C_EXPORT void smoke_Lambdas_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_Lambdas_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_Lambdas_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_Lambdas_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_deconfuse(_baseRef _instance, _baseRef value, _baseRef confuser);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_fuse(_baseRef items, _baseRef callback);
_GLUECODIUM_C_EXPORT void smoke_Lambdas_Producer_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Producer_copy_handle(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    _baseRef(*smoke_Lambdas_Producer_call)(void* swift_pointer);
} smoke_Lambdas_Producer_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Producer_create_proxy(smoke_Lambdas_Producer_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Producer_create_optional_proxy(smoke_Lambdas_Producer_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_Lambdas_Producer_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Producer_call(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_Lambdas_Convoluter_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Convoluter_copy_handle(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    _baseRef(*smoke_Lambdas_Convoluter_call)(void* swift_pointer, _baseRef p0);
} smoke_Lambdas_Convoluter_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Convoluter_create_proxy(smoke_Lambdas_Convoluter_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Convoluter_create_optional_proxy(smoke_Lambdas_Convoluter_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_Lambdas_Convoluter_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Convoluter_call(_baseRef _instance, _baseRef p0);
_GLUECODIUM_C_EXPORT void smoke_Lambdas_Consumer_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Consumer_copy_handle(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    void(*smoke_Lambdas_Consumer_call)(void* swift_pointer, _baseRef p0);
} smoke_Lambdas_Consumer_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Consumer_create_proxy(smoke_Lambdas_Consumer_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Consumer_create_optional_proxy(smoke_Lambdas_Consumer_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_Lambdas_Consumer_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_Lambdas_Consumer_call(_baseRef _instance, _baseRef p0);
_GLUECODIUM_C_EXPORT void smoke_Lambdas_Indexer_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Indexer_copy_handle(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    int32_t(*smoke_Lambdas_Indexer_call)(void* swift_pointer, _baseRef p0, float p1);
} smoke_Lambdas_Indexer_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Indexer_create_proxy(smoke_Lambdas_Indexer_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_Indexer_create_optional_proxy(smoke_Lambdas_Indexer_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_Lambdas_Indexer_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT int32_t smoke_Lambdas_Indexer_call(_baseRef _instance, _baseRef p0, float p1);
_GLUECODIUM_C_EXPORT void smoke_Lambdas_NullableConfuser_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_NullableConfuser_copy_handle(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    _baseRef(*smoke_Lambdas_NullableConfuser_call)(void* swift_pointer, _baseRef p0);
} smoke_Lambdas_NullableConfuser_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_NullableConfuser_create_proxy(smoke_Lambdas_NullableConfuser_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_NullableConfuser_create_optional_proxy(smoke_Lambdas_NullableConfuser_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_Lambdas_NullableConfuser_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Lambdas_NullableConfuser_call(_baseRef _instance, _baseRef p0);
#ifdef __cplusplus
}
#endif
