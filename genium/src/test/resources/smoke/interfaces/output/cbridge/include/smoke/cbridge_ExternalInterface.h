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
typedef uint32_t smoke_ExternalInterface_SomeEnum;
_GENIUM_C_EXPORT _baseRef smoke_ExternalInterface_SomeStruct_create_handle(_baseRef someField);
_GENIUM_C_EXPORT void smoke_ExternalInterface_SomeStruct_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_ExternalInterface_SomeStruct_create_optional_handle(_baseRef someField);
_GENIUM_C_EXPORT _baseRef smoke_ExternalInterface_SomeStruct_unwrap_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT void smoke_ExternalInterface_SomeStruct_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_ExternalInterface_SomeStruct_someField_get(_baseRef handle);
_GENIUM_C_EXPORT void smoke_ExternalInterface_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_ExternalInterface_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT void smoke_ExternalInterface_someMethod(_baseRef _instance, int8_t someParameter);
_GENIUM_C_EXPORT _baseRef smoke_ExternalInterface_someAttribute_get(_baseRef _instance);
#ifdef __cplusplus
}
#endif
