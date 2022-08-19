#include "ffi_smoke_ExternalClass.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
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
library_smoke_ExternalClass_someMethod__Byte(FfiOpaqueHandle _self, int32_t _isolate_id, int8_t someParameter) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<fire::Baz>>::toCpp(_self)).some_Method(
        gluecodium::ffi::Conversion<int8_t>::toCpp(someParameter)
    );
}
FfiOpaqueHandle
library_smoke_ExternalClass_someProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<fire::Baz>>::toCpp(_self)).get_Me()
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_ExternalClass_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<fire::Baz>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_ExternalClass_release_handle(handle);
}
void
library_smoke_ExternalClass_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_ExternalClass_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_ExternalClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<fire::Baz>(
            *reinterpret_cast<std::shared_ptr<fire::Baz>*>(handle)
        )
    );
}
void
library_smoke_ExternalClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<fire::Baz>*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalClass_SomeStruct_create_handle(FfiOpaqueHandle someField) {
    auto _result = new (std::nothrow) fire::Baz::some_Struct();
    _result->some_Field = gluecodium::ffi::Conversion<std::string>::toCpp(someField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_ExternalClass_SomeStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<fire::Baz::some_Struct*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalClass_SomeStruct_get_field_someField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<fire::Baz::some_Struct*>(handle)->some_Field
    );
}
FfiOpaqueHandle
library_smoke_ExternalClass_SomeStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<fire::Baz::some_Struct>(
            gluecodium::ffi::Conversion<fire::Baz::some_Struct>::toCpp(value)
        )
    );
}
void
library_smoke_ExternalClass_SomeStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<fire::Baz::some_Struct>*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalClass_SomeStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<fire::Baz::some_Struct>::toFfi(
        **reinterpret_cast<gluecodium::optional<fire::Baz::some_Struct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_ExternalClass_SomeEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<fire::Baz::some_Enum>(
            gluecodium::ffi::Conversion<fire::Baz::some_Enum>::toCpp(value)
        )
    );
}
void
library_smoke_ExternalClass_SomeEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<fire::Baz::some_Enum>*>(handle);
}
uint32_t
library_smoke_ExternalClass_SomeEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<fire::Baz::some_Enum>::toFfi(
        **reinterpret_cast<gluecodium::optional<fire::Baz::some_Enum>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
