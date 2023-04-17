//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdint.h>
_GLUECODIUM_C_EXPORT _baseRef smoke_bazTypes_create_handle();
_GLUECODIUM_C_EXPORT void smoke_bazTypes_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_bazTypes_create_optional_handle();
_GLUECODIUM_C_EXPORT _baseRef smoke_bazTypes_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_bazTypes_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_bazTypes_bazStruct_create_handle(_baseRef BAZ_FIELD);
_GLUECODIUM_C_EXPORT void smoke_bazTypes_bazStruct_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_bazTypes_bazStruct_create_optional_handle(_baseRef BAZ_FIELD);
_GLUECODIUM_C_EXPORT _baseRef smoke_bazTypes_bazStruct_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_bazTypes_bazStruct_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_bazTypes_bazStruct_BAZ_FIELD_get(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_bazTypes_bazStruct_BazCreate(_baseRef BazParameter);
#ifdef __cplusplus
}
#endif
