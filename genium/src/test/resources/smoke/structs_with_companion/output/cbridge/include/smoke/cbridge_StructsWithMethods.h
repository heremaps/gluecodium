//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/smoke/cbridge_ValidationUtils.h"
#include <stdbool.h>
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_create_handle(double x, double y);
_GENIUM_C_EXPORT void smoke_StructsWithMethods_Vector_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_create_optional_handle(double x, double y);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_unwrap_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT void smoke_StructsWithMethods_Vector_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT double smoke_StructsWithMethods_Vector_x_get(_baseRef handle);
_GENIUM_C_EXPORT double smoke_StructsWithMethods_Vector_y_get(_baseRef handle);
typedef struct {
    bool has_value;
    union {
        smoke_ValidationUtils_ValidationError error_code;
        _baseRef returned_value;
    };
} smoke_StructsWithMethods_Vector_create_copy_result;
_GENIUM_C_EXPORT double smoke_StructsWithMethods_Vector_distanceTo(_baseRef _instance, _baseRef other);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_add(_baseRef _instance, _baseRef other);
_GENIUM_C_EXPORT bool smoke_StructsWithMethods_Vector_validate(double x, double y);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_create_xy(double x, double y);
_GENIUM_C_EXPORT smoke_StructsWithMethods_Vector_create_copy_result smoke_StructsWithMethods_Vector_create_copy(_baseRef other);
#ifdef __cplusplus
}
#endif
