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
typedef uint32_t namerules_INameRules_IExampleErrorCode;
typedef struct {
    bool has_value;
    union {
        namerules_INameRules_IExampleErrorCode error_value;
        double returned_value;
    };
} namerules_INameRules_someMethod_result;
_GLUECODIUM_C_EXPORT _baseRef namerules_INameRules_IExampleStruct_create_handle(double iValue, _baseRef iIntValue);
_GLUECODIUM_C_EXPORT void namerules_INameRules_IExampleStruct_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef namerules_INameRules_IExampleStruct_create_optional_handle(double iValue, _baseRef iIntValue);
_GLUECODIUM_C_EXPORT _baseRef namerules_INameRules_IExampleStruct_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void namerules_INameRules_IExampleStruct_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT double namerules_INameRules_IExampleStruct_iValue_get(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef namerules_INameRules_IExampleStruct_iIntValue_get(_baseRef handle);
_GLUECODIUM_C_EXPORT void namerules_INameRules_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef namerules_INameRules_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* namerules_INameRules_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void namerules_INameRules_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void namerules_INameRules_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef namerules_INameRules_create();
_GLUECODIUM_C_EXPORT namerules_INameRules_someMethod_result namerules_INameRules_someMethod(_baseRef _instance, _baseRef someArgument);
_GLUECODIUM_C_EXPORT uint32_t namerules_INameRules_intPropertyPod_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void namerules_INameRules_intPropertyPod_set(_baseRef _instance, uint32_t value);
_GLUECODIUM_C_EXPORT bool namerules_INameRules_isBooleanPropertyPod_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void namerules_INameRules_isBooleanPropertyPod_set(_baseRef _instance, bool value);
_GLUECODIUM_C_EXPORT _baseRef namerules_INameRules_structPropertyPod_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void namerules_INameRules_structPropertyPod_set(_baseRef _instance, _baseRef value);
#ifdef __cplusplus
}
#endif
