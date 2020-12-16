//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdint.h>
_GLUECODIUM_C_EXPORT _baseRef ArrayOf__Double_create_handle();
_GLUECODIUM_C_EXPORT _baseRef ArrayOf__Double_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void ArrayOf__Double_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT uint64_t ArrayOf__Double_count(_baseRef handle);
_GLUECODIUM_C_EXPORT double ArrayOf__Double_get(_baseRef handle, uint64_t index);
_GLUECODIUM_C_EXPORT void ArrayOf__Double_append(_baseRef handle, double item);
_GLUECODIUM_C_EXPORT _baseRef ArrayOf__Double_create_optional_handle();
_GLUECODIUM_C_EXPORT void ArrayOf__Double_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef ArrayOf__Double_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef ArrayOf_smoke_TypeDefs_TestStruct_create_handle();
_GLUECODIUM_C_EXPORT _baseRef ArrayOf_smoke_TypeDefs_TestStruct_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void ArrayOf_smoke_TypeDefs_TestStruct_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT uint64_t ArrayOf_smoke_TypeDefs_TestStruct_count(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef ArrayOf_smoke_TypeDefs_TestStruct_get(_baseRef handle, uint64_t index);
_GLUECODIUM_C_EXPORT void ArrayOf_smoke_TypeDefs_TestStruct_append(_baseRef handle, _baseRef item);
_GLUECODIUM_C_EXPORT _baseRef ArrayOf_smoke_TypeDefs_TestStruct_create_optional_handle();
_GLUECODIUM_C_EXPORT void ArrayOf_smoke_TypeDefs_TestStruct_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef ArrayOf_smoke_TypeDefs_TestStruct_unwrap_optional_handle(_baseRef handle);
#ifdef __cplusplus
}
#endif
