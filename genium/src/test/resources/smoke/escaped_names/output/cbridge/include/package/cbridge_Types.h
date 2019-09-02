//
//

#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdint.h>
typedef uint32_t package_Types_Enum;
_GENIUM_C_EXPORT _baseRef package_Types_Struct_create_handle(package_Types_Enum null);
_GENIUM_C_EXPORT void package_Types_Struct_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef package_Types_Struct_create_optional_handle(package_Types_Enum null);
_GENIUM_C_EXPORT _baseRef package_Types_Struct_unwrap_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT void package_Types_Struct_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT package_Types_Enum package_Types_Struct_null_get(_baseRef handle);
#ifdef __cplusplus
}
#endif
