//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_Structs.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "smoke/Structs.h"
#include <memory>
#include <new>
#include <string>
#include <vector>
void smoke_Structs_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::Structs>>(handle);
}
_baseRef smoke_Structs_Point_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Point() );
}
void smoke_Structs_Point_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::Point>(handle);
}
double smoke_Structs_Point_x_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Point>(handle);
    return struct_pointer->x;
}
void smoke_Structs_Point_x_set(_baseRef handle, double x) {
    get_pointer<::smoke::Structs::Point>(handle)->x = x;
}
double smoke_Structs_Point_y_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Point>(handle);
    return struct_pointer->y;
}
void smoke_Structs_Point_y_set(_baseRef handle, double y) {
    get_pointer<::smoke::Structs::Point>(handle)->y = y;
}
_baseRef smoke_Structs_Color_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Color() );
}
void smoke_Structs_Color_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::Color>(handle);
}
uint8_t smoke_Structs_Color_red_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Color>(handle);
    return struct_pointer->red;
}
void smoke_Structs_Color_red_set(_baseRef handle, uint8_t red) {
    get_pointer<::smoke::Structs::Color>(handle)->red = red;
}
uint8_t smoke_Structs_Color_green_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Color>(handle);
    return struct_pointer->green;
}
void smoke_Structs_Color_green_set(_baseRef handle, uint8_t green) {
    get_pointer<::smoke::Structs::Color>(handle)->green = green;
}
uint8_t smoke_Structs_Color_blue_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Color>(handle);
    return struct_pointer->blue;
}
void smoke_Structs_Color_blue_set(_baseRef handle, uint8_t blue) {
    get_pointer<::smoke::Structs::Color>(handle)->blue = blue;
}
_baseRef smoke_Structs_Line_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Line() );
}
void smoke_Structs_Line_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::Line>(handle);
}
_baseRef smoke_Structs_Line_a_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Line>(handle);
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Point(struct_pointer->a) );
}
void smoke_Structs_Line_a_set(_baseRef handle, _baseRef a) {
    get_pointer<::smoke::Structs::Line>(handle)->a = *get_pointer<::smoke::Structs::Point>(a);
}
_baseRef smoke_Structs_Line_b_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Line>(handle);
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Point(struct_pointer->b) );
}
void smoke_Structs_Line_b_set(_baseRef handle, _baseRef b) {
    get_pointer<::smoke::Structs::Line>(handle)->b = *get_pointer<::smoke::Structs::Point>(b);
}
_baseRef smoke_Structs_ColoredLine_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::ColoredLine() );
}
void smoke_Structs_ColoredLine_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::ColoredLine>(handle);
}
_baseRef smoke_Structs_ColoredLine_line_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ColoredLine>(handle);
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Line(struct_pointer->line) );
}
void smoke_Structs_ColoredLine_line_set(_baseRef handle, _baseRef line) {
    get_pointer<::smoke::Structs::ColoredLine>(handle)->line = *get_pointer<::smoke::Structs::Line>(line);
}
_baseRef smoke_Structs_ColoredLine_color_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ColoredLine>(handle);
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Color(struct_pointer->color) );
}
void smoke_Structs_ColoredLine_color_set(_baseRef handle, _baseRef color) {
    get_pointer<::smoke::Structs::ColoredLine>(handle)->color = *get_pointer<::smoke::Structs::Color>(color);
}
_baseRef smoke_Structs_AllTypesStruct_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::AllTypesStruct() );
}
void smoke_Structs_AllTypesStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::AllTypesStruct>(handle);
}
int8_t smoke_Structs_AllTypesStruct_int8Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->int8_field;
}
void smoke_Structs_AllTypesStruct_int8Field_set(_baseRef handle, int8_t int8Field) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->int8_field = int8Field;
}
uint8_t smoke_Structs_AllTypesStruct_uint8Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->uint8_field;
}
void smoke_Structs_AllTypesStruct_uint8Field_set(_baseRef handle, uint8_t uint8Field) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->uint8_field = uint8Field;
}
int16_t smoke_Structs_AllTypesStruct_int16Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->int16_field;
}
void smoke_Structs_AllTypesStruct_int16Field_set(_baseRef handle, int16_t int16Field) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->int16_field = int16Field;
}
uint16_t smoke_Structs_AllTypesStruct_uint16Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->uint16_field;
}
void smoke_Structs_AllTypesStruct_uint16Field_set(_baseRef handle, uint16_t uint16Field) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->uint16_field = uint16Field;
}
int32_t smoke_Structs_AllTypesStruct_int32Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->int32_field;
}
void smoke_Structs_AllTypesStruct_int32Field_set(_baseRef handle, int32_t int32Field) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->int32_field = int32Field;
}
uint32_t smoke_Structs_AllTypesStruct_uint32Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->uint32_field;
}
void smoke_Structs_AllTypesStruct_uint32Field_set(_baseRef handle, uint32_t uint32Field) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->uint32_field = uint32Field;
}
int64_t smoke_Structs_AllTypesStruct_int64Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->int64_field;
}
void smoke_Structs_AllTypesStruct_int64Field_set(_baseRef handle, int64_t int64Field) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->int64_field = int64Field;
}
uint64_t smoke_Structs_AllTypesStruct_uint64Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->uint64_field;
}
void smoke_Structs_AllTypesStruct_uint64Field_set(_baseRef handle, uint64_t uint64Field) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->uint64_field = uint64Field;
}
float smoke_Structs_AllTypesStruct_floatField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->float_field;
}
void smoke_Structs_AllTypesStruct_floatField_set(_baseRef handle, float floatField) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->float_field = floatField;
}
double smoke_Structs_AllTypesStruct_doubleField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->double_field;
}
void smoke_Structs_AllTypesStruct_doubleField_set(_baseRef handle, double doubleField) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->double_field = doubleField;
}
_baseRef smoke_Structs_AllTypesStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->string_field) );
}
void smoke_Structs_AllTypesStruct_stringField_set(_baseRef handle, const char* stringField) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->string_field = stringField;
}
bool smoke_Structs_AllTypesStruct_booleanField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->boolean_field;
}
void smoke_Structs_AllTypesStruct_booleanField_set(_baseRef handle, bool booleanField) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->boolean_field = booleanField;
}
_baseRef smoke_Structs_AllTypesStruct_bytesField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return reinterpret_cast<_baseRef>( checked_pointer_copy(struct_pointer->bytes_field) );
}
void smoke_Structs_AllTypesStruct_bytesField_set(_baseRef handle, _baseRef bytesField) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->bytes_field = *get_pointer<::std::shared_ptr< ::std::vector< uint8_t > >>(bytesField);
}
_baseRef smoke_Structs_AllTypesStruct_pointField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Point(struct_pointer->point_field) );
}
void smoke_Structs_AllTypesStruct_pointField_set(_baseRef handle, _baseRef pointField) {
    get_pointer<::smoke::Structs::AllTypesStruct>(handle)->point_field = *get_pointer<::smoke::Structs::Point>(pointField);
}
_baseRef smoke_Structs_ExternalStruct_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::ExternalStruct() );
}
void smoke_Structs_ExternalStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::ExternalStruct>(handle);
}
_baseRef smoke_Structs_ExternalStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->stringField) );
}
void smoke_Structs_ExternalStruct_stringField_set(_baseRef handle, const char* stringField) {
    get_pointer<::smoke::Structs::ExternalStruct>(handle)->stringField = stringField;
}
_baseRef smoke_Structs_ExternalStruct_externalStringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->get_some_string()) );
}
void smoke_Structs_ExternalStruct_externalStringField_set(_baseRef handle, const char* externalStringField) {
    get_pointer<::smoke::Structs::ExternalStruct>(handle)->set_some_string(externalStringField);
}
_baseRef smoke_Structs_ExternalStruct_externalArrayField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::vector<int8_t>(struct_pointer->get_some_array()) );
}
void smoke_Structs_ExternalStruct_externalArrayField_set(_baseRef handle, _baseRef externalArrayField) {
    get_pointer<::smoke::Structs::ExternalStruct>(handle)->set_some_array(*get_pointer<std::vector<int8_t>>(externalArrayField));
}
_baseRef smoke_Structs_ExternalStruct_externalStructField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
    return reinterpret_cast<_baseRef>( new ::fire::SomeVeryExternalStruct(struct_pointer->get_some_struct()) );
}
void smoke_Structs_ExternalStruct_externalStructField_set(_baseRef handle, _baseRef externalStructField) {
    get_pointer<::smoke::Structs::ExternalStruct>(handle)->set_some_struct(*get_pointer<::fire::SomeVeryExternalStruct>(externalStructField));
}
_baseRef smoke_Structs_AnotherExternalStruct_create() {
    return reinterpret_cast<_baseRef>( new ::fire::SomeVeryExternalStruct() );
}
void smoke_Structs_AnotherExternalStruct_release(_baseRef handle) {
    delete get_pointer<::fire::SomeVeryExternalStruct>(handle);
}
int8_t smoke_Structs_AnotherExternalStruct_intField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::fire::SomeVeryExternalStruct>(handle);
    return struct_pointer->intField;
}
void smoke_Structs_AnotherExternalStruct_intField_set(_baseRef handle, int8_t intField) {
    get_pointer<::fire::SomeVeryExternalStruct>(handle)->intField = intField;
}
_baseRef smoke_Structs_YetAnotherExternalStruct_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Yet_Another_External_Struct() );
}
void smoke_Structs_YetAnotherExternalStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::Yet_Another_External_Struct>(handle);
}
_baseRef smoke_Structs_YetAnotherExternalStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Yet_Another_External_Struct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->string_Field) );
}
void smoke_Structs_YetAnotherExternalStruct_stringField_set(_baseRef handle, const char* stringField) {
    get_pointer<::smoke::Structs::Yet_Another_External_Struct>(handle)->string_Field = stringField;
}
_baseRef smoke_Structs_createPoint(double x, double y) {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Point(::smoke::Structs::create_point(x, y)) );
}
_baseRef smoke_Structs_swapPointCoordinates(_baseRef input) {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Point(::smoke::Structs::swap_point_coordinates(*get_pointer<::smoke::Structs::Point>(input))) );
}
_baseRef smoke_Structs_createLine(_baseRef pointA, _baseRef pointB) {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Line(::smoke::Structs::create_line(*get_pointer<::smoke::Structs::Point>(pointA), *get_pointer<::smoke::Structs::Point>(pointB))) );
}
_baseRef smoke_Structs_createColoredLine(_baseRef line, _baseRef color) {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::ColoredLine(::smoke::Structs::create_colored_line(*get_pointer<::smoke::Structs::Line>(line), *get_pointer<::smoke::Structs::Color>(color))) );
}
_baseRef smoke_Structs_returnColoredLine(_baseRef input) {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::ColoredLine(::smoke::Structs::return_colored_line(*get_pointer<::smoke::Structs::ColoredLine>(input))) );
}
_baseRef smoke_Structs_returnAllTypesStruct(_baseRef input) {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::AllTypesStruct(::smoke::Structs::return_all_types_struct(*get_pointer<::smoke::Structs::AllTypesStruct>(input))) );
}
_baseRef smoke_Structs_modifyAllTypesStruct(_baseRef input) {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::AllTypesStruct(::smoke::Structs::modify_all_types_struct(*get_pointer<::smoke::Structs::AllTypesStruct>(input))) );
}
_baseRef smoke_Structs_getExternalStruct() {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::ExternalStruct(::smoke::Structs::get_external_struct()) );
}
_baseRef smoke_Structs_getAnotherExternalStruct() {
    return reinterpret_cast<_baseRef>( new ::fire::SomeVeryExternalStruct(::smoke::Structs::get_another_external_struct()) );
}
_baseRef smoke_Structs_getYetAnotherExternalStruct() {
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Yet_Another_External_Struct(::smoke::Structs::get_yet_another_external_struct()) );
}
