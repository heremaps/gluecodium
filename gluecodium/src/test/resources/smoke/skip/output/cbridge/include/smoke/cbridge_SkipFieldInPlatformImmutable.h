//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdbool.h>
#include <stdint.h>
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipFieldInPlatformImmutable_create_handle(int32_t intField, bool boolField);
_GLUECODIUM_C_EXPORT void smoke_SkipFieldInPlatformImmutable_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipFieldInPlatformImmutable_create_optional_handle(int32_t intField, bool boolField);
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipFieldInPlatformImmutable_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SkipFieldInPlatformImmutable_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT int32_t smoke_SkipFieldInPlatformImmutable_intField_get(_baseRef handle);
_GLUECODIUM_C_EXPORT bool smoke_SkipFieldInPlatformImmutable_boolField_get(_baseRef handle);
#ifdef __cplusplus
}
#endif
