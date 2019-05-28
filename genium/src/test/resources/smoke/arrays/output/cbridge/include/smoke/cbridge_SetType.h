//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/StringHandle.h"
#include <stdint.h>
typedef uint32_t smoke_SetType_SomeEnum;
_GENIUM_C_EXPORT void smoke_SetType_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_SetType_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_SetType_stringSetRoundTrip(_baseRef input);
_GENIUM_C_EXPORT _baseRef smoke_SetType_enumSetRoundTrip(_baseRef input);
_GENIUM_C_EXPORT _baseRef smoke_SetType_nullableIntSetRoundTrip(_baseRef input);
_GENIUM_C_EXPORT _baseRef smoke_SetType_IntSet_create_handle();
_GENIUM_C_EXPORT void smoke_SetType_IntSet_release_handle(_baseRef handle);
_GENIUM_C_EXPORT void smoke_SetType_IntSet_insert(_baseRef handle, int32_t value);
_GENIUM_C_EXPORT _baseRef smoke_SetType_IntSet_iterator(_baseRef handle);
_GENIUM_C_EXPORT void smoke_SetType_IntSet_iterator_release_handle(_baseRef iterator_handle);
_GENIUM_C_EXPORT bool smoke_SetType_IntSet_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
_GENIUM_C_EXPORT void smoke_SetType_IntSet_iterator_increment(_baseRef iterator_handle);
_GENIUM_C_EXPORT int32_t smoke_SetType_IntSet_iterator_get(_baseRef iterator_handle);
_GENIUM_C_EXPORT _baseRef smoke_SetType_IntSet_create_optional_handle();
_GENIUM_C_EXPORT void smoke_SetType_IntSet_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_SetType_IntSet_unwrap_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_SetType_StringSet_create_handle();
_GENIUM_C_EXPORT void smoke_SetType_StringSet_release_handle(_baseRef handle);
_GENIUM_C_EXPORT void smoke_SetType_StringSet_insert(_baseRef handle, _baseRef value);
_GENIUM_C_EXPORT _baseRef smoke_SetType_StringSet_iterator(_baseRef handle);
_GENIUM_C_EXPORT void smoke_SetType_StringSet_iterator_release_handle(_baseRef iterator_handle);
_GENIUM_C_EXPORT bool smoke_SetType_StringSet_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
_GENIUM_C_EXPORT void smoke_SetType_StringSet_iterator_increment(_baseRef iterator_handle);
_GENIUM_C_EXPORT _baseRef smoke_SetType_StringSet_iterator_get(_baseRef iterator_handle);
_GENIUM_C_EXPORT _baseRef smoke_SetType_StringSet_create_optional_handle();
_GENIUM_C_EXPORT void smoke_SetType_StringSet_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_SetType_StringSet_unwrap_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_SetType_EnumSet_create_handle();
_GENIUM_C_EXPORT void smoke_SetType_EnumSet_release_handle(_baseRef handle);
_GENIUM_C_EXPORT void smoke_SetType_EnumSet_insert(_baseRef handle, smoke_SetType_SomeEnum value);
_GENIUM_C_EXPORT _baseRef smoke_SetType_EnumSet_iterator(_baseRef handle);
_GENIUM_C_EXPORT void smoke_SetType_EnumSet_iterator_release_handle(_baseRef iterator_handle);
_GENIUM_C_EXPORT bool smoke_SetType_EnumSet_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
_GENIUM_C_EXPORT void smoke_SetType_EnumSet_iterator_increment(_baseRef iterator_handle);
_GENIUM_C_EXPORT smoke_SetType_SomeEnum smoke_SetType_EnumSet_iterator_get(_baseRef iterator_handle);
_GENIUM_C_EXPORT _baseRef smoke_SetType_EnumSet_create_optional_handle();
_GENIUM_C_EXPORT void smoke_SetType_EnumSet_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_SetType_EnumSet_unwrap_optional_handle(_baseRef handle);
#ifdef __cplusplus
}
#endif
