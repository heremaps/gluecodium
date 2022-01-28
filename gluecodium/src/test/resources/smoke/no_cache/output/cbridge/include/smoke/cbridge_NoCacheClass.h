//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_NoCacheClass_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_NoCacheClass_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_NoCacheClass_make();
_GLUECODIUM_C_EXPORT void smoke_NoCacheClass_foo(_baseRef _instance);
#ifdef __cplusplus
}
#endif
