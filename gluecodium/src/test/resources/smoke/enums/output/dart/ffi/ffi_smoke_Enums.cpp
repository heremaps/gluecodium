#include "ffi_smoke_Enums.h"
#include "ConversionBase.h"
#include "ReverseCache.h"
#include "IsolateContext.h"
#include "smoke/Enums.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
uint32_t
library_smoke_Enums_methodWithEnumeration__SimpleEnum(int32_t _isolate_id, uint32_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<::smoke::Enums::SimpleEnum>::toFfi(
        ::smoke::Enums::method_with_enumeration(
            gluecodium::ffi::Conversion<::smoke::Enums::SimpleEnum>::toCpp(input)
        )
    );
}
uint32_t
library_smoke_Enums_flipEnumValue__InternalErrorCode(int32_t _isolate_id, uint32_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toFfi(
        ::smoke::Enums::flip_enum_value(
            gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toCpp(input)
        )
    );
}
uint32_t
library_smoke_Enums_extractEnumFromStruct__ErrorStruct(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toFfi(
        ::smoke::Enums::extract_enum_from_struct(
            gluecodium::ffi::Conversion<::smoke::Enums::ErrorStruct>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Enums_createStructWithEnumInside__InternalErrorCode_String(int32_t _isolate_id, uint32_t type, FfiOpaqueHandle message) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<::smoke::Enums::ErrorStruct>::toFfi(
        ::smoke::Enums::create_struct_with_enum_inside(
            gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toCpp(type),
            gluecodium::ffi::Conversion<std::string>::toCpp(message)
        )
    );
}
FfiOpaqueHandle
library_smoke_Enums_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::Enums>(
            *reinterpret_cast<std::shared_ptr<::smoke::Enums>*>(handle)
        )
    );
}
void
library_smoke_Enums_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::Enums>*>(handle);
}
FfiOpaqueHandle
library_smoke_Enums_ErrorStruct_create_handle(uint32_t type, FfiOpaqueHandle message) {
    auto _result = new (std::nothrow) ::smoke::Enums::ErrorStruct(gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toCpp(type), gluecodium::ffi::Conversion<std::string>::toCpp(message));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Enums_ErrorStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Enums::ErrorStruct*>(handle);
}
uint32_t
library_smoke_Enums_ErrorStruct_get_field_type(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toFfi(
        reinterpret_cast<::smoke::Enums::ErrorStruct*>(handle)->type
    );
}
FfiOpaqueHandle
library_smoke_Enums_ErrorStruct_get_field_message(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<::smoke::Enums::ErrorStruct*>(handle)->message
    );
}
FfiOpaqueHandle
library_smoke_Enums_ErrorStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Enums::ErrorStruct>(
            gluecodium::ffi::Conversion<::smoke::Enums::ErrorStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Enums_ErrorStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Enums::ErrorStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Enums_ErrorStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Enums::ErrorStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Enums::ErrorStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Enums_SimpleEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Enums::SimpleEnum>(
            gluecodium::ffi::Conversion<::smoke::Enums::SimpleEnum>::toCpp(value)
        )
    );
}
void
library_smoke_Enums_SimpleEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Enums::SimpleEnum>*>(handle);
}
uint32_t
library_smoke_Enums_SimpleEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Enums::SimpleEnum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Enums::SimpleEnum>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Enums_InternalErrorCode_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Enums::InternalErrorCode>(
            gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toCpp(value)
        )
    );
}
void
library_smoke_Enums_InternalErrorCode_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Enums::InternalErrorCode>*>(handle);
}
uint32_t
library_smoke_Enums_InternalErrorCode_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Enums::InternalErrorCode>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
