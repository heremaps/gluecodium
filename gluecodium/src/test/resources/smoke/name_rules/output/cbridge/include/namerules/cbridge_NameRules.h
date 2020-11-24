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
typedef uint32_t namerules_NameRules_ExampleErrorCode;
typedef struct {
    bool has_value;
    union {
        namerules_NameRules_ExampleErrorCode error_value;
        double returned_value;
    };
} namerules_NameRules_someMethod_result;
_GLUECODIUM_C_EXPORT _baseRef namerules_NameRules_ExampleStruct_create_handle(double iValue, _baseRef iIntValue);
_GLUECODIUM_C_EXPORT void namerules_NameRules_ExampleStruct_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef namerules_NameRules_ExampleStruct_create_optional_handle(double iValue, _baseRef iIntValue);
_GLUECODIUM_C_EXPORT _baseRef namerules_NameRules_ExampleStruct_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void namerules_NameRules_ExampleStruct_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT double namerules_NameRules_ExampleStruct_iValue_get(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef namerules_NameRules_ExampleStruct_iIntValue_get(_baseRef handle);
_GLUECODIUM_C_EXPORT void namerules_NameRules_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef namerules_NameRules_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* namerules_NameRules_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void namerules_NameRules_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void namerules_NameRules_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef namerules_NameRules_create();
_GLUECODIUM_C_EXPORT namerules_NameRules_someMethod_result namerules_NameRules_someMethod(_baseRef _instance, _baseRef someArgument);
_GLUECODIUM_C_EXPORT uint32_t namerules_NameRules_intProperty_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void namerules_NameRules_intProperty_set(_baseRef _instance, uint32_t value);
_GLUECODIUM_C_EXPORT bool namerules_NameRules_booleanProperty_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void namerules_NameRules_booleanProperty_set(_baseRef _instance, bool value);
_GLUECODIUM_C_EXPORT _baseRef namerules_NameRules_structProperty_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void namerules_NameRules_structProperty_set(_baseRef _instance, _baseRef value);
#ifdef __cplusplus
}
#endif
