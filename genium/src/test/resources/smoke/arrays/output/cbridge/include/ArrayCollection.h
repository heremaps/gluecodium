//
//
// Automatically generated. Do not modify. Your changes will be lost.

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_Arrays.h"
#include <stdint.h>

_baseRef arrayCollection_SomeEnum_create_handle();
void arrayCollection_SomeEnum_release_handle(_baseRef handle);
uint64_t arrayCollection_SomeEnum_count(_baseRef handle);
smoke_Arrays_SomeEnum arrayCollection_SomeEnum_get(_baseRef handle, uint64_t index);
void arrayCollection_SomeEnum_append(_baseRef handle, smoke_Arrays_SomeEnum item);
_baseRef arrayCollection_FancyStruct_create_handle();
void arrayCollection_FancyStruct_release_handle(_baseRef handle);
uint64_t arrayCollection_FancyStruct_count(_baseRef handle);
_baseRef arrayCollection_FancyStruct_get(_baseRef handle, uint64_t index);
void arrayCollection_FancyStruct_append(_baseRef handle, _baseRef item);
_baseRef arrayCollection_UInt8Array_create_handle();
void arrayCollection_UInt8Array_release_handle(_baseRef handle);
uint64_t arrayCollection_UInt8Array_count(_baseRef handle);
_baseRef arrayCollection_UInt8Array_get(_baseRef handle, uint64_t index);
void arrayCollection_UInt8Array_append(_baseRef handle, _baseRef item);
_baseRef arrayCollection_Int32StringMap_create_handle();
void arrayCollection_Int32StringMap_release_handle(_baseRef handle);
uint64_t arrayCollection_Int32StringMap_count(_baseRef handle);
_baseRef arrayCollection_Int32StringMap_get(_baseRef handle, uint64_t index);
void arrayCollection_Int32StringMap_append(_baseRef handle, _baseRef item);
_baseRef arrayCollection_BasicStruct_create_handle();
void arrayCollection_BasicStruct_release_handle(_baseRef handle);
uint64_t arrayCollection_BasicStruct_count(_baseRef handle);
_baseRef arrayCollection_BasicStruct_get(_baseRef handle, uint64_t index);
void arrayCollection_BasicStruct_append(_baseRef handle, _baseRef item);
_baseRef arrayCollection_String_create_handle();
void arrayCollection_String_release_handle(_baseRef handle);
uint64_t arrayCollection_String_count(_baseRef handle);
_baseRef arrayCollection_String_get(_baseRef handle, uint64_t index);
void arrayCollection_String_append(_baseRef handle, const char* item);
_baseRef arrayCollection_StringArray_create_handle();
void arrayCollection_StringArray_release_handle(_baseRef handle);
uint64_t arrayCollection_StringArray_count(_baseRef handle);
_baseRef arrayCollection_StringArray_get(_baseRef handle, uint64_t index);
void arrayCollection_StringArray_append(_baseRef handle, _baseRef item);
_baseRef arrayCollection_UInt8_create_handle();
void arrayCollection_UInt8_release_handle(_baseRef handle);
uint64_t arrayCollection_UInt8_count(_baseRef handle);
uint8_t arrayCollection_UInt8_get(_baseRef handle, uint64_t index);
void arrayCollection_UInt8_append(_baseRef handle, uint8_t item);

#ifdef __cplusplus
}
#endif
