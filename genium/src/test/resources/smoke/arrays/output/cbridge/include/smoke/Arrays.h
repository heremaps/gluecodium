//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/ByteArrayHandle.h"
#include "cbridge/include/StringHandle.h"
#include <stdint.h>
#include <stdbool.h>
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
_baseRef smoke_Arrays_FancyStruct_image_get(_baseRef handle);
void smoke_Arrays_FancyStruct_image_set(_baseRef handle, const uint8_t* image_ptr, int64_t image_size);
void smoke_Arrays_release(_baseRef handle);
_baseRef smoke_Arrays_methodWithArray(_baseRef input);
_baseRef smoke_Arrays_methodWithArrayInline(_baseRef input);
_baseRef smoke_Arrays_methodWithStructArray(_baseRef input);
_baseRef smoke_Arrays_methodWithArrayOfArrays(_baseRef input);
_baseRef smoke_Arrays_mergeArraysOfStructsWithArrays(_baseRef inlineFancyArray, _baseRef fancyArray);
_baseRef smoke_Arrays_methodWithArrayOfAliases(_baseRef input);
_baseRef smoke_Arrays_methodWithArrayOfMaps(_baseRef input);
_baseRef smoke_Arrays_methodWithByteBuffer(const uint8_t* input_ptr, int64_t input_size);
_baseRef smoke_Arrays_ErrorCodeToMessageMap_create();
void smoke_Arrays_ErrorCodeToMessageMap_release(_baseRef handle);
_baseRef smoke_Arrays_ErrorCodeToMessageMap_iterator(_baseRef handle);
void smoke_Arrays_ErrorCodeToMessageMap_iterator_release(_baseRef iterator_handle);
void smoke_Arrays_ErrorCodeToMessageMap_put(_baseRef handle, int32_t key, _baseRef value);
bool smoke_Arrays_ErrorCodeToMessageMap_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
void smoke_Arrays_ErrorCodeToMessageMap_iterator_increment(_baseRef iterator_handle);
int32_t smoke_Arrays_ErrorCodeToMessageMap_iterator_key(_baseRef iterator_handle);
_baseRef smoke_Arrays_ErrorCodeToMessageMap_iterator_value(_baseRef iterator_handle);
#ifdef __cplusplus
}
#endif
