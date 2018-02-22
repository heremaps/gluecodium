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
_baseRef arrayCollection_FancyStruct_create();
void arrayCollection_FancyStruct_release(_baseRef handle);
uint64_t arrayCollection_FancyStruct_count(_baseRef handle);
_baseRef arrayCollection_FancyStruct_get(_baseRef handle, uint64_t index);
void arrayCollection_FancyStruct_append(_baseRef handle, _baseRef item);
_baseRef arrayCollection_UInt8_create();
void arrayCollection_UInt8_release(_baseRef handle);
uint64_t arrayCollection_UInt8_count(_baseRef handle);
uint8_t arrayCollection_UInt8_get(_baseRef handle, uint64_t index);
void arrayCollection_UInt8_append(_baseRef handle, uint8_t item);
_baseRef arrayCollection_UInt8Array_create();
void arrayCollection_UInt8Array_release(_baseRef handle);
uint64_t arrayCollection_UInt8Array_count(_baseRef handle);
_baseRef arrayCollection_UInt8Array_get(_baseRef handle, uint64_t index);
void arrayCollection_UInt8Array_append(_baseRef handle, _baseRef item);

#ifdef __cplusplus
}
#endif