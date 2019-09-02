//
//

#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GENIUM_C_EXPORT _baseRef smoke_Dates_DateStruct_create_handle(double dateField);
_GENIUM_C_EXPORT void smoke_Dates_DateStruct_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_Dates_DateStruct_create_optional_handle(double dateField);
_GENIUM_C_EXPORT _baseRef smoke_Dates_DateStruct_unwrap_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT void smoke_Dates_DateStruct_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT double smoke_Dates_DateStruct_dateField_get(_baseRef handle);
_GENIUM_C_EXPORT void smoke_Dates_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_Dates_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT double smoke_Dates_dateMethod(_baseRef _instance, double input);
_GENIUM_C_EXPORT double smoke_Dates_dateProperty_get(_baseRef _instance);
_GENIUM_C_EXPORT void smoke_Dates_dateProperty_set(_baseRef _instance, double newValue);
#ifdef __cplusplus
}
#endif
