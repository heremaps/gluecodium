//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif

#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/StringHandle.h"
#include <stdbool.h>
#include <stdint.h>

_baseRef smoke_MethodOverloads_Point_create();
void smoke_MethodOverloads_Point_release(_baseRef handle);
double smoke_MethodOverloads_Point_x_get(_baseRef handle);
void smoke_MethodOverloads_Point_x_set(_baseRef handle, double x);
double smoke_MethodOverloads_Point_y_get(_baseRef handle);
void smoke_MethodOverloads_Point_y_set(_baseRef handle, double y);
void smoke_MethodOverloads_release(_baseRef handle);
_baseRef smoke_MethodOverloads_copy(_baseRef handle);
bool smoke_MethodOverloads_isBoolean_boolOverload(_baseRef _instance, bool input);
bool smoke_MethodOverloads_isBoolean_intOverload(_baseRef _instance, int8_t input);
bool smoke_MethodOverloads_isBoolean_stringOverload(_baseRef _instance, const char* input);
bool smoke_MethodOverloads_isBoolean_structOverload(_baseRef _instance, _baseRef input);
bool smoke_MethodOverloads_isBoolean_everythingOverload(_baseRef _instance, bool input1, int8_t input2, const char* input3, _baseRef input4);
bool smoke_MethodOverloads_isBoolean_stringArrayOverload(_baseRef _instance, _baseRef input);
bool smoke_MethodOverloads_isBoolean_intArrayOverload(_baseRef _instance, _baseRef input);
bool smoke_MethodOverloads_isBoolean_constOverload(_baseRef _instance);

#ifdef __cplusplus
}
#endif
