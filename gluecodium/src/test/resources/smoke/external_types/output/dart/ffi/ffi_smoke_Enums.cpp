#include "ffi_smoke_Enums.h"
#include "ConversionBase.h"
#include "IsolateContext.h"
#include "foo/Bar.h"
#include "smoke/Enums.h"
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
void
library_smoke_Enums_methodWithExternalEnum__External_1Enum(int32_t _isolate_id, uint32_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            ::smoke::Enums::method_with_external_enum(
            gluecodium::ffi::Conversion<::smoke::Enums::External_Enum>::toCpp(input)
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
library_smoke_Enums_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::Enums>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_Enums_ExternalEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Enums::External_Enum>(
            gluecodium::ffi::Conversion<::smoke::Enums::External_Enum>::toCpp(value)
        )
    );
}
void
library_smoke_Enums_ExternalEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Enums::External_Enum>*>(handle);
}
uint32_t
library_smoke_Enums_ExternalEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Enums::External_Enum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Enums::External_Enum>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Enums_VeryExternalEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::fire::SomeVeryExternalEnum>(
            gluecodium::ffi::Conversion<::fire::SomeVeryExternalEnum>::toCpp(value)
        )
    );
}
void
library_smoke_Enums_VeryExternalEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::fire::SomeVeryExternalEnum>*>(handle);
}
uint32_t
library_smoke_Enums_VeryExternalEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::fire::SomeVeryExternalEnum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::fire::SomeVeryExternalEnum>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
