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
_baseRef smoke_Structs_Point_create(double x, double y) {
    ::smoke::Structs::Point* _struct = new ::smoke::Structs::Point();
    _struct->x = x;
    _struct->y = y;
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_Structs_Point_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::Point>(handle);
}
double smoke_Structs_Point_x_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Point>(handle);
    return struct_pointer->x;
}
double smoke_Structs_Point_y_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Point>(handle);
    return struct_pointer->y;
}
_baseRef smoke_Structs_Color_create(uint8_t red, uint8_t green, uint8_t blue) {
    ::smoke::Structs::Color* _struct = new ::smoke::Structs::Color();
    _struct->red = red;
    _struct->green = green;
    _struct->blue = blue;
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_Structs_Color_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::Color>(handle);
}
uint8_t smoke_Structs_Color_red_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Color>(handle);
    return struct_pointer->red;
}
uint8_t smoke_Structs_Color_green_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Color>(handle);
    return struct_pointer->green;
}
uint8_t smoke_Structs_Color_blue_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Color>(handle);
    return struct_pointer->blue;
}
_baseRef smoke_Structs_Line_create(_baseRef a, _baseRef b) {
    ::smoke::Structs::Line* _struct = new ::smoke::Structs::Line();
    _struct->a = *get_pointer<::smoke::Structs::Point>(a);
    _struct->b = *get_pointer<::smoke::Structs::Point>(b);
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_Structs_Line_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::Line>(handle);
}
_baseRef smoke_Structs_Line_a_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Line>(handle);
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Point(struct_pointer->a) );
}
_baseRef smoke_Structs_Line_b_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Line>(handle);
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Point(struct_pointer->b) );
}
_baseRef smoke_Structs_ColoredLine_create(_baseRef line, _baseRef color) {
    ::smoke::Structs::ColoredLine* _struct = new ::smoke::Structs::ColoredLine();
    _struct->line = *get_pointer<::smoke::Structs::Line>(line);
    _struct->color = *get_pointer<::smoke::Structs::Color>(color);
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_Structs_ColoredLine_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::ColoredLine>(handle);
}
_baseRef smoke_Structs_ColoredLine_line_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ColoredLine>(handle);
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Line(struct_pointer->line) );
}
_baseRef smoke_Structs_ColoredLine_color_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ColoredLine>(handle);
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Color(struct_pointer->color) );
}
_baseRef smoke_Structs_AllTypesStruct_create(int8_t int8Field, uint8_t uint8Field, int16_t int16Field, uint16_t uint16Field, int32_t int32Field, uint32_t uint32Field, int64_t int64Field, uint64_t uint64Field, float floatField, double doubleField, const char* stringField, bool booleanField, _baseRef bytesField, _baseRef pointField) {
    ::smoke::Structs::AllTypesStruct* _struct = new ::smoke::Structs::AllTypesStruct();
    _struct->int8_field = int8Field;
    _struct->uint8_field = uint8Field;
    _struct->int16_field = int16Field;
    _struct->uint16_field = uint16Field;
    _struct->int32_field = int32Field;
    _struct->uint32_field = uint32Field;
    _struct->int64_field = int64Field;
    _struct->uint64_field = uint64Field;
    _struct->float_field = floatField;
    _struct->double_field = doubleField;
    _struct->string_field = stringField;
    _struct->boolean_field = booleanField;
    _struct->bytes_field = *get_pointer<::std::shared_ptr< ::std::vector< uint8_t > >>(bytesField);
    _struct->point_field = *get_pointer<::smoke::Structs::Point>(pointField);
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_Structs_AllTypesStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::AllTypesStruct>(handle);
}
int8_t smoke_Structs_AllTypesStruct_int8Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->int8_field;
}
uint8_t smoke_Structs_AllTypesStruct_uint8Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->uint8_field;
}
int16_t smoke_Structs_AllTypesStruct_int16Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->int16_field;
}
uint16_t smoke_Structs_AllTypesStruct_uint16Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->uint16_field;
}
int32_t smoke_Structs_AllTypesStruct_int32Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->int32_field;
}
uint32_t smoke_Structs_AllTypesStruct_uint32Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->uint32_field;
}
int64_t smoke_Structs_AllTypesStruct_int64Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->int64_field;
}
uint64_t smoke_Structs_AllTypesStruct_uint64Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->uint64_field;
}
float smoke_Structs_AllTypesStruct_floatField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->float_field;
}
double smoke_Structs_AllTypesStruct_doubleField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->double_field;
}
_baseRef smoke_Structs_AllTypesStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->string_field) );
}
bool smoke_Structs_AllTypesStruct_booleanField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return struct_pointer->boolean_field;
}
_baseRef smoke_Structs_AllTypesStruct_bytesField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return reinterpret_cast<_baseRef>( checked_pointer_copy(struct_pointer->bytes_field) );
}
_baseRef smoke_Structs_AllTypesStruct_pointField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
    return reinterpret_cast<_baseRef>( new ::smoke::Structs::Point(struct_pointer->point_field) );
}
_baseRef smoke_Structs_ExternalStruct_create(const char* stringField, const char* externalStringField, _baseRef externalArrayField, _baseRef externalStructField) {
    ::smoke::Structs::ExternalStruct* _struct = new ::smoke::Structs::ExternalStruct();
    _struct->stringField = stringField;
    _struct->set_some_string(externalStringField);
    _struct->set_some_array(*get_pointer<std::vector<int8_t>>(externalArrayField));
    _struct->set_some_struct(*get_pointer<::fire::SomeVeryExternalStruct>(externalStructField));
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_Structs_ExternalStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::ExternalStruct>(handle);
}
_baseRef smoke_Structs_ExternalStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->stringField) );
}
_baseRef smoke_Structs_ExternalStruct_externalStringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->get_some_string()) );
}
_baseRef smoke_Structs_ExternalStruct_externalArrayField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::vector<int8_t>(struct_pointer->get_some_array()) );
}
_baseRef smoke_Structs_ExternalStruct_externalStructField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
    return reinterpret_cast<_baseRef>( new ::fire::SomeVeryExternalStruct(struct_pointer->get_some_struct()) );
}
_baseRef smoke_Structs_AnotherExternalStruct_create(int8_t intField) {
    ::fire::SomeVeryExternalStruct* _struct = new ::fire::SomeVeryExternalStruct();
    _struct->intField = intField;
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_Structs_AnotherExternalStruct_release(_baseRef handle) {
    delete get_pointer<::fire::SomeVeryExternalStruct>(handle);
}
int8_t smoke_Structs_AnotherExternalStruct_intField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::fire::SomeVeryExternalStruct>(handle);
    return struct_pointer->intField;
}
_baseRef smoke_Structs_YetAnotherExternalStruct_create(const char* stringField) {
    ::smoke::Structs::Yet_Another_External_Struct* _struct = new ::smoke::Structs::Yet_Another_External_Struct();
    _struct->string_Field = stringField;
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_Structs_YetAnotherExternalStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::Structs::Yet_Another_External_Struct>(handle);
}
_baseRef smoke_Structs_YetAnotherExternalStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Yet_Another_External_Struct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->string_Field) );
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
