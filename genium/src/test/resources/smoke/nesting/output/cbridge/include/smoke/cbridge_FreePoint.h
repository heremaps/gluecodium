//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GENIUM_C_EXPORT _baseRef smoke_FreePoint_create_handle(double x, double y);
_GENIUM_C_EXPORT void smoke_FreePoint_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_FreePoint_create_optional_handle(double x, double y);
_GENIUM_C_EXPORT _baseRef smoke_FreePoint_unwrap_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT void smoke_FreePoint_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT double smoke_FreePoint_x_get(_baseRef handle);
_GENIUM_C_EXPORT double smoke_FreePoint_y_get(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_FreePoint_flip(_baseRef _instance);
#ifdef __cplusplus
}
#endif
