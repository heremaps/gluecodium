#include "ffi_smoke_Properties.h"
#include "ConversionBase.h"
#include "smoke/Properties.h"
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
uint32_t
smoke_Properties_builtInTypeProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<uint32_t>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).get_built_in_type_property()
    );
}
void
smoke_Properties_builtInTypeProperty_set__UInt(FfiOpaqueHandle _self, uint32_t value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).set_built_in_type_property(
            gluecodium::ffi::Conversion<uint32_t>::toCpp(value)
        );
}
float
smoke_Properties_readonlyProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<float>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).get_readonly_property()
    );
}
FfiOpaqueHandle
smoke_Properties_structProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<::smoke::Properties::ExampleStruct>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).get_struct_property()
    );
}
void
smoke_Properties_structProperty_set__ExampleStruct(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).set_struct_property(
            gluecodium::ffi::Conversion<::smoke::Properties::ExampleStruct>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Properties_arrayProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::vector<std::string>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).get_array_property()
    );
}
void
smoke_Properties_arrayProperty_set__ListOf_1String(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).set_array_property(
            gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(value)
        );
}
uint32_t
smoke_Properties_complexTypeProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<::smoke::Properties::InternalErrorCode>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).get_complex_type_property()
    );
}
void
smoke_Properties_complexTypeProperty_set__InternalErrorCode(FfiOpaqueHandle _self, uint32_t value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).set_complex_type_property(
            gluecodium::ffi::Conversion<::smoke::Properties::InternalErrorCode>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Properties_byteBufferProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).get_byte_buffer_property()
    );
}
void
smoke_Properties_byteBufferProperty_set__Blob(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).set_byte_buffer_property(
            gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Properties_instanceProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::PropertiesInterface>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).get_instance_property()
    );
}
void
smoke_Properties_instanceProperty_set__PropertiesInterface(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).set_instance_property(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::PropertiesInterface>>::toCpp(value)
        );
}
bool
smoke_Properties_isBooleanProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).is_boolean_property()
    );
}
void
smoke_Properties_isBooleanProperty_set__Boolean(FfiOpaqueHandle _self, bool value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Properties>>::toCpp(_self)).set_boolean_property(
            gluecodium::ffi::Conversion<bool>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Properties_staticProperty_get() {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        ::smoke::Properties::get_static_property()
    );
}
void
smoke_Properties_staticProperty_set__String(FfiOpaqueHandle value) {
            ::smoke::Properties::set_static_property(
            gluecodium::ffi::Conversion<std::string>::toCpp(value)
        );
}
FfiOpaqueHandle
smoke_Properties_staticReadonlyProperty_get() {
    return gluecodium::ffi::Conversion<::smoke::Properties::ExampleStruct>::toFfi(
        ::smoke::Properties::get_static_readonly_property()
    );
}
void
smoke_Properties_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::Properties>*>(handle);
}
FfiOpaqueHandle
smoke_Properties_ExampleStruct_create_handle(double value) {
    auto _result = new (std::nothrow) ::smoke::Properties::ExampleStruct(gluecodium::ffi::Conversion<double>::toCpp(value));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_Properties_ExampleStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Properties::ExampleStruct*>(handle);
}
double
smoke_Properties_ExampleStruct_get_field_value(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<::smoke::Properties::ExampleStruct*>(handle)->value
    );
}
FfiOpaqueHandle
smoke_Properties_ExampleStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Properties::ExampleStruct>(
            gluecodium::ffi::Conversion<::smoke::Properties::ExampleStruct>::toCpp(value)
        )
    );
}
void
smoke_Properties_ExampleStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Properties::ExampleStruct>*>(handle);
}
FfiOpaqueHandle
smoke_Properties_ExampleStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Properties::ExampleStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Properties::ExampleStruct>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Properties_InternalErrorCode_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Properties::InternalErrorCode>(
            gluecodium::ffi::Conversion<::smoke::Properties::InternalErrorCode>::toCpp(value)
        )
    );
}
void
smoke_Properties_InternalErrorCode_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Properties::InternalErrorCode>*>(handle);
}
uint32_t
smoke_Properties_InternalErrorCode_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Properties::InternalErrorCode>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Properties::InternalErrorCode>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
