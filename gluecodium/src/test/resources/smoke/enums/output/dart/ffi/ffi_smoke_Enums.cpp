#include "ffi_smoke_Enums.h"
#include "ConversionBase.h"
#include "foo/Bar.h"
#include "smoke/Enums.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
uint32_t
smoke_Enums_methodWithEnumeration__SimpleEnum(uint32_t input) {
    return gluecodium::ffi::Conversion<::smoke::Enums::SimpleEnum>::toFfi(
        ::smoke::Enums::method_with_enumeration(
            gluecodium::ffi::Conversion<::smoke::Enums::SimpleEnum>::toCpp(input)
        )
    );
}
uint32_t
smoke_Enums_flipEnumValue__InternalErrorCode(uint32_t input) {
    return gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toFfi(
        ::smoke::Enums::flip_enum_value(
            gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toCpp(input)
        )
    );
}
uint32_t
smoke_Enums_extractEnumFromStruct__ErrorStruct(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toFfi(
        ::smoke::Enums::extract_enum_from_struct(
            gluecodium::ffi::Conversion<::smoke::Enums::ErrorStruct>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Enums_createStructWithEnumInside__InternalErrorCode_String(uint32_t type, FfiOpaqueHandle message) {
    return gluecodium::ffi::Conversion<::smoke::Enums::ErrorStruct>::toFfi(
        ::smoke::Enums::create_struct_with_enum_inside(
            gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toCpp(type),
            gluecodium::ffi::Conversion<std::string>::toCpp(message)
        )
    );
}
void
smoke_Enums_methodWithExternalEnum__External_1Enum(uint32_t input) {
            ::smoke::Enums::method_with_external_enum(
            gluecodium::ffi::Conversion<::smoke::Enums::External_Enum>::toCpp(input)
        );
}
void
smoke_Enums_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::Enums>*>(handle);
}
FfiOpaqueHandle
smoke_Enums_ErrorStruct_create_handle(uint32_t type, FfiOpaqueHandle message) {
    auto _result = new (std::nothrow) ::smoke::Enums::ErrorStruct(gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toCpp(type), gluecodium::ffi::Conversion<std::string>::toCpp(message));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_Enums_ErrorStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Enums::ErrorStruct*>(handle);
}
uint32_t
smoke_Enums_ErrorStruct_get_field_type(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<::smoke::Enums::InternalErrorCode>::toFfi(
        reinterpret_cast<::smoke::Enums::ErrorStruct*>(handle)->type
    );
}
FfiOpaqueHandle
smoke_Enums_ErrorStruct_get_field_message(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<::smoke::Enums::ErrorStruct*>(handle)->message
    );
}
#ifdef __cplusplus
}
#endif
