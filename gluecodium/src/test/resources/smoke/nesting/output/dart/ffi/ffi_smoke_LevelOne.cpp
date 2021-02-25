#include "ffi_smoke_LevelOne.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
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
library_smoke_LevelOne_LevelTwo_LevelThree_foo__InnerInterface(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::OuterInterface::InnerClass>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>>::toCpp(_self)).foo(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::OuterClass::InnerInterface>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_fooFactory(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>::toFfi(
        ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour::foo_factory()
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_LevelOne_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<::smoke::LevelOne>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_LevelOne_release_handle(handle);
}
void
library_smoke_LevelOne_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_LevelOne_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
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
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_LevelOne_LevelTwo_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<::smoke::LevelOne::LevelTwo>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_LevelOne_LevelTwo_release_handle(handle);
}
void
library_smoke_LevelOne_LevelTwo_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_LevelOne_LevelTwo_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
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
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_LevelOne_LevelTwo_LevelThree_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_LevelOne_LevelTwo_LevelThree_release_handle(handle);
}
void
library_smoke_LevelOne_LevelTwo_LevelThree_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_LevelOne_LevelTwo_LevelThree_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
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
