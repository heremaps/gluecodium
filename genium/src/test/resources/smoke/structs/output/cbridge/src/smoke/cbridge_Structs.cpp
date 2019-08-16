//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_Structs.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "genium/Optional.h"
#include "genium/TypeRepository.h"
#include "non/Sense.h"
#include "smoke/Structs.h"
#include "smoke/TypeCollection.h"
#include <memory>
#include <new>
#include <string>
#include <vector>
void smoke_Structs_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::Structs>>(handle);
}
_baseRef smoke_Structs_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::Structs>>(handle)))
        : 0;
}
extern "C" {
extern void* _CBridgeInitsmoke_Structs(_baseRef handle);
}
namespace {
struct smoke_StructsRegisterInit {
    smoke_StructsRegisterInit() {
        get_init_repository().add_init("smoke_Structs", &_CBridgeInitsmoke_Structs);
    }
} s_smoke_Structs_register_init;
}
void* smoke_Structs_get_typed(_baseRef handle) {
    const auto& real_type_id = ::genium::get_type_repository(static_cast<std::shared_ptr<::smoke::Structs>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::Structs>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_Structs(handle);
}
_baseRef
smoke_Structs_Point_create_handle( double x, double y )
{
    ::smoke::Structs::Point* _struct = new ( std::nothrow ) ::smoke::Structs::Point();
    _struct->x = x;
    _struct->y = y;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Structs_Point_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Structs::Point>( handle );
}
_baseRef
smoke_Structs_Point_create_optional_handle(double x, double y)
{
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::Structs::Point>( ::smoke::Structs::Point( ) );
    (*_struct)->x = x;
    (*_struct)->y = y;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Structs_Point_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::Structs::Point>*>( handle ) );
}
void smoke_Structs_Point_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::Structs::Point>*>( handle );
}
double smoke_Structs_Point_x_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Point>(handle);
return struct_pointer->x;
}
double smoke_Structs_Point_y_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Point>(handle);
return struct_pointer->y;
}
_baseRef
smoke_Structs_Line_create_handle( _baseRef a, _baseRef b )
{
    ::smoke::Structs::Line* _struct = new ( std::nothrow ) ::smoke::Structs::Line();
    _struct->a = Conversion<::smoke::Structs::Point>::toCpp( a );
    _struct->b = Conversion<::smoke::Structs::Point>::toCpp( b );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Structs_Line_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Structs::Line>( handle );
}
_baseRef
smoke_Structs_Line_create_optional_handle(_baseRef a, _baseRef b)
{
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::Structs::Line>( ::smoke::Structs::Line( ) );
    (*_struct)->a = Conversion<::smoke::Structs::Point>::toCpp( a );
    (*_struct)->b = Conversion<::smoke::Structs::Point>::toCpp( b );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Structs_Line_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::Structs::Line>*>( handle ) );
}
void smoke_Structs_Line_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::Structs::Line>*>( handle );
}
_baseRef smoke_Structs_Line_a_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Line>(handle);
return Conversion<::smoke::Structs::Point>::toBaseRef(struct_pointer->a);
}
_baseRef smoke_Structs_Line_b_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Line>(handle);
return Conversion<::smoke::Structs::Point>::toBaseRef(struct_pointer->b);
}
_baseRef
smoke_Structs_AllTypesStruct_create_handle( int8_t int8Field, uint8_t uint8Field, int16_t int16Field, uint16_t uint16Field, int32_t int32Field, uint32_t uint32Field, int64_t int64Field, uint64_t uint64Field, float floatField, double doubleField, _baseRef stringField, bool booleanField, _baseRef bytesField, _baseRef pointField )
{
    auto _int8Field = int8Field;
    auto _uint8Field = uint8Field;
    auto _int16Field = int16Field;
    auto _uint16Field = uint16Field;
    auto _int32Field = int32Field;
    auto _uint32Field = uint32Field;
    auto _int64Field = int64Field;
    auto _uint64Field = uint64Field;
    auto _floatField = floatField;
    auto _doubleField = doubleField;
    auto _stringField = Conversion<std::string>::toCpp( stringField );
    auto _booleanField = booleanField;
    auto _bytesField = Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toCpp( bytesField );
    auto _pointField = Conversion<::smoke::Structs::Point>::toCpp( pointField );
    ::smoke::Structs::AllTypesStruct* _struct = new ( std::nothrow ) ::smoke::Structs::AllTypesStruct( _int8Field, _uint8Field, _int16Field, _uint16Field, _int32Field, _uint32Field, _int64Field, _uint64Field, _floatField, _doubleField, _stringField, _booleanField, _bytesField, _pointField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Structs_AllTypesStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Structs::AllTypesStruct>( handle );
}
_baseRef
smoke_Structs_AllTypesStruct_create_optional_handle(int8_t int8Field, uint8_t uint8Field, int16_t int16Field, uint16_t uint16Field, int32_t int32Field, uint32_t uint32Field, int64_t int64Field, uint64_t uint64Field, float floatField, double doubleField, _baseRef stringField, bool booleanField, _baseRef bytesField, _baseRef pointField)
{
    auto _int8Field = int8Field;
    auto _uint8Field = uint8Field;
    auto _int16Field = int16Field;
    auto _uint16Field = uint16Field;
    auto _int32Field = int32Field;
    auto _uint32Field = uint32Field;
    auto _int64Field = int64Field;
    auto _uint64Field = uint64Field;
    auto _floatField = floatField;
    auto _doubleField = doubleField;
    auto _stringField = Conversion<std::string>::toCpp( stringField );
    auto _booleanField = booleanField;
    auto _bytesField = Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toCpp( bytesField );
    auto _pointField = Conversion<::smoke::Structs::Point>::toCpp( pointField );
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::Structs::AllTypesStruct>( ::smoke::Structs::AllTypesStruct( _int8Field, _uint8Field, _int16Field, _uint16Field, _int32Field, _uint32Field, _int64Field, _uint64Field, _floatField, _doubleField, _stringField, _booleanField, _bytesField, _pointField ) );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Structs_AllTypesStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::Structs::AllTypesStruct>*>( handle ) );
}
void smoke_Structs_AllTypesStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::Structs::AllTypesStruct>*>( handle );
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
return Conversion<std::string>::toBaseRef(struct_pointer->string_field);
}
bool smoke_Structs_AllTypesStruct_booleanField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
return struct_pointer->boolean_field;
}
_baseRef smoke_Structs_AllTypesStruct_bytesField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
return Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toBaseRef(struct_pointer->bytes_field);
}
_baseRef smoke_Structs_AllTypesStruct_pointField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::AllTypesStruct>(handle);
return Conversion<::smoke::Structs::Point>::toBaseRef(struct_pointer->point_field);
}
_baseRef
smoke_Structs_ExternalStruct_create_handle( _baseRef stringField, _baseRef externalStringField, _baseRef externalArrayField, _baseRef externalStructField )
{
    ::smoke::Structs::ExternalStruct* _struct = new ( std::nothrow ) ::smoke::Structs::ExternalStruct();
    _struct->stringField = Conversion<std::string>::toCpp( stringField );
    _struct->set_some_string( Conversion<std::string>::toCpp( externalStringField ) );
    _struct->set_some_array( Conversion<std::vector<int8_t>>::toCpp( externalArrayField ) );
    _struct->set_some_struct( Conversion<::fire::SomeVeryExternalStruct>::toCpp( externalStructField ) );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Structs_ExternalStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Structs::ExternalStruct>( handle );
}
_baseRef
smoke_Structs_ExternalStruct_create_optional_handle(_baseRef stringField, _baseRef externalStringField, _baseRef externalArrayField, _baseRef externalStructField)
{
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::Structs::ExternalStruct>( ::smoke::Structs::ExternalStruct( ) );
    (*_struct)->stringField = Conversion<std::string>::toCpp( stringField );
    (*_struct)->set_some_string( Conversion<std::string>::toCpp( externalStringField ) );
    (*_struct)->set_some_array( Conversion<std::vector<int8_t>>::toCpp( externalArrayField ) );
    (*_struct)->set_some_struct( Conversion<::fire::SomeVeryExternalStruct>::toCpp( externalStructField ) );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Structs_ExternalStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::Structs::ExternalStruct>*>( handle ) );
}
void smoke_Structs_ExternalStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::Structs::ExternalStruct>*>( handle );
}
_baseRef smoke_Structs_ExternalStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
return Conversion<std::string>::toBaseRef(struct_pointer->stringField);
}
_baseRef smoke_Structs_ExternalStruct_externalStringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
return Conversion<std::string>::toBaseRef(struct_pointer->get_some_string());
}
_baseRef smoke_Structs_ExternalStruct_externalArrayField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
return Conversion<std::vector<int8_t>>::toBaseRef(struct_pointer->get_some_array());
}
_baseRef smoke_Structs_ExternalStruct_externalStructField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::ExternalStruct>(handle);
return Conversion<::fire::SomeVeryExternalStruct>::toBaseRef(struct_pointer->get_some_struct());
}
_baseRef
smoke_Structs_AnotherExternalStruct_create_handle( int8_t intField )
{
    ::fire::SomeVeryExternalStruct* _struct = new ( std::nothrow ) ::fire::SomeVeryExternalStruct();
    _struct->intField = intField;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Structs_AnotherExternalStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::fire::SomeVeryExternalStruct>( handle );
}
_baseRef
smoke_Structs_AnotherExternalStruct_create_optional_handle(int8_t intField)
{
    auto _struct = new ( std::nothrow ) ::genium::optional<::fire::SomeVeryExternalStruct>( ::fire::SomeVeryExternalStruct( ) );
    (*_struct)->intField = intField;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Structs_AnotherExternalStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::fire::SomeVeryExternalStruct>*>( handle ) );
}
void smoke_Structs_AnotherExternalStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::fire::SomeVeryExternalStruct>*>( handle );
}
int8_t smoke_Structs_AnotherExternalStruct_intField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::fire::SomeVeryExternalStruct>(handle);
return struct_pointer->intField;
}
_baseRef
smoke_Structs_YetAnotherExternalStruct_create_handle( _baseRef stringField )
{
    ::smoke::Structs::Yet_Another_External_Struct* _struct = new ( std::nothrow ) ::smoke::Structs::Yet_Another_External_Struct();
    _struct->string_Field = Conversion<std::string>::toCpp( stringField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Structs_YetAnotherExternalStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Structs::Yet_Another_External_Struct>( handle );
}
_baseRef
smoke_Structs_YetAnotherExternalStruct_create_optional_handle(_baseRef stringField)
{
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::Structs::Yet_Another_External_Struct>( ::smoke::Structs::Yet_Another_External_Struct( ) );
    (*_struct)->string_Field = Conversion<std::string>::toCpp( stringField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Structs_YetAnotherExternalStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::Structs::Yet_Another_External_Struct>*>( handle ) );
}
void smoke_Structs_YetAnotherExternalStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::Structs::Yet_Another_External_Struct>*>( handle );
}
_baseRef smoke_Structs_YetAnotherExternalStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::Yet_Another_External_Struct>(handle);
return Conversion<std::string>::toBaseRef(struct_pointer->string_Field);
}
_baseRef
smoke_Structs_NestingImmutableStruct_create_handle( _baseRef structField )
{
    auto _structField = Conversion<::smoke::Structs::AllTypesStruct>::toCpp( structField );
    ::smoke::Structs::NestingImmutableStruct* _struct = new ( std::nothrow ) ::smoke::Structs::NestingImmutableStruct( _structField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Structs_NestingImmutableStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Structs::NestingImmutableStruct>( handle );
}
_baseRef
smoke_Structs_NestingImmutableStruct_create_optional_handle(_baseRef structField)
{
    auto _structField = Conversion<::smoke::Structs::AllTypesStruct>::toCpp( structField );
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::Structs::NestingImmutableStruct>( ::smoke::Structs::NestingImmutableStruct( _structField ) );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Structs_NestingImmutableStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::Structs::NestingImmutableStruct>*>( handle ) );
}
void smoke_Structs_NestingImmutableStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::Structs::NestingImmutableStruct>*>( handle );
}
_baseRef smoke_Structs_NestingImmutableStruct_structField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::NestingImmutableStruct>(handle);
return Conversion<::smoke::Structs::AllTypesStruct>::toBaseRef(struct_pointer->struct_field);
}
_baseRef
smoke_Structs_DoubleNestingImmutableStruct_create_handle( _baseRef nestingStructField )
{
    auto _nestingStructField = Conversion<::smoke::Structs::NestingImmutableStruct>::toCpp( nestingStructField );
    ::smoke::Structs::DoubleNestingImmutableStruct* _struct = new ( std::nothrow ) ::smoke::Structs::DoubleNestingImmutableStruct( _nestingStructField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Structs_DoubleNestingImmutableStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Structs::DoubleNestingImmutableStruct>( handle );
}
_baseRef
smoke_Structs_DoubleNestingImmutableStruct_create_optional_handle(_baseRef nestingStructField)
{
    auto _nestingStructField = Conversion<::smoke::Structs::NestingImmutableStruct>::toCpp( nestingStructField );
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct>( ::smoke::Structs::DoubleNestingImmutableStruct( _nestingStructField ) );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Structs_DoubleNestingImmutableStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct>*>( handle ) );
}
void smoke_Structs_DoubleNestingImmutableStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct>*>( handle );
}
_baseRef smoke_Structs_DoubleNestingImmutableStruct_nestingStructField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::DoubleNestingImmutableStruct>(handle);
return Conversion<::smoke::Structs::NestingImmutableStruct>::toBaseRef(struct_pointer->nesting_struct_field);
}
_baseRef
smoke_Structs_StructWithArrayOfImmutable_create_handle( _baseRef arrayField )
{
    auto _arrayField = Conversion<std::vector<::smoke::Structs::AllTypesStruct>>::toCpp( arrayField );
    ::smoke::Structs::StructWithArrayOfImmutable* _struct = new ( std::nothrow ) ::smoke::Structs::StructWithArrayOfImmutable( _arrayField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Structs_StructWithArrayOfImmutable_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Structs::StructWithArrayOfImmutable>( handle );
}
_baseRef
smoke_Structs_StructWithArrayOfImmutable_create_optional_handle(_baseRef arrayField)
{
    auto _arrayField = Conversion<std::vector<::smoke::Structs::AllTypesStruct>>::toCpp( arrayField );
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::Structs::StructWithArrayOfImmutable>( ::smoke::Structs::StructWithArrayOfImmutable( _arrayField ) );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Structs_StructWithArrayOfImmutable_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::Structs::StructWithArrayOfImmutable>*>( handle ) );
}
void smoke_Structs_StructWithArrayOfImmutable_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::Structs::StructWithArrayOfImmutable>*>( handle );
}
_baseRef smoke_Structs_StructWithArrayOfImmutable_arrayField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Structs::StructWithArrayOfImmutable>(handle);
return Conversion<std::vector<::smoke::Structs::AllTypesStruct>>::toBaseRef(struct_pointer->array_field);
}
_baseRef smoke_Structs_swapPointCoordinates(_baseRef input) {
    return Conversion<::smoke::Structs::Point>::toBaseRef(::smoke::Structs::swap_point_coordinates(Conversion<::smoke::Structs::Point>::toCpp(input)))
;
}
_baseRef smoke_Structs_returnAllTypesStruct(_baseRef input) {
    return Conversion<::smoke::Structs::AllTypesStruct>::toBaseRef(::smoke::Structs::return_all_types_struct(Conversion<::smoke::Structs::AllTypesStruct>::toCpp(input)))
;
}
_baseRef smoke_Structs_getExternalStruct() {
    return Conversion<::smoke::Structs::ExternalStruct>::toBaseRef(::smoke::Structs::get_external_struct())
;
}
_baseRef smoke_Structs_getAnotherExternalStruct() {
    return Conversion<::fire::SomeVeryExternalStruct>::toBaseRef(::smoke::Structs::get_another_external_struct())
;
}
_baseRef smoke_Structs_getYetAnotherExternalStruct() {
    return Conversion<::smoke::Structs::Yet_Another_External_Struct>::toBaseRef(::smoke::Structs::get_yet_another_external_struct())
;
}
_baseRef smoke_Structs_createPoint(double x, double y) {
    return Conversion<::smoke::Point>::toBaseRef(::smoke::Structs::create_point(x, y))
;
}
_baseRef smoke_Structs_modifyAllTypesStruct(_baseRef input) {
    return Conversion<::smoke::AllTypesStruct>::toBaseRef(::smoke::Structs::modify_all_types_struct(Conversion<::smoke::AllTypesStruct>::toCpp(input)))
;
}