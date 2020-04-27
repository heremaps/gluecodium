#include "ffi_smoke_LevelOne.h"
#include "ConversionBase.h"
#include "IsolateContext.h"
#include "smoke/LevelOne.h"
#include "smoke/OuterClass.h"
#include "smoke/OuterInterface.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_LevelOne_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::LevelOne>(
            *reinterpret_cast<std::shared_ptr<::smoke::LevelOne>*>(handle)
        )
    );
}
void
library_smoke_LevelOne_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::LevelOne>*>(handle);
}
FfiOpaqueHandle
library_smoke_LevelOne_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::LevelOne>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_LevelOne_LevelTwo_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::LevelOne::LevelTwo>(
            *reinterpret_cast<std::shared_ptr<::smoke::LevelOne::LevelTwo>*>(handle)
        )
    );
}
void
library_smoke_LevelOne_LevelTwo_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::LevelOne::LevelTwo>*>(handle);
}
FfiOpaqueHandle
library_smoke_LevelOne_LevelTwo_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::LevelOne::LevelTwo>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_LevelOne_LevelTwo_LevelThree_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>(
            *reinterpret_cast<std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>*>(handle)
        )
    );
}
void
library_smoke_LevelOne_LevelTwo_LevelThree_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>*>(handle);
}
FfiOpaqueHandle
library_smoke_LevelOne_LevelTwo_LevelThree_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle(FfiOpaqueHandle stringField) {
    auto _result = new (std::nothrow) ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour(gluecodium::ffi::Conversion<std::string>::toCpp(stringField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour*>(handle);
}
FfiOpaqueHandle
library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour*>(handle)->string_field
    );
}
FfiOpaqueHandle
library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>(
            gluecodium::ffi::Conversion<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>::toCpp(value)
        )
    );
}
void
library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>*>(handle);
}
FfiOpaqueHandle
library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>(
            gluecodium::ffi::Conversion<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>::toCpp(value)
        )
    );
}
void
library_smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>*>(handle);
}
uint32_t
library_smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
