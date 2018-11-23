//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/StringHandle.h"
#include <stdbool.h>
#include <stdint.h>
_baseRef smoke_MethodOverloads_Point_create_handle(double x, double y);
void smoke_MethodOverloads_Point_release_handle(_baseRef handle);
double smoke_MethodOverloads_Point_x_get(_baseRef handle);
double smoke_MethodOverloads_Point_y_get(_baseRef handle);
void smoke_MethodOverloads_release_handle(_baseRef handle);
_baseRef smoke_MethodOverloads_copy_handle(_baseRef handle);
bool smoke_MethodOverloads_isBoolean_boolOverload(_baseRef _instance, bool input);
bool smoke_MethodOverloads_isBoolean_intOverload(_baseRef _instance, int8_t input);
bool smoke_MethodOverloads_isBoolean_stringOverload(_baseRef _instance, const char* input);
bool smoke_MethodOverloads_isBoolean_structOverload(_baseRef _instance, _baseRef input);
bool smoke_MethodOverloads_isBoolean_everythingOverload(_baseRef _instance, bool input1, int8_t input2, const char* input3, _baseRef input4);
bool smoke_MethodOverloads_isBoolean_stringArrayOverload(_baseRef _instance, _baseRef input);
bool smoke_MethodOverloads_isBoolean_intArrayOverload(_baseRef _instance, _baseRef input);
bool smoke_MethodOverloads_isBoolean_constOverload(_baseRef _instance);
bool smoke_MethodOverloads_isFloat_stringOverload(_baseRef _instance, const char* input);
bool smoke_MethodOverloads_isFloat_intArrayOverload(_baseRef _instance, _baseRef input);
#ifdef __cplusplus
}
#endif
