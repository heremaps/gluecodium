#include "ffi_smoke_Structs.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "gluecodium/VectorHash.h"
#include "non/Sense.h"
#include "smoke/Structs.h"
#include <cstdint>
#include <memory>
#include <string>
#include <vector>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_Structs_getExternalStruct(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::Structs::ExternalStruct>::toFfi(
        smoke::Structs::get_external_struct()
    );
}
FfiOpaqueHandle
library_smoke_Structs_getAnotherExternalStruct(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<fire::SomeVeryExternalStruct>::toFfi(
        smoke::Structs::get_another_external_struct()
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Structs_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::Structs>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_Structs_release_handle(handle);
}
void
library_smoke_Structs_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Structs_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Structs_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::Structs>(
            *reinterpret_cast<std::shared_ptr<smoke::Structs>*>(handle)
        )
    );
}
void
library_smoke_Structs_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::Structs>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_ExternalStruct_create_handle(FfiOpaqueHandle stringField, FfiOpaqueHandle externalStringField, FfiOpaqueHandle externalArrayField, FfiOpaqueHandle externalStructField) {
    auto _result = new (std::nothrow) smoke::Structs::ExternalStruct();
    _result->stringField = gluecodium::ffi::Conversion<std::string>::toCpp(stringField);
    _result->set_some_string(gluecodium::ffi::Conversion<std::string>::toCpp(externalStringField));
    _result->set_some_array(gluecodium::ffi::Conversion<std::vector<int8_t>>::toCpp(externalArrayField));
    _result->set_some_struct(gluecodium::ffi::Conversion<fire::SomeVeryExternalStruct>::toCpp(externalStructField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Structs_ExternalStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::ExternalStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_ExternalStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Structs::ExternalStruct*>(handle)->stringField
    );
}
FfiOpaqueHandle
library_smoke_Structs_ExternalStruct_get_field_externalStringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Structs::ExternalStruct*>(handle)->get_some_string()
    );
}
FfiOpaqueHandle
library_smoke_Structs_ExternalStruct_get_field_externalArrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::vector<int8_t>>::toFfi(
        reinterpret_cast<smoke::Structs::ExternalStruct*>(handle)->get_some_array()
    );
}
FfiOpaqueHandle
library_smoke_Structs_ExternalStruct_get_field_externalStructField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<fire::SomeVeryExternalStruct>::toFfi(
        reinterpret_cast<smoke::Structs::ExternalStruct*>(handle)->get_some_struct()
    );
}
FfiOpaqueHandle
library_smoke_Structs_ExternalStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Structs::ExternalStruct>(
            *reinterpret_cast<smoke::Structs::ExternalStruct*>(value)
        )
    );
}
void
library_smoke_Structs_ExternalStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Structs::ExternalStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_ExternalStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::ExternalStruct(
        **reinterpret_cast<std::optional<smoke::Structs::ExternalStruct>*>(handle)
    ));
}
FfiOpaqueHandle
library_smoke_Structs_AnotherExternalStruct_create_handle(int8_t intField) {
    auto _result = new (std::nothrow) fire::SomeVeryExternalStruct();
    _result->intField = gluecodium::ffi::Conversion<int8_t>::toCpp(intField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Structs_AnotherExternalStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<fire::SomeVeryExternalStruct*>(handle);
}
int8_t
library_smoke_Structs_AnotherExternalStruct_get_field_intField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int8_t>::toFfi(
        reinterpret_cast<fire::SomeVeryExternalStruct*>(handle)->intField
    );
}
FfiOpaqueHandle
library_smoke_Structs_AnotherExternalStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<fire::SomeVeryExternalStruct>(
            *reinterpret_cast<fire::SomeVeryExternalStruct*>(value)
        )
    );
}
void
library_smoke_Structs_AnotherExternalStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<fire::SomeVeryExternalStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Structs_AnotherExternalStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) fire::SomeVeryExternalStruct(
        **reinterpret_cast<std::optional<fire::SomeVeryExternalStruct>*>(handle)
    ));
}
#ifdef __cplusplus
}
#endif
