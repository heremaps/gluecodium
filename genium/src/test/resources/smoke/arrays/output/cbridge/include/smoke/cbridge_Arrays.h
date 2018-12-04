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
typedef uint32_t smoke_Arrays_SomeEnum;
typedef uint32_t smoke_Arrays_ExternalEnum;
_baseRef smoke_Arrays_BasicStruct_create_handle(double value);
void smoke_Arrays_BasicStruct_release_handle(_baseRef handle);
double smoke_Arrays_BasicStruct_value_get(_baseRef handle);
_baseRef smoke_Arrays_ExternalStruct_create_handle(const char* string);
void smoke_Arrays_ExternalStruct_release_handle(_baseRef handle);
_baseRef smoke_Arrays_ExternalStruct_string_get(_baseRef handle);
_baseRef smoke_Arrays_FancyStruct_create_handle(_baseRef messages, _baseRef numbers, _baseRef image);
void smoke_Arrays_FancyStruct_release_handle(_baseRef handle);
_baseRef smoke_Arrays_FancyStruct_messages_get(_baseRef handle);
_baseRef smoke_Arrays_FancyStruct_numbers_get(_baseRef handle);
_baseRef smoke_Arrays_FancyStruct_image_get(_baseRef handle);
void smoke_Arrays_release_handle(_baseRef handle);
_baseRef smoke_Arrays_copy_handle(_baseRef handle);
_baseRef smoke_Arrays_methodWithArray(_baseRef input);
_baseRef smoke_Arrays_methodWithArrayInline(_baseRef input);
_baseRef smoke_Arrays_methodWithStructArray(_baseRef input);
_baseRef smoke_Arrays_methodWithExternalStructArray(_baseRef input);
_baseRef smoke_Arrays_methodWithArrayOfArrays(_baseRef input);
_baseRef smoke_Arrays_mergeArraysOfStructsWithArrays(_baseRef inlineFancyArray, _baseRef fancyArray);
_baseRef smoke_Arrays_methodWithArrayOfAliases(_baseRef input);
_baseRef smoke_Arrays_methodWithArrayOfMaps(_baseRef input);
_baseRef smoke_Arrays_methodWithByteBuffer(_baseRef input);
_baseRef smoke_Arrays_methodWithEnumArray(_baseRef input);
_baseRef smoke_Arrays_methodWithExternalEnumArray(_baseRef input);
_baseRef smoke_Arrays_ErrorCodeToMessageMap_create_handle();
void smoke_Arrays_ErrorCodeToMessageMap_release_handle(_baseRef handle);
_baseRef smoke_Arrays_ErrorCodeToMessageMap_iterator(_baseRef handle);
void smoke_Arrays_ErrorCodeToMessageMap_iterator_release_handle(_baseRef iterator_handle);
void smoke_Arrays_ErrorCodeToMessageMap_put(_baseRef handle, int32_t key, _baseRef value);
bool smoke_Arrays_ErrorCodeToMessageMap_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
void smoke_Arrays_ErrorCodeToMessageMap_iterator_increment(_baseRef iterator_handle);
int32_t smoke_Arrays_ErrorCodeToMessageMap_iterator_key(_baseRef iterator_handle);
_baseRef smoke_Arrays_ErrorCodeToMessageMap_iterator_value(_baseRef iterator_handle);
#ifdef __cplusplus
}
#endif
