//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdbool.h>
#include <stdint.h>
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_create_handle(_baseRef field);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_create_optional_handle(_baseRef field);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_field_get(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerStruct_create_handle(_baseRef otherField);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_InnerStruct_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerStruct_create_optional_handle(_baseRef otherField);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerStruct_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_InnerStruct_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerStruct_otherField_get(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_InnerStruct_doSomething(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_InnerClass_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerClass_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_OuterStruct_InnerClass_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_InnerClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_InnerClass_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerClass_fooBar(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_InnerInterface_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerInterface_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_OuterStruct_InnerInterface_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_InnerInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_InnerInterface_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_OuterStruct_InnerInterface_get_typed(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    _baseRef(*smoke_OuterStruct_InnerInterface_barBaz)(void* swift_pointer);
} smoke_OuterStruct_InnerInterface_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerInterface_create_proxy(smoke_OuterStruct_InnerInterface_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_OuterStruct_InnerInterface_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerInterface_barBaz(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_InnerLambda_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerLambda_copy_handle(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    void(*smoke_OuterStruct_InnerLambda_call)(void* swift_pointer);
} smoke_OuterStruct_InnerLambda_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerLambda_create_proxy(smoke_OuterStruct_InnerLambda_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT _baseRef smoke_OuterStruct_InnerLambda_create_optional_proxy(smoke_OuterStruct_InnerLambda_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_OuterStruct_InnerLambda_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_OuterStruct_InnerLambda_call(_baseRef _instance);
typedef struct {
    bool has_value;
    uint32_t error_value;
} smoke_OuterStruct_doNothing_result;
_GLUECODIUM_C_EXPORT smoke_OuterStruct_doNothing_result smoke_OuterStruct_doNothing(_baseRef _instance);
#ifdef __cplusplus
}
#endif
