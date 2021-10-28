//
//

#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdint.h>
_GLUECODIUM_C_EXPORT _baseRef package_Types_Struct_create_handle(uint32_t null);
_GLUECODIUM_C_EXPORT void package_Types_Struct_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef package_Types_Struct_create_optional_handle(uint32_t null);
_GLUECODIUM_C_EXPORT _baseRef package_Types_Struct_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void package_Types_Struct_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT uint32_t package_Types_Struct_null_get(_baseRef handle);
#ifdef __cplusplus
}
#endif
