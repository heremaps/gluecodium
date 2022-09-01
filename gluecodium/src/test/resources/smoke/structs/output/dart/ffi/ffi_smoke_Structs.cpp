#include "ffi_smoke_Structs.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Structs.h"
#include "smoke/TypeCollection.h"
#include <cstdint>
#include <memory>
#include <stdbool.h>
#include <string>
#include <vector>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_Structs_swapPointCoordinates__Point(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::Structs::Point>::toFfi(
        smoke::Structs::swap_point_coordinates(
            gluecodium::ffi::Conversion<smoke::Structs::Point>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Structs_returnAllTypesStruct__AllTypesStruct(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::Structs::AllTypesStruct>::toFfi(
        smoke::Structs::return_all_types_struct(
            gluecodium::ffi::Conversion<smoke::Structs::AllTypesStruct>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Structs_createPoint__Double_Double(int32_t _isolate_id, double x, double y) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::TypeCollection::Point>::toFfi(
        smoke::Structs::create_point(
            gluecodium::ffi::Conversion<double>::toCpp(x),
            gluecodium::ffi::Conversion<double>::toCpp(y)
        )
    );
}
FfiOpaqueHandle
library_smoke_Structs_modifyAllTypesStruct__AllTypesStruct(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::TypeCollection::AllTypesStruct>::toFfi(
        smoke::Structs::modify_all_types_struct(
            gluecodium::ffi::Conversion<smoke::TypeCollection::AllTypesStruct>::toCpp(input)
        )
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Structs_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::Structs>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_Structs_release_handle(handle);
}
void
library_smoke_Structs_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Structs_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Structs_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::Structs>(
            *reinterpret_cast<std::shared_ptr<smoke::Structs>*>(handle)
        )
    );
}
void
library_smoke_Structs_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::Structs>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_Point_create_handle(double x, double y) {
    auto _result = new (std::nothrow) smoke::Structs::Point();
    _result->x = gluecodium::ffi::Conversion<double>::toCpp(x);
    _result->y = gluecodium::ffi::Conversion<double>::toCpp(y);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Structs_Point_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::Point*>(handle);
}
double
library_smoke_Structs_Point_get_field_x(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::Structs::Point*>(handle)->x
    );
}
double
library_smoke_Structs_Point_get_field_y(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::Structs::Point*>(handle)->y
    );
}
FfiOpaqueHandle
library_smoke_Structs_Point_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Structs::Point>(
            gluecodium::ffi::Conversion<smoke::Structs::Point>::toCpp(value)
        )
    );
}
void
library_smoke_Structs_Point_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Structs::Point>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_Point_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Structs::Point>::toFfi(
        **reinterpret_cast<std::optional<smoke::Structs::Point>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Structs_Line_create_handle(FfiOpaqueHandle a, FfiOpaqueHandle b) {
    auto _result = new (std::nothrow) smoke::Structs::Line();
    _result->a = gluecodium::ffi::Conversion<smoke::Structs::Point>::toCpp(a);
    _result->b = gluecodium::ffi::Conversion<smoke::Structs::Point>::toCpp(b);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Structs_Line_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::Line*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_Line_get_field_a(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::Point>::toFfi(
        reinterpret_cast<smoke::Structs::Line*>(handle)->a
    );
}
FfiOpaqueHandle
library_smoke_Structs_Line_get_field_b(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::Point>::toFfi(
        reinterpret_cast<smoke::Structs::Line*>(handle)->b
    );
}
FfiOpaqueHandle
library_smoke_Structs_Line_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Structs::Line>(
            gluecodium::ffi::Conversion<smoke::Structs::Line>::toCpp(value)
        )
    );
}
void
library_smoke_Structs_Line_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Structs::Line>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_Line_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Structs::Line>::toFfi(
        **reinterpret_cast<std::optional<smoke::Structs::Line>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Structs_AllTypesStruct_create_handle(int8_t int8Field, uint8_t uint8Field, int16_t int16Field, uint16_t uint16Field, int32_t int32Field, uint32_t uint32Field, int64_t int64Field, uint64_t uint64Field, float floatField, double doubleField, FfiOpaqueHandle stringField, bool booleanField, FfiOpaqueHandle bytesField, FfiOpaqueHandle pointField) {
    auto _result = new (std::nothrow) smoke::Structs::AllTypesStruct(gluecodium::ffi::Conversion<int8_t>::toCpp(int8Field), gluecodium::ffi::Conversion<uint8_t>::toCpp(uint8Field), gluecodium::ffi::Conversion<int16_t>::toCpp(int16Field), gluecodium::ffi::Conversion<uint16_t>::toCpp(uint16Field), gluecodium::ffi::Conversion<int32_t>::toCpp(int32Field), gluecodium::ffi::Conversion<uint32_t>::toCpp(uint32Field), gluecodium::ffi::Conversion<int64_t>::toCpp(int64Field), gluecodium::ffi::Conversion<uint64_t>::toCpp(uint64Field), gluecodium::ffi::Conversion<float>::toCpp(floatField), gluecodium::ffi::Conversion<double>::toCpp(doubleField), gluecodium::ffi::Conversion<std::string>::toCpp(stringField), gluecodium::ffi::Conversion<bool>::toCpp(booleanField), gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toCpp(bytesField), gluecodium::ffi::Conversion<smoke::Structs::Point>::toCpp(pointField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Structs_AllTypesStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle);
}
int8_t
library_smoke_Structs_AllTypesStruct_get_field_int8Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int8_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->int8_field
    );
}
uint8_t
library_smoke_Structs_AllTypesStruct_get_field_uint8Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<uint8_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->uint8_field
    );
}
int16_t
library_smoke_Structs_AllTypesStruct_get_field_int16Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int16_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->int16_field
    );
}
uint16_t
library_smoke_Structs_AllTypesStruct_get_field_uint16Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<uint16_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->uint16_field
    );
}
int32_t
library_smoke_Structs_AllTypesStruct_get_field_int32Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->int32_field
    );
}
uint32_t
library_smoke_Structs_AllTypesStruct_get_field_uint32Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<uint32_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->uint32_field
    );
}
int64_t
library_smoke_Structs_AllTypesStruct_get_field_int64Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int64_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->int64_field
    );
}
uint64_t
library_smoke_Structs_AllTypesStruct_get_field_uint64Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<uint64_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->uint64_field
    );
}
float
library_smoke_Structs_AllTypesStruct_get_field_floatField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<float>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->float_field
    );
}
double
library_smoke_Structs_AllTypesStruct_get_field_doubleField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->double_field
    );
}
FfiOpaqueHandle
library_smoke_Structs_AllTypesStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->string_field
    );
}
bool
library_smoke_Structs_AllTypesStruct_get_field_booleanField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->boolean_field
    );
}
FfiOpaqueHandle
library_smoke_Structs_AllTypesStruct_get_field_bytesField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->bytes_field
    );
}
FfiOpaqueHandle
library_smoke_Structs_AllTypesStruct_get_field_pointField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::Point>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->point_field
    );
}
FfiOpaqueHandle
library_smoke_Structs_AllTypesStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Structs::AllTypesStruct>(
            gluecodium::ffi::Conversion<smoke::Structs::AllTypesStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Structs_AllTypesStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Structs::AllTypesStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_AllTypesStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Structs::AllTypesStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::Structs::AllTypesStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Structs_NestingImmutableStruct_create_handle(FfiOpaqueHandle structField) {
    auto _result = new (std::nothrow) smoke::Structs::NestingImmutableStruct(gluecodium::ffi::Conversion<smoke::Structs::AllTypesStruct>::toCpp(structField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Structs_NestingImmutableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::NestingImmutableStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_NestingImmutableStruct_get_field_structField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::AllTypesStruct>::toFfi(
        reinterpret_cast<smoke::Structs::NestingImmutableStruct*>(handle)->struct_field
    );
}
FfiOpaqueHandle
library_smoke_Structs_NestingImmutableStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Structs::NestingImmutableStruct>(
            gluecodium::ffi::Conversion<smoke::Structs::NestingImmutableStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Structs_NestingImmutableStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Structs::NestingImmutableStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_NestingImmutableStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Structs::NestingImmutableStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::Structs::NestingImmutableStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Structs_DoubleNestingImmutableStruct_create_handle(FfiOpaqueHandle nestingStructField) {
    auto _result = new (std::nothrow) smoke::Structs::DoubleNestingImmutableStruct(gluecodium::ffi::Conversion<smoke::Structs::NestingImmutableStruct>::toCpp(nestingStructField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Structs_DoubleNestingImmutableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::DoubleNestingImmutableStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_DoubleNestingImmutableStruct_get_field_nestingStructField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::NestingImmutableStruct>::toFfi(
        reinterpret_cast<smoke::Structs::DoubleNestingImmutableStruct*>(handle)->nesting_struct_field
    );
}
FfiOpaqueHandle
library_smoke_Structs_DoubleNestingImmutableStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Structs::DoubleNestingImmutableStruct>(
            gluecodium::ffi::Conversion<smoke::Structs::DoubleNestingImmutableStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Structs_DoubleNestingImmutableStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Structs::DoubleNestingImmutableStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_DoubleNestingImmutableStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Structs::DoubleNestingImmutableStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::Structs::DoubleNestingImmutableStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Structs_StructWithArrayOfImmutable_create_handle(FfiOpaqueHandle arrayField) {
    auto _result = new (std::nothrow) smoke::Structs::StructWithArrayOfImmutable(gluecodium::ffi::Conversion<std::vector<smoke::Structs::AllTypesStruct>>::toCpp(arrayField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Structs_StructWithArrayOfImmutable_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::StructWithArrayOfImmutable*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_StructWithArrayOfImmutable_get_field_arrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::vector<smoke::Structs::AllTypesStruct>>::toFfi(
        reinterpret_cast<smoke::Structs::StructWithArrayOfImmutable*>(handle)->array_field
    );
}
FfiOpaqueHandle
library_smoke_Structs_StructWithArrayOfImmutable_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Structs::StructWithArrayOfImmutable>(
            gluecodium::ffi::Conversion<smoke::Structs::StructWithArrayOfImmutable>::toCpp(value)
        )
    );
}
void
library_smoke_Structs_StructWithArrayOfImmutable_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Structs::StructWithArrayOfImmutable>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_StructWithArrayOfImmutable_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Structs::StructWithArrayOfImmutable>::toFfi(
        **reinterpret_cast<std::optional<smoke::Structs::StructWithArrayOfImmutable>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Structs_ImmutableStructWithCppAccessors_create_handle(FfiOpaqueHandle stringField) {
    auto _result = new (std::nothrow) smoke::Structs::ImmutableStructWithCppAccessors(gluecodium::ffi::Conversion<std::string>::toCpp(stringField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Structs_ImmutableStructWithCppAccessors_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::ImmutableStructWithCppAccessors*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_ImmutableStructWithCppAccessors_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Structs::ImmutableStructWithCppAccessors*>(handle)->get_string_field()
    );
}
FfiOpaqueHandle
library_smoke_Structs_ImmutableStructWithCppAccessors_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Structs::ImmutableStructWithCppAccessors>(
            gluecodium::ffi::Conversion<smoke::Structs::ImmutableStructWithCppAccessors>::toCpp(value)
        )
    );
}
void
library_smoke_Structs_ImmutableStructWithCppAccessors_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Structs::ImmutableStructWithCppAccessors>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_ImmutableStructWithCppAccessors_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Structs::ImmutableStructWithCppAccessors>::toFfi(
        **reinterpret_cast<std::optional<smoke::Structs::ImmutableStructWithCppAccessors>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Structs_MutableStructWithCppAccessors_create_handle(FfiOpaqueHandle stringField) {
    auto _result = new (std::nothrow) smoke::Structs::MutableStructWithCppAccessors();
    _result->set_string_field(gluecodium::ffi::Conversion<std::string>::toCpp(stringField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Structs_MutableStructWithCppAccessors_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::MutableStructWithCppAccessors*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_MutableStructWithCppAccessors_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Structs::MutableStructWithCppAccessors*>(handle)->get_string_field()
    );
}
FfiOpaqueHandle
library_smoke_Structs_MutableStructWithCppAccessors_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Structs::MutableStructWithCppAccessors>(
            gluecodium::ffi::Conversion<smoke::Structs::MutableStructWithCppAccessors>::toCpp(value)
        )
    );
}
void
library_smoke_Structs_MutableStructWithCppAccessors_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Structs::MutableStructWithCppAccessors>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_MutableStructWithCppAccessors_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Structs::MutableStructWithCppAccessors>::toFfi(
        **reinterpret_cast<std::optional<smoke::Structs::MutableStructWithCppAccessors>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Structs_FooBar_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Structs::FooBar>(
            gluecodium::ffi::Conversion<smoke::Structs::FooBar>::toCpp(value)
        )
    );
}
void
library_smoke_Structs_FooBar_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Structs::FooBar>*>(handle);
}
uint32_t
library_smoke_Structs_FooBar_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Structs::FooBar>::toFfi(
        **reinterpret_cast<std::optional<smoke::Structs::FooBar>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
