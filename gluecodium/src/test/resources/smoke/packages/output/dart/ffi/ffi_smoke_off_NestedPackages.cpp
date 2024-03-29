#include "ffi_smoke_off_NestedPackages.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "smoke/off/NestedPackages.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_off_NestedPackages_basicMethod__SomeStruct(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::off::NestedPackages::SomeStruct>::toFfi(
        smoke::off::NestedPackages::basic_method(
            gluecodium::ffi::Conversion<smoke::off::NestedPackages::SomeStruct>::toCpp(input)
        )
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_off_NestedPackages_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::off::NestedPackages>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_off_NestedPackages_release_handle(handle);
}
void
library_smoke_off_NestedPackages_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_off_NestedPackages_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_off_NestedPackages_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::off::NestedPackages>(
            *reinterpret_cast<std::shared_ptr<smoke::off::NestedPackages>*>(handle)
        )
    );
}
void
library_smoke_off_NestedPackages_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::off::NestedPackages>*>(handle);
}
FfiOpaqueHandle
library_smoke_off_NestedPackages_SomeStruct_create_handle(FfiOpaqueHandle someField) {
    auto _result = new (std::nothrow) smoke::off::NestedPackages::SomeStruct();
    _result->some_field = gluecodium::ffi::Conversion<std::string>::toCpp(someField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_off_NestedPackages_SomeStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::off::NestedPackages::SomeStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_off_NestedPackages_SomeStruct_get_field_someField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::off::NestedPackages::SomeStruct*>(handle)->some_field
    );
}
FfiOpaqueHandle
library_smoke_off_NestedPackages_SomeStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::off::NestedPackages::SomeStruct>(
            gluecodium::ffi::Conversion<smoke::off::NestedPackages::SomeStruct>::toCpp(value)
        )
    );
}
void
library_smoke_off_NestedPackages_SomeStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::off::NestedPackages::SomeStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_off_NestedPackages_SomeStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::off::NestedPackages::SomeStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::off::NestedPackages::SomeStruct>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
