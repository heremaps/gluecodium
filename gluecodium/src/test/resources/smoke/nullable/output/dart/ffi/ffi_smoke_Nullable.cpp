#include "ffi_smoke_Nullable.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Nullable.h"
#include "smoke/SomeInterface.h"
#include <cstdint>
#include <memory>
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
library_smoke_Nullable_methodWithString__String_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<std::string>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).method_with_string(
            gluecodium::ffi::Conversion<std::optional<std::string>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Nullable_methodWithBoolean__Boolean_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<bool>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).method_with_boolean(
            gluecodium::ffi::Conversion<std::optional<bool>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Nullable_methodWithDouble__Double_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<double>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).method_with_double(
            gluecodium::ffi::Conversion<std::optional<double>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Nullable_methodWithInt__Long_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<int64_t>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).method_with_int(
            gluecodium::ffi::Conversion<std::optional<int64_t>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Nullable_methodWithSomeStruct__SomeStruct_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeStruct>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).method_with_some_struct(
            gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeStruct>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Nullable_methodWithSomeEnum__SomeEnum_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeEnum>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).method_with_some_enum(
            gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeEnum>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Nullable_methodWithSomeArray__ListOf_String_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).method_with_some_array(
            gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Nullable_methodWithInlineArray__ListOf_String_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).method_with_inline_array(
            gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Nullable_methodWithSomeMap__MapOf_Long_to_String_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<std::unordered_map<int64_t, std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).method_with_some_map(
            gluecodium::ffi::Conversion<std::optional<std::unordered_map<int64_t, std::string>>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Nullable_methodWithInstance__SomeInterface_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::SomeInterface>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).method_with_instance(
            gluecodium::ffi::Conversion<std::shared_ptr<smoke::SomeInterface>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Nullable_stringProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<std::string>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).get_string_property()
    );
}
void
library_smoke_Nullable_stringProperty_set__String_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).set_string_property(
        gluecodium::ffi::Conversion<std::optional<std::string>>::toCpp(value)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_isBoolProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<bool>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).is_bool_property()
    );
}
void
library_smoke_Nullable_isBoolProperty_set__Boolean_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).set_bool_property(
        gluecodium::ffi::Conversion<std::optional<bool>>::toCpp(value)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_doubleProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<double>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).get_double_property()
    );
}
void
library_smoke_Nullable_doubleProperty_set__Double_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).set_double_property(
        gluecodium::ffi::Conversion<std::optional<double>>::toCpp(value)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_intProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<int64_t>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).get_int_property()
    );
}
void
library_smoke_Nullable_intProperty_set__Long_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).set_int_property(
        gluecodium::ffi::Conversion<std::optional<int64_t>>::toCpp(value)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_structProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeStruct>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).get_struct_property()
    );
}
void
library_smoke_Nullable_structProperty_set__SomeStruct_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).set_struct_property(
        gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeStruct>>::toCpp(value)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_enumProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeEnum>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).get_enum_property()
    );
}
void
library_smoke_Nullable_enumProperty_set__SomeEnum_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).set_enum_property(
        gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeEnum>>::toCpp(value)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_arrayProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).get_array_property()
    );
}
void
library_smoke_Nullable_arrayProperty_set__ListOf_String_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).set_array_property(
        gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toCpp(value)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_inlineArrayProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).get_inline_array_property()
    );
}
void
library_smoke_Nullable_inlineArrayProperty_set__ListOf_String_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).set_inline_array_property(
        gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toCpp(value)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_mapProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::optional<std::unordered_map<int64_t, std::string>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).get_map_property()
    );
}
void
library_smoke_Nullable_mapProperty_set__MapOf_Long_to_String_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).set_map_property(
        gluecodium::ffi::Conversion<std::optional<std::unordered_map<int64_t, std::string>>>::toCpp(value)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_instanceProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::SomeInterface>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).get_instance_property()
    );
}
void
library_smoke_Nullable_instanceProperty_set__SomeInterface_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Nullable>>::toCpp(_self)).set_instance_property(
        gluecodium::ffi::Conversion<std::shared_ptr<smoke::SomeInterface>>::toCpp(value)
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Nullable_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::Nullable>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_Nullable_release_handle(handle);
}
void
library_smoke_Nullable_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Nullable_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Nullable_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::Nullable>(
            *reinterpret_cast<std::shared_ptr<smoke::Nullable>*>(handle)
        )
    );
}
void
library_smoke_Nullable_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::Nullable>*>(handle);
}
FfiOpaqueHandle
library_smoke_Nullable_SomeStruct_create_handle(FfiOpaqueHandle stringField) {
    auto _result = new (std::nothrow) smoke::Nullable::SomeStruct();
    _result->string_field = gluecodium::ffi::Conversion<std::string>::toCpp(stringField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Nullable_SomeStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Nullable::SomeStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_Nullable_SomeStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Nullable::SomeStruct*>(handle)->string_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_SomeStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Nullable::SomeStruct>(
            gluecodium::ffi::Conversion<smoke::Nullable::SomeStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Nullable_SomeStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Nullable::SomeStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Nullable_SomeStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Nullable::SomeStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::Nullable::SomeStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_create_handle(FfiOpaqueHandle stringField, FfiOpaqueHandle boolField, FfiOpaqueHandle doubleField, FfiOpaqueHandle structField, FfiOpaqueHandle enumField, FfiOpaqueHandle arrayField, FfiOpaqueHandle inlineArrayField, FfiOpaqueHandle mapField, FfiOpaqueHandle instanceField) {
    auto _result = new (std::nothrow) smoke::Nullable::NullableStruct();
    _result->string_field = gluecodium::ffi::Conversion<std::optional<std::string>>::toCpp(stringField);
    _result->bool_field = gluecodium::ffi::Conversion<std::optional<bool>>::toCpp(boolField);
    _result->double_field = gluecodium::ffi::Conversion<std::optional<double>>::toCpp(doubleField);
    _result->struct_field = gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeStruct>>::toCpp(structField);
    _result->enum_field = gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeEnum>>::toCpp(enumField);
    _result->array_field = gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toCpp(arrayField);
    _result->inline_array_field = gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toCpp(inlineArrayField);
    _result->map_field = gluecodium::ffi::Conversion<std::optional<std::unordered_map<int64_t, std::string>>>::toCpp(mapField);
    _result->instance_field = gluecodium::ffi::Conversion<std::shared_ptr<smoke::SomeInterface>>::toCpp(instanceField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Nullable_NullableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Nullable::NullableStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<std::string>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableStruct*>(handle)->string_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_get_field_boolField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<bool>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableStruct*>(handle)->bool_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_get_field_doubleField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<double>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableStruct*>(handle)->double_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_get_field_structField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeStruct>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableStruct*>(handle)->struct_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_get_field_enumField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<smoke::Nullable::SomeEnum>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableStruct*>(handle)->enum_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_get_field_arrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableStruct*>(handle)->array_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_get_field_inlineArrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<std::vector<std::string>>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableStruct*>(handle)->inline_array_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_get_field_mapField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<std::unordered_map<int64_t, std::string>>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableStruct*>(handle)->map_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_get_field_instanceField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::SomeInterface>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableStruct*>(handle)->instance_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Nullable::NullableStruct>(
            gluecodium::ffi::Conversion<smoke::Nullable::NullableStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Nullable_NullableStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Nullable::NullableStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Nullable_NullableStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Nullable::NullableStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::Nullable::NullableStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableIntsStruct_create_handle(FfiOpaqueHandle int8Field, FfiOpaqueHandle int16Field, FfiOpaqueHandle int32Field, FfiOpaqueHandle int64Field, FfiOpaqueHandle uint8Field, FfiOpaqueHandle uint16Field, FfiOpaqueHandle uint32Field, FfiOpaqueHandle uint64Field) {
    auto _result = new (std::nothrow) smoke::Nullable::NullableIntsStruct();
    _result->int8_field = gluecodium::ffi::Conversion<std::optional<int8_t>>::toCpp(int8Field);
    _result->int16_field = gluecodium::ffi::Conversion<std::optional<int16_t>>::toCpp(int16Field);
    _result->int32_field = gluecodium::ffi::Conversion<std::optional<int32_t>>::toCpp(int32Field);
    _result->int64_field = gluecodium::ffi::Conversion<std::optional<int64_t>>::toCpp(int64Field);
    _result->uint8_field = gluecodium::ffi::Conversion<std::optional<uint8_t>>::toCpp(uint8Field);
    _result->uint16_field = gluecodium::ffi::Conversion<std::optional<uint16_t>>::toCpp(uint16Field);
    _result->uint32_field = gluecodium::ffi::Conversion<std::optional<uint32_t>>::toCpp(uint32Field);
    _result->uint64_field = gluecodium::ffi::Conversion<std::optional<uint64_t>>::toCpp(uint64Field);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Nullable_NullableIntsStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Nullable::NullableIntsStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_Nullable_NullableIntsStruct_get_field_int8Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<int8_t>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableIntsStruct*>(handle)->int8_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableIntsStruct_get_field_int16Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<int16_t>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableIntsStruct*>(handle)->int16_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableIntsStruct_get_field_int32Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<int32_t>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableIntsStruct*>(handle)->int32_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableIntsStruct_get_field_int64Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<int64_t>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableIntsStruct*>(handle)->int64_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableIntsStruct_get_field_uint8Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<uint8_t>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableIntsStruct*>(handle)->uint8_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableIntsStruct_get_field_uint16Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<uint16_t>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableIntsStruct*>(handle)->uint16_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableIntsStruct_get_field_uint32Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<uint32_t>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableIntsStruct*>(handle)->uint32_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableIntsStruct_get_field_uint64Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::optional<uint64_t>>::toFfi(
        reinterpret_cast<smoke::Nullable::NullableIntsStruct*>(handle)->uint64_field
    );
}
FfiOpaqueHandle
library_smoke_Nullable_NullableIntsStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Nullable::NullableIntsStruct>(
            gluecodium::ffi::Conversion<smoke::Nullable::NullableIntsStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Nullable_NullableIntsStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Nullable::NullableIntsStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Nullable_NullableIntsStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Nullable::NullableIntsStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::Nullable::NullableIntsStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Nullable_SomeEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Nullable::SomeEnum>(
            gluecodium::ffi::Conversion<smoke::Nullable::SomeEnum>::toCpp(value)
        )
    );
}
void
library_smoke_Nullable_SomeEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Nullable::SomeEnum>*>(handle);
}
uint32_t
library_smoke_Nullable_SomeEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Nullable::SomeEnum>::toFfi(
        **reinterpret_cast<std::optional<smoke::Nullable::SomeEnum>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
