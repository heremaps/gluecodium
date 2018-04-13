//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/ByteArrayHandle.h"
#include "cbridge/include/StringHandle.h"
#include <stdbool.h>
#include <stdint.h>
typedef uint32_t smoke_Structs_FooBar;
_baseRef smoke_Structs_Point_create();
void smoke_Structs_Point_release(_baseRef handle);
double smoke_Structs_Point_x_get(_baseRef handle);
void smoke_Structs_Point_x_set(_baseRef handle, double x);
double smoke_Structs_Point_y_get(_baseRef handle);
void smoke_Structs_Point_y_set(_baseRef handle, double y);
_baseRef smoke_Structs_Color_create();
void smoke_Structs_Color_release(_baseRef handle);
uint8_t smoke_Structs_Color_red_get(_baseRef handle);
void smoke_Structs_Color_red_set(_baseRef handle, uint8_t red);
uint8_t smoke_Structs_Color_green_get(_baseRef handle);
void smoke_Structs_Color_green_set(_baseRef handle, uint8_t green);
uint8_t smoke_Structs_Color_blue_get(_baseRef handle);
void smoke_Structs_Color_blue_set(_baseRef handle, uint8_t blue);
_baseRef smoke_Structs_Line_create();
void smoke_Structs_Line_release(_baseRef handle);
_baseRef smoke_Structs_Line_a_get(_baseRef handle);
void smoke_Structs_Line_a_set(_baseRef handle, _baseRef a);
_baseRef smoke_Structs_Line_b_get(_baseRef handle);
void smoke_Structs_Line_b_set(_baseRef handle, _baseRef b);
_baseRef smoke_Structs_ColoredLine_create();
void smoke_Structs_ColoredLine_release(_baseRef handle);
_baseRef smoke_Structs_ColoredLine_line_get(_baseRef handle);
void smoke_Structs_ColoredLine_line_set(_baseRef handle, _baseRef line);
_baseRef smoke_Structs_ColoredLine_color_get(_baseRef handle);
void smoke_Structs_ColoredLine_color_set(_baseRef handle, _baseRef color);
_baseRef smoke_Structs_AllTypesStruct_create();
void smoke_Structs_AllTypesStruct_release(_baseRef handle);
int8_t smoke_Structs_AllTypesStruct_int8Field_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_int8Field_set(_baseRef handle, int8_t int8Field);
uint8_t smoke_Structs_AllTypesStruct_uint8Field_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_uint8Field_set(_baseRef handle, uint8_t uint8Field);
int16_t smoke_Structs_AllTypesStruct_int16Field_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_int16Field_set(_baseRef handle, int16_t int16Field);
uint16_t smoke_Structs_AllTypesStruct_uint16Field_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_uint16Field_set(_baseRef handle, uint16_t uint16Field);
int32_t smoke_Structs_AllTypesStruct_int32Field_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_int32Field_set(_baseRef handle, int32_t int32Field);
uint32_t smoke_Structs_AllTypesStruct_uint32Field_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_uint32Field_set(_baseRef handle, uint32_t uint32Field);
int64_t smoke_Structs_AllTypesStruct_int64Field_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_int64Field_set(_baseRef handle, int64_t int64Field);
uint64_t smoke_Structs_AllTypesStruct_uint64Field_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_uint64Field_set(_baseRef handle, uint64_t uint64Field);
float smoke_Structs_AllTypesStruct_floatField_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_floatField_set(_baseRef handle, float floatField);
double smoke_Structs_AllTypesStruct_doubleField_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_doubleField_set(_baseRef handle, double doubleField);
_baseRef smoke_Structs_AllTypesStruct_stringField_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_stringField_set(_baseRef handle, const char* stringField);
bool smoke_Structs_AllTypesStruct_booleanField_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_booleanField_set(_baseRef handle, bool booleanField);
_baseRef smoke_Structs_AllTypesStruct_bytesField_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_bytesField_set(_baseRef handle, const uint8_t* bytesField_ptr, int64_t bytesField_size);
_baseRef smoke_Structs_AllTypesStruct_pointField_get(_baseRef handle);
void smoke_Structs_AllTypesStruct_pointField_set(_baseRef handle, _baseRef pointField);
_baseRef smoke_Structs_ExternalStruct_create();
void smoke_Structs_ExternalStruct_release(_baseRef handle);
_baseRef smoke_Structs_ExternalStruct_stringField_get(_baseRef handle);
void smoke_Structs_ExternalStruct_stringField_set(_baseRef handle, const char* stringField);
_baseRef smoke_Structs_ExternalStruct_externalStringField_get(_baseRef handle);
void smoke_Structs_ExternalStruct_externalStringField_set(_baseRef handle, const char* externalStringField);
_baseRef smoke_Structs_ExternalStruct_externalArrayField_get(_baseRef handle);
void smoke_Structs_ExternalStruct_externalArrayField_set(_baseRef handle, _baseRef externalArrayField);
_baseRef smoke_Structs_ExternalStruct_externalStructField_get(_baseRef handle);
void smoke_Structs_ExternalStruct_externalStructField_set(_baseRef handle, _baseRef externalStructField);
_baseRef smoke_Structs_AnotherExternalStruct_create();
void smoke_Structs_AnotherExternalStruct_release(_baseRef handle);
int8_t smoke_Structs_AnotherExternalStruct_intField_get(_baseRef handle);
void smoke_Structs_AnotherExternalStruct_intField_set(_baseRef handle, int8_t intField);
void smoke_Structs_release(_baseRef handle);
_baseRef smoke_Structs_createPoint(double x, double y);
_baseRef smoke_Structs_swapPointCoordinates(_baseRef input);
_baseRef smoke_Structs_createLine(_baseRef pointA, _baseRef pointB);
_baseRef smoke_Structs_createColoredLine(_baseRef line, _baseRef color);
_baseRef smoke_Structs_returnColoredLine(_baseRef input);
_baseRef smoke_Structs_returnAllTypesStruct(_baseRef input);
_baseRef smoke_Structs_modifyAllTypesStruct(_baseRef input);
_baseRef smoke_Structs_getExternalStruct();
#ifdef __cplusplus
}
#endif
