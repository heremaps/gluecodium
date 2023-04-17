//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipTypesTags_create_handle();
_GLUECODIUM_C_EXPORT void smoke_SkipTypesTags_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipTypesTags_create_optional_handle();
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipTypesTags_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SkipTypesTags_release_optional_handle(_baseRef handle);
#ifdef __cplusplus
}
#endif
