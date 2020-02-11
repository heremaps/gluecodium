#include "ffi_smoke_off_NestedPackages.h"
#include "ConversionBase.h"
#include "smoke/off/NestedPackages.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_off_NestedPackages_basicMethod__SomeStruct(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<::smoke::off::NestedPackages::SomeStruct>::toFfi(
        ::smoke::off::NestedPackages::basic_method(
            gluecodium::ffi::Conversion<::smoke::off::NestedPackages::SomeStruct>::toCpp(input)
        )
    );
}
void
smoke_off_NestedPackages_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::off::NestedPackages>*>(handle);
}
FfiOpaqueHandle
smoke_off_NestedPackages_SomeStruct_create_handle(FfiOpaqueHandle someField) {
    auto _result = new (std::nothrow) ::smoke::off::NestedPackages::SomeStruct(gluecodium::ffi::Conversion<std::string>::toCpp(someField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_off_NestedPackages_SomeStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::off::NestedPackages::SomeStruct*>(handle);
}
FfiOpaqueHandle
smoke_off_NestedPackages_SomeStruct_get_field_someField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<::smoke::off::NestedPackages::SomeStruct*>(handle)->some_field
    );
}
FfiOpaqueHandle
smoke_off_NestedPackages_SomeStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::off::NestedPackages::SomeStruct>(
            gluecodium::ffi::Conversion<::smoke::off::NestedPackages::SomeStruct>::toCpp(value)
        )
    );
}
void
smoke_off_NestedPackages_SomeStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::off::NestedPackages::SomeStruct>*>(handle);
}
FfiOpaqueHandle
smoke_off_NestedPackages_SomeStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::off::NestedPackages::SomeStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::off::NestedPackages::SomeStruct>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
