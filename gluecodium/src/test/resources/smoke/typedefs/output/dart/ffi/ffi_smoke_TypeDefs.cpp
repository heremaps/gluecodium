#include "ffi_smoke_TypeDefs.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "gluecodium/VectorHash.h"
#include "smoke/TypeCollection.h"
#include "smoke/TypeDefs.h"
#include <memory>
#include <string>
#include <vector>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
double
library_smoke_TypeDefs_methodWithPrimitiveTypeDef__Double(int32_t _isolate_id, double input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<double>::toFfi(
        smoke::TypeDefs::method_with_primitive_type_def(
            gluecodium::ffi::Conversion<double>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_TypeDefs_methodWithComplexTypeDef__ListOf_1smoke_1TypeDefs_1TestStruct(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::vector<smoke::TypeDefs::TestStruct>>::toFfi(
        smoke::TypeDefs::method_with_complex_type_def(
            gluecodium::ffi::Conversion<std::vector<smoke::TypeDefs::TestStruct>>::toCpp(input)
        )
    );
}
double
library_smoke_TypeDefs_returnNestedIntTypeDef__Double(int32_t _isolate_id, double input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<double>::toFfi(
        smoke::TypeDefs::return_nested_int_type_def(
            gluecodium::ffi::Conversion<double>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_TypeDefs_returnTestStructTypeDef__TestStruct(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::TypeDefs::TestStruct>::toFfi(
        smoke::TypeDefs::return_test_struct_type_def(
            gluecodium::ffi::Conversion<smoke::TypeDefs::TestStruct>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_TypeDefs_returnNestedStructTypeDef__TestStruct(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::TypeDefs::TestStruct>::toFfi(
        smoke::TypeDefs::return_nested_struct_type_def(
            gluecodium::ffi::Conversion<smoke::TypeDefs::TestStruct>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_TypeDefs_returnTypeDefPointFromTypeCollection__Point(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::Point>::toFfi(
        smoke::TypeDefs::return_type_def_point_from_type_collection(
            gluecodium::ffi::Conversion<smoke::Point>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_TypeDefs_primitiveTypeProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::vector<double>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::TypeDefs>>::toCpp(_self)).get_primitive_type_property()
    );
}
void
library_smoke_TypeDefs_primitiveTypeProperty_set__ListOf_1Double(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::TypeDefs>>::toCpp(_self)).set_primitive_type_property(
            gluecodium::ffi::Conversion<std::vector<double>>::toCpp(value)
        );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_TypeDefs_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::TypeDefs>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_TypeDefs_release_handle(handle);
}
void
library_smoke_TypeDefs_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_TypeDefs_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_TypeDefs_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::TypeDefs>(
            *reinterpret_cast<std::shared_ptr<smoke::TypeDefs>*>(handle)
        )
    );
}
void
library_smoke_TypeDefs_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::TypeDefs>*>(handle);
}
FfiOpaqueHandle
library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle(double field) {
    auto _result = new (std::nothrow) smoke::TypeDefs::StructHavingAliasFieldDefinedBelow(gluecodium::ffi::Conversion<double>::toCpp(field));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::TypeDefs::StructHavingAliasFieldDefinedBelow*>(handle);
}
double
library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_field_field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::TypeDefs::StructHavingAliasFieldDefinedBelow*>(handle)->field
    );
}
FfiOpaqueHandle
library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::TypeDefs::StructHavingAliasFieldDefinedBelow>(
            gluecodium::ffi::Conversion<smoke::TypeDefs::StructHavingAliasFieldDefinedBelow>::toCpp(value)
        )
    );
}
void
library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::TypeDefs::StructHavingAliasFieldDefinedBelow>*>(handle);
}
FfiOpaqueHandle
library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::TypeDefs::StructHavingAliasFieldDefinedBelow>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::TypeDefs::StructHavingAliasFieldDefinedBelow>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_TypeDefs_TestStruct_create_handle(FfiOpaqueHandle something) {
    auto _result = new (std::nothrow) smoke::TypeDefs::TestStruct(gluecodium::ffi::Conversion<std::string>::toCpp(something));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_TypeDefs_TestStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::TypeDefs::TestStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_TypeDefs_TestStruct_get_field_something(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::TypeDefs::TestStruct*>(handle)->something
    );
}
FfiOpaqueHandle
library_smoke_TypeDefs_TestStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::TypeDefs::TestStruct>(
            gluecodium::ffi::Conversion<smoke::TypeDefs::TestStruct>::toCpp(value)
        )
    );
}
void
library_smoke_TypeDefs_TestStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::TypeDefs::TestStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_TypeDefs_TestStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::TypeDefs::TestStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::TypeDefs::TestStruct>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
