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
#include <stdbool.h>
#include <stdbool.h>
_GENIUM_C_EXPORT _baseRef smoke_Dates_DateStruct_create_handle(double dateField);
_GENIUM_C_EXPORT void smoke_Dates_DateStruct_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_Dates_DateStruct_create_optional_handle(double dateField);
_GENIUM_C_EXPORT _baseRef smoke_Dates_DateStruct_unwrap_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT void smoke_Dates_DateStruct_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT double smoke_Dates_DateStruct_dateField_get(_baseRef handle);
_GENIUM_C_EXPORT void smoke_Dates_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_Dates_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT double smoke_Dates_dateMethod(_baseRef _instance, double input);
_GENIUM_C_EXPORT double smoke_Dates_dateAttribute_get(_baseRef _instance);
_GENIUM_C_EXPORT void smoke_Dates_dateAttribute_set(_baseRef _instance, double newValue);
_GENIUM_C_EXPORT _baseRef smoke_Dates_DateMap_create_handle();
_GENIUM_C_EXPORT void smoke_Dates_DateMap_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_Dates_DateMap_iterator(_baseRef handle);
_GENIUM_C_EXPORT void smoke_Dates_DateMap_iterator_release_handle(_baseRef iterator_handle);
_GENIUM_C_EXPORT void smoke_Dates_DateMap_put(_baseRef handle, _baseRef key, double value);
_GENIUM_C_EXPORT bool smoke_Dates_DateMap_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
_GENIUM_C_EXPORT void smoke_Dates_DateMap_iterator_increment(_baseRef iterator_handle);
_GENIUM_C_EXPORT _baseRef smoke_Dates_DateMap_iterator_key(_baseRef iterator_handle);
_GENIUM_C_EXPORT double smoke_Dates_DateMap_iterator_value(_baseRef iterator_handle);
_GENIUM_C_EXPORT _baseRef smoke_Dates_DateMap_create_optional_handle();
_GENIUM_C_EXPORT void smoke_Dates_DateMap_release_optional_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_Dates_DateMap_unwrap_optional_handle(_baseRef handle);
#ifdef __cplusplus
}
#endif