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
typedef uint32_t smoke_VeryExternalInterface_SomeEnum;
_baseRef smoke_VeryExternalInterface_SomeStruct_create_handle(_baseRef someField);
void smoke_VeryExternalInterface_SomeStruct_release_handle(_baseRef handle);
_baseRef smoke_VeryExternalInterface_SomeStruct_make_optional_handle(_baseRef handle);
_baseRef smoke_VeryExternalInterface_SomeStruct_unwrap_optional_handle(_baseRef handle);
void smoke_VeryExternalInterface_SomeStruct_release_optional_handle(_baseRef handle);
_baseRef smoke_VeryExternalInterface_SomeStruct_someField_get(_baseRef handle);
void smoke_VeryExternalInterface_release_handle(_baseRef handle);
_baseRef smoke_VeryExternalInterface_copy_handle(_baseRef handle);
void smoke_VeryExternalInterface_someMethod(_baseRef _instance, int8_t some_Parameter);
_baseRef smoke_VeryExternalInterface_someAttribute_get(_baseRef _instance);
void smoke_VeryExternalInterface_someAttribute_set(_baseRef _instance, _baseRef newValue);
#ifdef __cplusplus
}
#endif