//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_create_handle(double x, double y);
_GENIUM_C_EXPORT void smoke_StructsWithMethods_Vector_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_create_optional_handle(double x, double y);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_unwrap_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT void smoke_StructsWithMethods_Vector_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT double smoke_StructsWithMethods_Vector_x_get(_baseRef handle);
_GENIUM_C_EXPORT double smoke_StructsWithMethods_Vector_y_get(_baseRef handle);
_GENIUM_C_EXPORT double smoke_StructsWithMethods_Vector_distanceTo(_baseRef _instance, _baseRef other);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_add(_baseRef _instance, _baseRef other);
#ifdef __cplusplus
}
#endif
