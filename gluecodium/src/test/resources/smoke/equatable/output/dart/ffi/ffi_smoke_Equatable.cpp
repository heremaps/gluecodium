#include "ffi_smoke_Equatable.h"
#include "ConversionBase.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Equatable.h"
#include <cstdint>
#include <optional>
#include <stdbool.h>
#include <string>
#include <unordered_map>
#include <vector>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_Equatable_create_handle() {
    auto _result = new (std::nothrow) smoke::Equatable();
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Equatable_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Equatable*>(handle);
}
FfiOpaqueHandle
library_smoke_Equatable_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Equatable>(
            gluecodium::ffi::Conversion<smoke::Equatable>::toCpp(value)
        )
    );
}
void
library_smoke_Equatable_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Equatable>*>(handle);
}
FfiOpaqueHandle
library_smoke_Equatable_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Equatable>::toFfi(
        **reinterpret_cast<std::optional<smoke::Equatable>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableStruct_create_handle(bool boolField, int32_t intField, int64_t longField, float floatField, double doubleField, FfiOpaqueHandle stringField, FfiOpaqueHandle structField, uint32_t enumField, FfiOpaqueHandle arrayField, FfiOpaqueHandle mapField) {
    auto _result = new (std::nothrow) smoke::Equatable::EquatableStruct();
    _result->bool_field = gluecodium::ffi::Conversion<bool>::toCpp(boolField);
    _result->int_field = gluecodium::ffi::Conversion<int32_t>::toCpp(intField);
    _result->long_field = gluecodium::ffi::Conversion<int64_t>::toCpp(longField);
    _result->float_field = gluecodium::ffi::Conversion<float>::toCpp(floatField);
    _result->double_field = gluecodium::ffi::Conversion<double>::toCpp(doubleField);
    _result->string_field = gluecodium::ffi::Conversion<std::string>::toCpp(stringField);
    _result->struct_field = gluecodium::ffi::Conversion<smoke::Equatable::NestedEquatableStruct>::toCpp(structField);
    _result->enum_field = gluecodium::ffi::Conversion<smoke::Equatable::SomeEnum>::toCpp(enumField);
    _result->array_field = gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(arrayField);
    _result->map_field = gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::string>>::toCpp(mapField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Equatable_EquatableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Equatable::EquatableStruct*>(handle);
}
bool
library_smoke_Equatable_EquatableStruct_get_field_boolField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableStruct*>(handle)->bool_field
    );
}
int32_t
library_smoke_Equatable_EquatableStruct_get_field_intField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableStruct*>(handle)->int_field
    );
}
int64_t
library_smoke_Equatable_EquatableStruct_get_field_longField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int64_t>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableStruct*>(handle)->long_field
    );
}
float
library_smoke_Equatable_EquatableStruct_get_field_floatField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<float>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableStruct*>(handle)->float_field
    );
}
double
library_smoke_Equatable_EquatableStruct_get_field_doubleField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableStruct*>(handle)->double_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableStruct*>(handle)->string_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableStruct_get_field_structField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Equatable::NestedEquatableStruct>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableStruct*>(handle)->struct_field
    );
}
uint32_t
library_smoke_Equatable_EquatableStruct_get_field_enumField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Equatable::SomeEnum>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableStruct*>(handle)->enum_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableStruct_get_field_arrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::vector<std::string>>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableStruct*>(handle)->array_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableStruct_get_field_mapField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::string>>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableStruct*>(handle)->map_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Equatable::EquatableStruct>(
            gluecodium::ffi::Conversion<smoke::Equatable::EquatableStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Equatable_EquatableStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Equatable::EquatableStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Equatable::EquatableStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::Equatable::EquatableStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_create_handle(FfiOpaqueHandle boolField, FfiOpaqueHandle intField, FfiOpaqueHandle uintField, FfiOpaqueHandle floatField, FfiOpaqueHandle stringField, FfiOpaqueHandle structField, FfiOpaqueHandle enumField, FfiOpaqueHandle arrayField, FfiOpaqueHandle mapField) {
    auto _result = new (std::nothrow) smoke::Equatable::EquatableNullableStruct();
    _result->bool_field = gluecodium::ffi::Conversion<std::optional<bool>>::toCpp(boolField);
    _result->int_field = gluecodium::ffi::Conversion<std::optional<int32_t>>::toCpp(intField);
    _result->uint_field = gluecodium::ffi::Conversion<std::optional<uint16_t>>::toCpp(uintField);
    _result->float_field = gluecodium::ffi::Conversion<std::optional<float>>::toCpp(floatField);
    _result->string_field = gluecodium::ffi::Conversion<std::optional<std::string>>::toCpp(stringField);
    _result->struct_field = gluecodium::ffi::Conversion<std::optional<smoke::Equatable::NestedEquatableStruct>>::toCpp(structField);
    _result->enum_field = gluecodium::ffi::Conversion<std::optional<smoke::Equatable::SomeEnum>>::toCpp(enumField);
    _result->array_field = gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toCpp(arrayField);
    _result->map_field = gluecodium::ffi::Conversion<std::optional<std::unordered_map<int32_t, std::string>>>::toCpp(mapField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Equatable_EquatableNullableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Equatable::EquatableNullableStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_get_field_boolField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<bool>>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableNullableStruct*>(handle)->bool_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_get_field_intField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<int32_t>>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableNullableStruct*>(handle)->int_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_get_field_uintField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<uint16_t>>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableNullableStruct*>(handle)->uint_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_get_field_floatField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<float>>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableNullableStruct*>(handle)->float_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<std::string>>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableNullableStruct*>(handle)->string_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_get_field_structField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<smoke::Equatable::NestedEquatableStruct>>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableNullableStruct*>(handle)->struct_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_get_field_enumField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<smoke::Equatable::SomeEnum>>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableNullableStruct*>(handle)->enum_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_get_field_arrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableNullableStruct*>(handle)->array_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_get_field_mapField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<std::unordered_map<int32_t, std::string>>>::toFfi(
        reinterpret_cast<smoke::Equatable::EquatableNullableStruct*>(handle)->map_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Equatable::EquatableNullableStruct>(
            gluecodium::ffi::Conversion<smoke::Equatable::EquatableNullableStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Equatable_EquatableNullableStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Equatable::EquatableNullableStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Equatable_EquatableNullableStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Equatable::EquatableNullableStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::Equatable::EquatableNullableStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Equatable_NestedEquatableStruct_create_handle(FfiOpaqueHandle fooField) {
    auto _result = new (std::nothrow) smoke::Equatable::NestedEquatableStruct();
    _result->foo_field = gluecodium::ffi::Conversion<std::string>::toCpp(fooField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Equatable_NestedEquatableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Equatable::NestedEquatableStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_Equatable_NestedEquatableStruct_get_field_fooField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Equatable::NestedEquatableStruct*>(handle)->foo_field
    );
}
FfiOpaqueHandle
library_smoke_Equatable_NestedEquatableStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Equatable::NestedEquatableStruct>(
            gluecodium::ffi::Conversion<smoke::Equatable::NestedEquatableStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Equatable_NestedEquatableStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Equatable::NestedEquatableStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Equatable_NestedEquatableStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Equatable::NestedEquatableStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::Equatable::NestedEquatableStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Equatable_SomeEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Equatable::SomeEnum>(
            gluecodium::ffi::Conversion<smoke::Equatable::SomeEnum>::toCpp(value)
        )
    );
}
void
library_smoke_Equatable_SomeEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Equatable::SomeEnum>*>(handle);
}
uint32_t
library_smoke_Equatable_SomeEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Equatable::SomeEnum>::toFfi(
        **reinterpret_cast<std::optional<smoke::Equatable::SomeEnum>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
