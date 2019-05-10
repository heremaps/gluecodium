//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_ValidationUtils.h"
#include <stdbool.h>
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethodsInterface_Vector3_create_handle(double x, double y, double z);
_GENIUM_C_EXPORT void smoke_StructsWithMethodsInterface_Vector3_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethodsInterface_Vector3_create_optional_handle(double x, double y, double z);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethodsInterface_Vector3_unwrap_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT void smoke_StructsWithMethodsInterface_Vector3_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT double smoke_StructsWithMethodsInterface_Vector3_x_get(_baseRef handle);
_GENIUM_C_EXPORT double smoke_StructsWithMethodsInterface_Vector3_y_get(_baseRef handle);
_GENIUM_C_EXPORT double smoke_StructsWithMethodsInterface_Vector3_z_get(_baseRef handle);
typedef struct {
    bool has_value;
    union {
        smoke_ValidationUtils_ValidationError error_code;
        _baseRef returned_value;
    };
} smoke_StructsWithMethodsInterface_Vector3_create_copy_result;
_GENIUM_C_EXPORT double smoke_StructsWithMethodsInterface_Vector3_distanceTo(_baseRef _instance, _baseRef other);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethodsInterface_Vector3_add(_baseRef _instance, _baseRef other);
_GENIUM_C_EXPORT bool smoke_StructsWithMethodsInterface_Vector3_validate(double x, double y, double z);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethodsInterface_Vector3_create_string(_baseRef input);
_GENIUM_C_EXPORT smoke_StructsWithMethodsInterface_Vector3_create_copy_result smoke_StructsWithMethodsInterface_Vector3_create_copy(_baseRef other);
_GENIUM_C_EXPORT void smoke_StructsWithMethodsInterface_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_StructsWithMethodsInterface_copy_handle(_baseRef handle);
#ifdef __cplusplus
}
#endif
