//
//
// Automatically generated. Do not modify. Your changes will be lost.

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/StringHandle.h"
#include <stdint.h>
#include <stdbool.h>

_baseRef smoke_Maps_SomeStruct_create();
void smoke_Maps_SomeStruct_release(_baseRef handle);
_baseRef smoke_Maps_SomeStruct_value_get(_baseRef handle);
void smoke_Maps_SomeStruct_value_set(_baseRef handle, const char* value);
_baseRef smoke_Maps_StructWithMap_create();
void smoke_Maps_StructWithMap_release(_baseRef handle);
_baseRef smoke_Maps_StructWithMap_errorMapping_get(_baseRef handle);
void smoke_Maps_StructWithMap_errorMapping_set(_baseRef handle, _baseRef errorMapping);
void smoke_Maps_release(_baseRef handle);

_baseRef smoke_Maps_methodWithMap(_baseRef input);
_baseRef smoke_Maps_methodWithMapToStruct(_baseRef input);
_baseRef smoke_Maps_methodWithNestedMap(_baseRef input);
_baseRef smoke_Maps_methodWithStructWithMap(_baseRef input);
_baseRef smoke_Maps_methodWithMapOfArrays(_baseRef input);

_baseRef smoke_Maps_ErrorCodeToMessageMap_create();
void smoke_Maps_ErrorCodeToMessageMap_release(_baseRef handle);
_baseRef smoke_Maps_ErrorCodeToMessageMap_iterator(_baseRef handle);
void smoke_Maps_ErrorCodeToMessageMap_iterator_release(_baseRef iterator_handle);
void smoke_Maps_ErrorCodeToMessageMap_put(_baseRef handle, int32_t key, _baseRef value);
bool smoke_Maps_ErrorCodeToMessageMap_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
void smoke_Maps_ErrorCodeToMessageMap_iterator_increment(_baseRef iterator_handle);
int32_t smoke_Maps_ErrorCodeToMessageMap_iterator_key(_baseRef iterator_handle);
_baseRef smoke_Maps_ErrorCodeToMessageMap_iterator_value(_baseRef iterator_handle);
_baseRef smoke_Maps_NumberToStruct_create();
void smoke_Maps_NumberToStruct_release(_baseRef handle);
_baseRef smoke_Maps_NumberToStruct_iterator(_baseRef handle);
void smoke_Maps_NumberToStruct_iterator_release(_baseRef iterator_handle);
void smoke_Maps_NumberToStruct_put(_baseRef handle, uint8_t key, _baseRef value);
bool smoke_Maps_NumberToStruct_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
void smoke_Maps_NumberToStruct_iterator_increment(_baseRef iterator_handle);
uint8_t smoke_Maps_NumberToStruct_iterator_key(_baseRef iterator_handle);
_baseRef smoke_Maps_NumberToStruct_iterator_value(_baseRef iterator_handle);
_baseRef smoke_Maps_NestedMap_create();
void smoke_Maps_NestedMap_release(_baseRef handle);
_baseRef smoke_Maps_NestedMap_iterator(_baseRef handle);
void smoke_Maps_NestedMap_iterator_release(_baseRef iterator_handle);
void smoke_Maps_NestedMap_put(_baseRef handle, uint8_t key, _baseRef value);
bool smoke_Maps_NestedMap_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
void smoke_Maps_NestedMap_iterator_increment(_baseRef iterator_handle);
uint8_t smoke_Maps_NestedMap_iterator_key(_baseRef iterator_handle);
_baseRef smoke_Maps_NestedMap_iterator_value(_baseRef iterator_handle);
_baseRef smoke_Maps_NumberToTypeDef_create();
void smoke_Maps_NumberToTypeDef_release(_baseRef handle);
_baseRef smoke_Maps_NumberToTypeDef_iterator(_baseRef handle);
void smoke_Maps_NumberToTypeDef_iterator_release(_baseRef iterator_handle);
void smoke_Maps_NumberToTypeDef_put(_baseRef handle, uint8_t key, _baseRef value);
bool smoke_Maps_NumberToTypeDef_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
void smoke_Maps_NumberToTypeDef_iterator_increment(_baseRef iterator_handle);
uint8_t smoke_Maps_NumberToTypeDef_iterator_key(_baseRef iterator_handle);
_baseRef smoke_Maps_NumberToTypeDef_iterator_value(_baseRef iterator_handle);
_baseRef smoke_Maps_TypeDefToNumber_create();
void smoke_Maps_TypeDefToNumber_release(_baseRef handle);
_baseRef smoke_Maps_TypeDefToNumber_iterator(_baseRef handle);
void smoke_Maps_TypeDefToNumber_iterator_release(_baseRef iterator_handle);
void smoke_Maps_TypeDefToNumber_put(_baseRef handle, _baseRef key, uint8_t value);
bool smoke_Maps_TypeDefToNumber_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
void smoke_Maps_TypeDefToNumber_iterator_increment(_baseRef iterator_handle);
_baseRef smoke_Maps_TypeDefToNumber_iterator_key(_baseRef iterator_handle);
uint8_t smoke_Maps_TypeDefToNumber_iterator_value(_baseRef iterator_handle);
_baseRef smoke_Maps_StringToArray_create();
void smoke_Maps_StringToArray_release(_baseRef handle);
_baseRef smoke_Maps_StringToArray_iterator(_baseRef handle);
void smoke_Maps_StringToArray_iterator_release(_baseRef iterator_handle);
void smoke_Maps_StringToArray_put(_baseRef handle, _baseRef key, _baseRef value);
bool smoke_Maps_StringToArray_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
void smoke_Maps_StringToArray_iterator_increment(_baseRef iterator_handle);
_baseRef smoke_Maps_StringToArray_iterator_key(_baseRef iterator_handle);
_baseRef smoke_Maps_StringToArray_iterator_value(_baseRef iterator_handle);

#ifdef __cplusplus
}
#endif
