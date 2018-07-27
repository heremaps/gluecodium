//
//
// Automatically generated. Do not modify. Your changes will be lost.

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/Arrays.h"
#include <stdint.h>

_baseRef arrayCollection_Enums_create();
void arrayCollection_Enums_release(_baseRef handle);
uint64_t arrayCollection_Enums_count(_baseRef handle);
smoke_Arrays_SomeEnum arrayCollection_Enums_get(_baseRef handle, uint64_t index);
void arrayCollection_Enums_append(_baseRef handle, smoke_Arrays_SomeEnum item);
_baseRef arrayCollection_FancyStruct_create();
void arrayCollection_FancyStruct_release(_baseRef handle);
uint64_t arrayCollection_FancyStruct_count(_baseRef handle);
_baseRef arrayCollection_FancyStruct_get(_baseRef handle, uint64_t index);
void arrayCollection_FancyStruct_append(_baseRef handle, _baseRef item);
_baseRef arrayCollection_UInt8Array_create();
void arrayCollection_UInt8Array_release(_baseRef handle);
uint64_t arrayCollection_UInt8Array_count(_baseRef handle);
_baseRef arrayCollection_UInt8Array_get(_baseRef handle, uint64_t index);
void arrayCollection_UInt8Array_append(_baseRef handle, _baseRef item);
_baseRef arrayCollection_Int32StringMap_create();
void arrayCollection_Int32StringMap_release(_baseRef handle);
uint64_t arrayCollection_Int32StringMap_count(_baseRef handle);
_baseRef arrayCollection_Int32StringMap_get(_baseRef handle, uint64_t index);
void arrayCollection_Int32StringMap_append(_baseRef handle, _baseRef item);
_baseRef arrayCollection_BasicStruct_create();
void arrayCollection_BasicStruct_release(_baseRef handle);
uint64_t arrayCollection_BasicStruct_count(_baseRef handle);
_baseRef arrayCollection_BasicStruct_get(_baseRef handle, uint64_t index);
void arrayCollection_BasicStruct_append(_baseRef handle, _baseRef item);
_baseRef arrayCollection_String_create();
void arrayCollection_String_release(_baseRef handle);
uint64_t arrayCollection_String_count(_baseRef handle);
_baseRef arrayCollection_String_get(_baseRef handle, uint64_t index);
void arrayCollection_String_append(_baseRef handle, const char* item);
_baseRef arrayCollection_StringArray_create();
void arrayCollection_StringArray_release(_baseRef handle);
uint64_t arrayCollection_StringArray_count(_baseRef handle);
_baseRef arrayCollection_StringArray_get(_baseRef handle, uint64_t index);
void arrayCollection_StringArray_append(_baseRef handle, _baseRef item);
_baseRef arrayCollection_UInt8_create();
void arrayCollection_UInt8_release(_baseRef handle);
uint64_t arrayCollection_UInt8_count(_baseRef handle);
uint8_t arrayCollection_UInt8_get(_baseRef handle, uint64_t index);
void arrayCollection_UInt8_append(_baseRef handle, uint8_t item);

#ifdef __cplusplus
}
#endif
