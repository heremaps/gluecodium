//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge\include\BaseHandle.h"
#include "cbridge\include\Export.h"
#include <stdbool.h>
#include <stdint.h>
_GLUECODIUM_C_EXPORT _baseRef smoke_StructsWithMethods_create_handle();
_GLUECODIUM_C_EXPORT void smoke_StructsWithMethods_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_StructsWithMethods_create_optional_handle();
_GLUECODIUM_C_EXPORT _baseRef smoke_StructsWithMethods_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_StructsWithMethods_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_create_handle(double x, double y);
_GLUECODIUM_C_EXPORT void smoke_StructsWithMethods_Vector_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_create_optional_handle(double x, double y);
_GLUECODIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_StructsWithMethods_Vector_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT double smoke_StructsWithMethods_Vector_x_get(_baseRef handle);
_GLUECODIUM_C_EXPORT double smoke_StructsWithMethods_Vector_y_get(_baseRef handle);
typedef struct {
    bool has_value;
    union {
        uint32_t error_value;
        _baseRef returned_value;
    };
} smoke_StructsWithMethods_Vector_create_Vector_result;
_GLUECODIUM_C_EXPORT double smoke_StructsWithMethods_Vector_distanceTo(_baseRef _instance, _baseRef other);
_GLUECODIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_add(_baseRef _instance, _baseRef other);
_GLUECODIUM_C_EXPORT bool smoke_StructsWithMethods_Vector_validate(double x, double y);
_GLUECODIUM_C_EXPORT _baseRef smoke_StructsWithMethods_Vector_create_Double_Double(double x, double y);
_GLUECODIUM_C_EXPORT smoke_StructsWithMethods_Vector_create_Vector_result smoke_StructsWithMethods_Vector_create_Vector(_baseRef other);
#ifdef __cplusplus
}
#endif
