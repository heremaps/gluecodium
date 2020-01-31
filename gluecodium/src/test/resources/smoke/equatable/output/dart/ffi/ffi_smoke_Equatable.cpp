#include "ffi_smoke_Equatable.h"
#include "ConversionBase.h"
#include "gluecodium/Optional.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Equatable.h"
#include <cstdint>
#include <string>
#include <vector>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_Equatable_EquatableStruct_create_handle(bool boolField, int32_t intField, int64_t longField, float floatField, double doubleField, FfiOpaqueHandle stringField, FfiOpaqueHandle structField, uint32_t enumField, FfiOpaqueHandle arrayField, FfiOpaqueHandle mapField) {
    auto _result = new (std::nothrow) ::smoke::EquatableStruct(gluecodium::ffi::Conversion<bool>::toCpp(boolField), gluecodium::ffi::Conversion<int32_t>::toCpp(intField), gluecodium::ffi::Conversion<int64_t>::toCpp(longField), gluecodium::ffi::Conversion<float>::toCpp(floatField), gluecodium::ffi::Conversion<double>::toCpp(doubleField), gluecodium::ffi::Conversion<std::string>::toCpp(stringField), gluecodium::ffi::Conversion<::smoke::NestedEquatableStruct>::toCpp(structField), gluecodium::ffi::Conversion<::smoke::SomeEnum>::toCpp(enumField), gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(arrayField), gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::string>>::toCpp(mapField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_Equatable_EquatableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::EquatableStruct*>(handle);
}
bool
smoke_Equatable_EquatableStruct_get_field_boolField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        reinterpret_cast<::smoke::EquatableStruct*>(handle)->bool_field
    );
}
int32_t
smoke_Equatable_EquatableStruct_get_field_intField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        reinterpret_cast<::smoke::EquatableStruct*>(handle)->int_field
    );
}
int64_t
smoke_Equatable_EquatableStruct_get_field_longField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int64_t>::toFfi(
        reinterpret_cast<::smoke::EquatableStruct*>(handle)->long_field
    );
}
float
smoke_Equatable_EquatableStruct_get_field_floatField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<float>::toFfi(
        reinterpret_cast<::smoke::EquatableStruct*>(handle)->float_field
    );
}
double
smoke_Equatable_EquatableStruct_get_field_doubleField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<::smoke::EquatableStruct*>(handle)->double_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<::smoke::EquatableStruct*>(handle)->string_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableStruct_get_field_structField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<::smoke::NestedEquatableStruct>::toFfi(
        reinterpret_cast<::smoke::EquatableStruct*>(handle)->struct_field
    );
}
uint32_t
smoke_Equatable_EquatableStruct_get_field_enumField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<::smoke::SomeEnum>::toFfi(
        reinterpret_cast<::smoke::EquatableStruct*>(handle)->enum_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableStruct_get_field_arrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::vector<std::string>>::toFfi(
        reinterpret_cast<::smoke::EquatableStruct*>(handle)->array_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableStruct_get_field_mapField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::string>>::toFfi(
        reinterpret_cast<::smoke::EquatableStruct*>(handle)->map_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::EquatableStruct>(
            gluecodium::ffi::Conversion<::smoke::EquatableStruct>::toCpp(value)
        )
    );
}
void
smoke_Equatable_EquatableStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::EquatableStruct>*>(handle);
}
FfiOpaqueHandle
smoke_Equatable_EquatableStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::EquatableStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::EquatableStruct>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_create_handle(FfiOpaqueHandle boolField, FfiOpaqueHandle intField, FfiOpaqueHandle uintField, FfiOpaqueHandle floatField, FfiOpaqueHandle stringField, FfiOpaqueHandle structField, FfiOpaqueHandle enumField, FfiOpaqueHandle arrayField, FfiOpaqueHandle mapField) {
    auto _result = new (std::nothrow) ::smoke::EquatableNullableStruct(gluecodium::ffi::Conversion<gluecodium::optional<bool>>::toCpp(boolField), gluecodium::ffi::Conversion<gluecodium::optional<int32_t>>::toCpp(intField), gluecodium::ffi::Conversion<gluecodium::optional<uint16_t>>::toCpp(uintField), gluecodium::ffi::Conversion<gluecodium::optional<float>>::toCpp(floatField), gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toCpp(stringField), gluecodium::ffi::Conversion<gluecodium::optional<::smoke::NestedEquatableStruct>>::toCpp(structField), gluecodium::ffi::Conversion<gluecodium::optional<::smoke::SomeEnum>>::toCpp(enumField), gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toCpp(arrayField), gluecodium::ffi::Conversion<gluecodium::optional<std::unordered_map<int32_t, std::string>>>::toCpp(mapField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_Equatable_EquatableNullableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::EquatableNullableStruct*>(handle);
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_get_field_boolField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<bool>>::toFfi(
        reinterpret_cast<::smoke::EquatableNullableStruct*>(handle)->bool_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_get_field_intField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<int32_t>>::toFfi(
        reinterpret_cast<::smoke::EquatableNullableStruct*>(handle)->int_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_get_field_uintField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<uint16_t>>::toFfi(
        reinterpret_cast<::smoke::EquatableNullableStruct*>(handle)->uint_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_get_field_floatField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<float>>::toFfi(
        reinterpret_cast<::smoke::EquatableNullableStruct*>(handle)->float_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toFfi(
        reinterpret_cast<::smoke::EquatableNullableStruct*>(handle)->string_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_get_field_structField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<::smoke::NestedEquatableStruct>>::toFfi(
        reinterpret_cast<::smoke::EquatableNullableStruct*>(handle)->struct_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_get_field_enumField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<::smoke::SomeEnum>>::toFfi(
        reinterpret_cast<::smoke::EquatableNullableStruct*>(handle)->enum_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_get_field_arrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toFfi(
        reinterpret_cast<::smoke::EquatableNullableStruct*>(handle)->array_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_get_field_mapField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::unordered_map<int32_t, std::string>>>::toFfi(
        reinterpret_cast<::smoke::EquatableNullableStruct*>(handle)->map_field
    );
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::EquatableNullableStruct>(
            gluecodium::ffi::Conversion<::smoke::EquatableNullableStruct>::toCpp(value)
        )
    );
}
void
smoke_Equatable_EquatableNullableStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::EquatableNullableStruct>*>(handle);
}
FfiOpaqueHandle
smoke_Equatable_EquatableNullableStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::EquatableNullableStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::EquatableNullableStruct>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Equatable_NestedEquatableStruct_create_handle(FfiOpaqueHandle fooField) {
    auto _result = new (std::nothrow) ::smoke::NestedEquatableStruct(gluecodium::ffi::Conversion<std::string>::toCpp(fooField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_Equatable_NestedEquatableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::NestedEquatableStruct*>(handle);
}
FfiOpaqueHandle
smoke_Equatable_NestedEquatableStruct_get_field_fooField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<::smoke::NestedEquatableStruct*>(handle)->foo_field
    );
}
FfiOpaqueHandle
smoke_Equatable_NestedEquatableStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::NestedEquatableStruct>(
            gluecodium::ffi::Conversion<::smoke::NestedEquatableStruct>::toCpp(value)
        )
    );
}
void
smoke_Equatable_NestedEquatableStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::NestedEquatableStruct>*>(handle);
}
FfiOpaqueHandle
smoke_Equatable_NestedEquatableStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::NestedEquatableStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::NestedEquatableStruct>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Equatable_SomeEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::SomeEnum>(
            gluecodium::ffi::Conversion<::smoke::SomeEnum>::toCpp(value)
        )
    );
}
void
smoke_Equatable_SomeEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::SomeEnum>*>(handle);
}
uint32_t
smoke_Equatable_SomeEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::SomeEnum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::SomeEnum>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
