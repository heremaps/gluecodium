//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/StringHandle.h"
#include <stdbool.h>
#include <stdint.h>
_GLUECODIUM_C_EXPORT void smoke_BasicTypes_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_BasicTypes_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_BasicTypes_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_BasicTypes_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_BasicTypes_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_BasicTypes_stringFunction(_baseRef input);
_GLUECODIUM_C_EXPORT bool smoke_BasicTypes_boolFunction(bool input);
_GLUECODIUM_C_EXPORT float smoke_BasicTypes_floatFunction(float input);
_GLUECODIUM_C_EXPORT double smoke_BasicTypes_doubleFunction(double input);
_GLUECODIUM_C_EXPORT int8_t smoke_BasicTypes_byteFunction(int8_t input);
_GLUECODIUM_C_EXPORT int16_t smoke_BasicTypes_shortFunction(int16_t input);
_GLUECODIUM_C_EXPORT int32_t smoke_BasicTypes_intFunction(int32_t input);
_GLUECODIUM_C_EXPORT int64_t smoke_BasicTypes_longFunction(int64_t input);
_GLUECODIUM_C_EXPORT uint8_t smoke_BasicTypes_ubyteFunction(uint8_t input);
_GLUECODIUM_C_EXPORT uint16_t smoke_BasicTypes_ushortFunction(uint16_t input);
_GLUECODIUM_C_EXPORT uint32_t smoke_BasicTypes_uintFunction(uint32_t input);
_GLUECODIUM_C_EXPORT uint64_t smoke_BasicTypes_ulongFunction(uint64_t input);
#ifdef __cplusplus
}
#endif
