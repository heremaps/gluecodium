//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT _baseRef smoke_DurationMilliseconds_DurationStruct_create_handle(double durationField);
_GLUECODIUM_C_EXPORT void smoke_DurationMilliseconds_DurationStruct_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_DurationMilliseconds_DurationStruct_create_optional_handle(double durationField);
_GLUECODIUM_C_EXPORT _baseRef smoke_DurationMilliseconds_DurationStruct_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_DurationMilliseconds_DurationStruct_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT double smoke_DurationMilliseconds_DurationStruct_durationField_get(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_DurationMilliseconds_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_DurationMilliseconds_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_DurationMilliseconds_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_DurationMilliseconds_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_DurationMilliseconds_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT double smoke_DurationMilliseconds_durationFunction(_baseRef _instance, double input);
_GLUECODIUM_C_EXPORT _baseRef smoke_DurationMilliseconds_nullableDurationFunction(_baseRef _instance, _baseRef input);
_GLUECODIUM_C_EXPORT double smoke_DurationMilliseconds_durationProperty_get(_baseRef _instance);
_GLUECODIUM_C_EXPORT void smoke_DurationMilliseconds_durationProperty_set(_baseRef _instance, double value);
#ifdef __cplusplus
}
#endif
