#include "ffi_smoke_ExternalClass.h"
#include "ConversionBase.h"
#include "foo/Bar.h"
#include <cstdint>
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
void
smoke_ExternalClass_someMethod__Byte(FfiOpaqueHandle _self, int8_t someParameter) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::fire::Baz>>::toCpp(_self)).some_Method(
            gluecodium::ffi::Conversion<int8_t>::toCpp(someParameter)
        );
}
FfiOpaqueHandle
smoke_ExternalClass_someProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::fire::Baz>>::toCpp(_self)).get_Me()
    );
}
void
smoke_ExternalClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::fire::Baz>*>(handle);
}
FfiOpaqueHandle
smoke_ExternalClass_SomeStruct_create_handle(FfiOpaqueHandle someField) {
    auto _result = new (std::nothrow) ::fire::Baz::some_Struct();
    _result->some_Field = gluecodium::ffi::Conversion<std::string>::toCpp(someField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_ExternalClass_SomeStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::fire::Baz::some_Struct*>(handle);
}
FfiOpaqueHandle
smoke_ExternalClass_SomeStruct_get_field_someField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<::fire::Baz::some_Struct*>(handle)->some_Field
    );
}
FfiOpaqueHandle
smoke_ExternalClass_SomeStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::fire::Baz::some_Struct>(
            gluecodium::ffi::Conversion<::fire::Baz::some_Struct>::toCpp(value)
        )
    );
}
void
smoke_ExternalClass_SomeStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::fire::Baz::some_Struct>*>(handle);
}
FfiOpaqueHandle
smoke_ExternalClass_SomeStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::fire::Baz::some_Struct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::fire::Baz::some_Struct>*>(handle)
    );
}
FfiOpaqueHandle
smoke_ExternalClass_SomeEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::fire::Baz::some_Enum>(
            gluecodium::ffi::Conversion<::fire::Baz::some_Enum>::toCpp(value)
        )
    );
}
void
smoke_ExternalClass_SomeEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::fire::Baz::some_Enum>*>(handle);
}
uint32_t
smoke_ExternalClass_SomeEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::fire::Baz::some_Enum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::fire::Baz::some_Enum>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
