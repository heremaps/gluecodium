#include "ffi_smoke_Nullable.h"
#include "ConversionBase.h"
#include "gluecodium/Optional.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Nullable.h"
#include "smoke/SomeInterface.h"
#include <cstdint>
#include <memory>
#include <string>
#include <vector>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_Nullable_methodWithString__String(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).method_with_string(
            gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Nullable_methodWithBoolean__Boolean(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<gluecodium::optional<bool>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).method_with_boolean(
            gluecodium::ffi::Conversion<gluecodium::optional<bool>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Nullable_methodWithDouble__Double(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<gluecodium::optional<double>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).method_with_double(
            gluecodium::ffi::Conversion<gluecodium::optional<double>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Nullable_methodWithInt__Long(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<gluecodium::optional<int64_t>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).method_with_int(
            gluecodium::ffi::Conversion<gluecodium::optional<int64_t>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Nullable_methodWithSomeStruct__SomeStruct(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeStruct>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).method_with_some_struct(
            gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeStruct>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Nullable_methodWithSomeEnum__SomeEnum(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeEnum>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).method_with_some_enum(
            gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeEnum>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Nullable_methodWithSomeArray__ListOf_1String(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).method_with_some_array(
            gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Nullable_methodWithInlineArray__ListOf_1String(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).method_with_inline_array(
            gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Nullable_methodWithSomeMap__MapOf_1Long_1to_1String(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::unordered_map<int64_t, std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).method_with_some_map(
            gluecodium::ffi::Conversion<gluecodium::optional<std::unordered_map<int64_t, std::string>>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Nullable_methodWithInstance__SomeInterface(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SomeInterface>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).method_with_instance(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SomeInterface>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Nullable_stringProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).get_string_property()
    );
}
void
smoke_Nullable_stringProperty_set__String(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).set_string_property(
            gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Nullable_isBoolProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<gluecodium::optional<bool>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).is_bool_property()
    );
}
void
smoke_Nullable_isBoolProperty_set__Boolean(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).set_bool_property(
            gluecodium::ffi::Conversion<gluecodium::optional<bool>>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Nullable_doubleProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<gluecodium::optional<double>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).get_double_property()
    );
}
void
smoke_Nullable_doubleProperty_set__Double(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).set_double_property(
            gluecodium::ffi::Conversion<gluecodium::optional<double>>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Nullable_intProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<gluecodium::optional<int64_t>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).get_int_property()
    );
}
void
smoke_Nullable_intProperty_set__Long(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).set_int_property(
            gluecodium::ffi::Conversion<gluecodium::optional<int64_t>>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Nullable_structProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeStruct>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).get_struct_property()
    );
}
void
smoke_Nullable_structProperty_set__SomeStruct(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).set_struct_property(
            gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeStruct>>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Nullable_enumProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeEnum>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).get_enum_property()
    );
}
void
smoke_Nullable_enumProperty_set__SomeEnum(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).set_enum_property(
            gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeEnum>>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Nullable_arrayProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).get_array_property()
    );
}
void
smoke_Nullable_arrayProperty_set__ListOf_1String(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).set_array_property(
            gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Nullable_inlineArrayProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).get_inline_array_property()
    );
}
void
smoke_Nullable_inlineArrayProperty_set__ListOf_1String(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).set_inline_array_property(
            gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Nullable_mapProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::unordered_map<int64_t, std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).get_map_property()
    );
}
void
smoke_Nullable_mapProperty_set__MapOf_1Long_1to_1String(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).set_map_property(
            gluecodium::ffi::Conversion<gluecodium::optional<std::unordered_map<int64_t, std::string>>>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Nullable_instanceProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SomeInterface>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).get_instance_property()
    );
}
void
smoke_Nullable_instanceProperty_set__SomeInterface(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Nullable>>::toCpp(_self)).set_instance_property(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SomeInterface>>::toCpp(value)
        );
}
void
smoke_Nullable_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::Nullable>*>(handle);
}
FfiOpaqueHandle
smoke_Nullable_SomeStruct_create_handle(FfiOpaqueHandle stringField) {
    auto _result = new (std::nothrow) ::smoke::Nullable::SomeStruct(gluecodium::ffi::Conversion<std::string>::toCpp(stringField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_Nullable_SomeStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Nullable::SomeStruct*>(handle);
}
FfiOpaqueHandle
smoke_Nullable_SomeStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<::smoke::Nullable::SomeStruct*>(handle)->string_field
    );
}
FfiOpaqueHandle
smoke_Nullable_SomeStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Nullable::SomeStruct>(
            gluecodium::ffi::Conversion<::smoke::Nullable::SomeStruct>::toCpp(value)
        )
    );
}
void
smoke_Nullable_SomeStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Nullable::SomeStruct>*>(handle);
}
FfiOpaqueHandle
smoke_Nullable_SomeStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Nullable::SomeStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Nullable::SomeStruct>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_create_handle(FfiOpaqueHandle stringField, FfiOpaqueHandle boolField, FfiOpaqueHandle doubleField, FfiOpaqueHandle structField, FfiOpaqueHandle enumField, FfiOpaqueHandle arrayField, FfiOpaqueHandle inlineArrayField, FfiOpaqueHandle mapField, FfiOpaqueHandle instanceField) {
    auto _result = new (std::nothrow) ::smoke::Nullable::NullableStruct(gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toCpp(stringField), gluecodium::ffi::Conversion<gluecodium::optional<bool>>::toCpp(boolField), gluecodium::ffi::Conversion<gluecodium::optional<double>>::toCpp(doubleField), gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeStruct>>::toCpp(structField), gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeEnum>>::toCpp(enumField), gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toCpp(arrayField), gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toCpp(inlineArrayField), gluecodium::ffi::Conversion<gluecodium::optional<std::unordered_map<int64_t, std::string>>>::toCpp(mapField), gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SomeInterface>>::toCpp(instanceField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_Nullable_NullableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Nullable::NullableStruct*>(handle);
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableStruct*>(handle)->string_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_get_field_boolField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<bool>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableStruct*>(handle)->bool_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_get_field_doubleField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<double>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableStruct*>(handle)->double_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_get_field_structField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeStruct>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableStruct*>(handle)->struct_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_get_field_enumField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Nullable::SomeEnum>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableStruct*>(handle)->enum_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_get_field_arrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableStruct*>(handle)->array_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_get_field_inlineArrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::vector<std::string>>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableStruct*>(handle)->inline_array_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_get_field_mapField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<std::unordered_map<int64_t, std::string>>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableStruct*>(handle)->map_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_get_field_instanceField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SomeInterface>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableStruct*>(handle)->instance_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Nullable::NullableStruct>(
            gluecodium::ffi::Conversion<::smoke::Nullable::NullableStruct>::toCpp(value)
        )
    );
}
void
smoke_Nullable_NullableStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Nullable::NullableStruct>*>(handle);
}
FfiOpaqueHandle
smoke_Nullable_NullableStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Nullable::NullableStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Nullable::NullableStruct>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableIntsStruct_create_handle(FfiOpaqueHandle int8Field, FfiOpaqueHandle int16Field, FfiOpaqueHandle int32Field, FfiOpaqueHandle int64Field, FfiOpaqueHandle uint8Field, FfiOpaqueHandle uint16Field, FfiOpaqueHandle uint32Field, FfiOpaqueHandle uint64Field) {
    auto _result = new (std::nothrow) ::smoke::Nullable::NullableIntsStruct(gluecodium::ffi::Conversion<gluecodium::optional<int8_t>>::toCpp(int8Field), gluecodium::ffi::Conversion<gluecodium::optional<int16_t>>::toCpp(int16Field), gluecodium::ffi::Conversion<gluecodium::optional<int32_t>>::toCpp(int32Field), gluecodium::ffi::Conversion<gluecodium::optional<int64_t>>::toCpp(int64Field), gluecodium::ffi::Conversion<gluecodium::optional<uint8_t>>::toCpp(uint8Field), gluecodium::ffi::Conversion<gluecodium::optional<uint16_t>>::toCpp(uint16Field), gluecodium::ffi::Conversion<gluecodium::optional<uint32_t>>::toCpp(uint32Field), gluecodium::ffi::Conversion<gluecodium::optional<uint64_t>>::toCpp(uint64Field));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_Nullable_NullableIntsStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Nullable::NullableIntsStruct*>(handle);
}
FfiOpaqueHandle
smoke_Nullable_NullableIntsStruct_get_field_int8Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<int8_t>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableIntsStruct*>(handle)->int8_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableIntsStruct_get_field_int16Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<int16_t>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableIntsStruct*>(handle)->int16_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableIntsStruct_get_field_int32Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<int32_t>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableIntsStruct*>(handle)->int32_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableIntsStruct_get_field_int64Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<int64_t>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableIntsStruct*>(handle)->int64_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableIntsStruct_get_field_uint8Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<uint8_t>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableIntsStruct*>(handle)->uint8_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableIntsStruct_get_field_uint16Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<uint16_t>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableIntsStruct*>(handle)->uint16_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableIntsStruct_get_field_uint32Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<uint32_t>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableIntsStruct*>(handle)->uint32_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableIntsStruct_get_field_uint64Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::optional<uint64_t>>::toFfi(
        reinterpret_cast<::smoke::Nullable::NullableIntsStruct*>(handle)->uint64_field
    );
}
FfiOpaqueHandle
smoke_Nullable_NullableIntsStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Nullable::NullableIntsStruct>(
            gluecodium::ffi::Conversion<::smoke::Nullable::NullableIntsStruct>::toCpp(value)
        )
    );
}
void
smoke_Nullable_NullableIntsStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Nullable::NullableIntsStruct>*>(handle);
}
FfiOpaqueHandle
smoke_Nullable_NullableIntsStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Nullable::NullableIntsStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Nullable::NullableIntsStruct>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Nullable_SomeEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Nullable::SomeEnum>(
            gluecodium::ffi::Conversion<::smoke::Nullable::SomeEnum>::toCpp(value)
        )
    );
}
void
smoke_Nullable_SomeEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Nullable::SomeEnum>*>(handle);
}
uint32_t
smoke_Nullable_SomeEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Nullable::SomeEnum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Nullable::SomeEnum>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
