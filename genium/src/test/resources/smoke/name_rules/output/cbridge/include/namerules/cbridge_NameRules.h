//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdbool.h>
#include <stdint.h>
typedef uint32_t namerules_NameRules_ExampleError;
typedef struct {
    bool has_value;
    union {
        namerules_NameRules_ExampleError error_code;
        double returned_value;
    };
} namerules_NameRules_someMethod_result;
_GENIUM_C_EXPORT _baseRef namerules_NameRules_ExampleStruct_create_handle(double iValue, _baseRef iIntValue);
_GENIUM_C_EXPORT void namerules_NameRules_ExampleStruct_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef namerules_NameRules_ExampleStruct_create_optional_handle(double iValue, _baseRef iIntValue);
_GENIUM_C_EXPORT _baseRef namerules_NameRules_ExampleStruct_unwrap_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT void namerules_NameRules_ExampleStruct_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT double namerules_NameRules_ExampleStruct_iValue_get(_baseRef handle);
_GENIUM_C_EXPORT _baseRef namerules_NameRules_ExampleStruct_iIntValue_get(_baseRef handle);
_GENIUM_C_EXPORT void namerules_NameRules_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef namerules_NameRules_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef namerules_NameRules_create();
_GENIUM_C_EXPORT namerules_NameRules_someMethod_result namerules_NameRules_someMethod(_baseRef _instance, _baseRef someArgument);
_GENIUM_C_EXPORT uint32_t namerules_NameRules_intAttribute_get(_baseRef _instance);
_GENIUM_C_EXPORT void namerules_NameRules_intAttribute_set(_baseRef _instance, uint32_t newValue);
_GENIUM_C_EXPORT bool namerules_NameRules_booleanAttribute_get(_baseRef _instance);
_GENIUM_C_EXPORT void namerules_NameRules_booleanAttribute_set(_baseRef _instance, bool newValue);
_GENIUM_C_EXPORT _baseRef namerules_NameRules_structAttribute_get(_baseRef _instance);
_GENIUM_C_EXPORT void namerules_NameRules_structAttribute_set(_baseRef _instance, _baseRef newValue);
#ifdef __cplusplus
}
#endif