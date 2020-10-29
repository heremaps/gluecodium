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
_GLUECODIUM_C_EXPORT _baseRef smoke_MethodOverloads_Point_create_handle(double x, double y);
_GLUECODIUM_C_EXPORT void smoke_MethodOverloads_Point_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_MethodOverloads_Point_create_optional_handle(double x, double y);
_GLUECODIUM_C_EXPORT _baseRef smoke_MethodOverloads_Point_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_MethodOverloads_Point_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT double smoke_MethodOverloads_Point_x_get(_baseRef handle);
_GLUECODIUM_C_EXPORT double smoke_MethodOverloads_Point_y_get(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_MethodOverloads_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_MethodOverloads_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_MethodOverloads_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_MethodOverloads_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_MethodOverloads_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT bool smoke_MethodOverloads_isBoolean_Boolean(_baseRef _instance, bool input);
_GLUECODIUM_C_EXPORT bool smoke_MethodOverloads_isBoolean_Byte(_baseRef _instance, int8_t input);
_GLUECODIUM_C_EXPORT bool smoke_MethodOverloads_isBoolean_String(_baseRef _instance, _baseRef input);
_GLUECODIUM_C_EXPORT bool smoke_MethodOverloads_isBoolean_Point(_baseRef _instance, _baseRef input);
_GLUECODIUM_C_EXPORT bool smoke_MethodOverloads_isBoolean_Boolean_Byte_String_Point(_baseRef _instance, bool input1, int8_t input2, _baseRef input3, _baseRef input4);
_GLUECODIUM_C_EXPORT bool smoke_MethodOverloads_isBoolean__3String_4(_baseRef _instance, _baseRef input);
_GLUECODIUM_C_EXPORT bool smoke_MethodOverloads_isBoolean__3Byte_4(_baseRef _instance, _baseRef input);
_GLUECODIUM_C_EXPORT bool smoke_MethodOverloads_isBoolean_(_baseRef _instance);
_GLUECODIUM_C_EXPORT bool smoke_MethodOverloads_isFloat_String(_baseRef _instance, _baseRef input);
_GLUECODIUM_C_EXPORT bool smoke_MethodOverloads_isFloat__3Byte_4(_baseRef _instance, _baseRef input);
#ifdef __cplusplus
}
#endif
