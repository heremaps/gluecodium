//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/package/cbridge_Types.h"
#include <stdbool.h>
typedef struct {
    bool has_value;
    union {
        package_Types_Enum error_value;
        _baseRef returned_value;
    };
} package_Class_fun_result;
_GLUECODIUM_C_EXPORT void package_Class_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef package_Class_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* package_Class_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void package_Class_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void package_Class_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* package_Class_get_typed(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef package_Class_constructor();
_GLUECODIUM_C_EXPORT package_Class_fun_result package_Class_fun(_baseRef _instance, _baseRef double);
_GLUECODIUM_C_EXPORT package_Types_Enum package_Class_property_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void package_Class_property_set(_baseRef _instance, package_Types_Enum value);
#ifdef __cplusplus
}
#endif
