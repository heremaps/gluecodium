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
typedef uint32_t smoke_ExternalInterface_SomeEnum;
_baseRef smoke_ExternalInterface_SomeStruct_create_handle(_baseRef someField);
void smoke_ExternalInterface_SomeStruct_release_handle(_baseRef handle);
_baseRef smoke_ExternalInterface_SomeStruct_make_optional_handle(_baseRef handle);
_baseRef smoke_ExternalInterface_SomeStruct_unwrap_optional_handle(_baseRef handle);
void smoke_ExternalInterface_SomeStruct_release_optional_handle(_baseRef handle);
_baseRef smoke_ExternalInterface_SomeStruct_someField_get(_baseRef handle);
void smoke_ExternalInterface_release_handle(_baseRef handle);
_baseRef smoke_ExternalInterface_copy_handle(_baseRef handle);
void smoke_ExternalInterface_someMethod(_baseRef _instance, int8_t some_Parameter);
_baseRef smoke_ExternalInterface_someAttribute_get(_baseRef _instance);
#ifdef __cplusplus
}
#endif