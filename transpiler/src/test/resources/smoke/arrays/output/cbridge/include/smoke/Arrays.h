//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include "cbridge/include/BaseHandle.h"

_baseRef smoke_Arrays_BasicStruct_create();
void smoke_Arrays_BasicStruct_release(_baseRef handle);
double smoke_Arrays_BasicStruct_value_get(_baseRef handle);
void smoke_Arrays_BasicStruct_value_set(_baseRef handle, double value);
_baseRef smoke_Arrays_FancyStruct_create();
void smoke_Arrays_FancyStruct_release(_baseRef handle);
_baseRef smoke_Arrays_FancyStruct_messages_get(_baseRef handle);
void smoke_Arrays_FancyStruct_messages_set(_baseRef handle, _baseRef messages);
_baseRef smoke_Arrays_FancyStruct_numbers_get(_baseRef handle);
void smoke_Arrays_FancyStruct_numbers_set(_baseRef handle, _baseRef numbers);
void smoke_Arrays_release(_baseRef handle);
_baseRef smoke_Arrays_methodWithArray(_baseRef input);
_baseRef smoke_Arrays_methodWithArrayInline(_baseRef input);
_baseRef smoke_Arrays_methodWithStructArray(_baseRef input);
_baseRef smoke_Arrays_methodWithArrayOfArrays(_baseRef input);
_baseRef smoke_Arrays_mergeArraysOfStructsWithArrays(_baseRef inlineFancyArray, _baseRef fancyArray);
_baseRef smoke_Arrays_methodWithArrayOfAliases(_baseRef input);

#ifdef __cplusplus
}
#endif