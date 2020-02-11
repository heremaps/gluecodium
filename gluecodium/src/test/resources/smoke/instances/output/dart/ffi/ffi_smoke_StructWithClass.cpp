#include "ffi_smoke_StructWithClass.h"
#include "ConversionBase.h"
#include "smoke/SimpleClass.h"
#include "smoke/StructWithClass.h"
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_StructWithClass_create_handle(FfiOpaqueHandle classInstance) {
    auto _result = new (std::nothrow) ::smoke::StructWithClass(gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp(classInstance));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_StructWithClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::StructWithClass*>(handle);
}
FfiOpaqueHandle
smoke_StructWithClass_get_field_classInstance(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleClass>>::toFfi(
        reinterpret_cast<::smoke::StructWithClass*>(handle)->class_instance
    );
}
FfiOpaqueHandle
smoke_StructWithClass_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::StructWithClass>(
            gluecodium::ffi::Conversion<::smoke::StructWithClass>::toCpp(value)
        )
    );
}
void
smoke_StructWithClass_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::StructWithClass>*>(handle);
}
FfiOpaqueHandle
smoke_StructWithClass_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::StructWithClass>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::StructWithClass>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
