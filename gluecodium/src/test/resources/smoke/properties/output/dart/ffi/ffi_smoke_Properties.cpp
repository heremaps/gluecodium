#include "ffi_smoke_Properties.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Properties.h"
#include "smoke/PropertiesInterface.h"
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
uint32_t
library_smoke_Properties_builtInTypeProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<uint32_t>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).get_built_in_type_property()
    );
}
void
library_smoke_Properties_builtInTypeProperty_set__UInt(FfiOpaqueHandle _self, int32_t _isolate_id, uint32_t value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).set_built_in_type_property(
            gluecodium::ffi::Conversion<uint32_t>::toCpp(value)
        );
}
float
library_smoke_Properties_readonlyProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<float>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).get_readonly_property()
    );
}
FfiOpaqueHandle
library_smoke_Properties_structProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::Properties::ExampleStruct>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).get_struct_property()
    );
}
void
library_smoke_Properties_structProperty_set__ExampleStruct(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).set_struct_property(
            gluecodium::ffi::Conversion<smoke::Properties::ExampleStruct>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_Properties_arrayProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::vector<std::string>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).get_array_property()
    );
}
void
library_smoke_Properties_arrayProperty_set__ListOf_String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).set_array_property(
            gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(value)
        );
}
uint32_t
library_smoke_Properties_complexTypeProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::Properties::InternalErrorCode>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).get_complex_type_property()
    );
}
void
library_smoke_Properties_complexTypeProperty_set__InternalErrorCode(FfiOpaqueHandle _self, int32_t _isolate_id, uint32_t value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).set_complex_type_property(
            gluecodium::ffi::Conversion<smoke::Properties::InternalErrorCode>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_Properties_byteBufferProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).get_byte_buffer_property()
    );
}
void
library_smoke_Properties_byteBufferProperty_set__Blob(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).set_byte_buffer_property(
            gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_Properties_instanceProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::PropertiesInterface>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).get_instance_property()
    );
}
void
library_smoke_Properties_instanceProperty_set__PropertiesInterface(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).set_instance_property(
            gluecodium::ffi::Conversion<std::shared_ptr<smoke::PropertiesInterface>>::toCpp(value)
        );
}
bool
library_smoke_Properties_isBooleanProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).is_boolean_property()
    );
}
void
library_smoke_Properties_isBooleanProperty_set__Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, bool value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Properties>>::toCpp(_self)).set_boolean_property(
            gluecodium::ffi::Conversion<bool>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_Properties_staticProperty_get(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        smoke::Properties::get_static_property()
    );
}
void
library_smoke_Properties_staticProperty_set__String(int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            smoke::Properties::set_static_property(
            gluecodium::ffi::Conversion<std::string>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_Properties_staticReadonlyProperty_get(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::Properties::ExampleStruct>::toFfi(
        smoke::Properties::get_static_readonly_property()
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Properties_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::Properties>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_Properties_release_handle(handle);
}
void
library_smoke_Properties_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Properties_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Properties_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::Properties>(
            *reinterpret_cast<std::shared_ptr<smoke::Properties>*>(handle)
        )
    );
}
void
library_smoke_Properties_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::Properties>*>(handle);
}
FfiOpaqueHandle
library_smoke_Properties_ExampleStruct_create_handle(double value) {
    auto _result = new (std::nothrow) smoke::Properties::ExampleStruct();
    _result->value = gluecodium::ffi::Conversion<double>::toCpp(value);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Properties_ExampleStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Properties::ExampleStruct*>(handle);
}
double
library_smoke_Properties_ExampleStruct_get_field_value(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::Properties::ExampleStruct*>(handle)->value
    );
}
FfiOpaqueHandle
library_smoke_Properties_ExampleStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::Properties::ExampleStruct>(
            gluecodium::ffi::Conversion<smoke::Properties::ExampleStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Properties_ExampleStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::Properties::ExampleStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Properties_ExampleStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Properties::ExampleStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::Properties::ExampleStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Properties_InternalErrorCode_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::Properties::InternalErrorCode>(
            gluecodium::ffi::Conversion<smoke::Properties::InternalErrorCode>::toCpp(value)
        )
    );
}
void
library_smoke_Properties_InternalErrorCode_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::Properties::InternalErrorCode>*>(handle);
}
uint32_t
library_smoke_Properties_InternalErrorCode_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Properties::InternalErrorCode>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::Properties::InternalErrorCode>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
