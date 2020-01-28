#include "ffi_smoke_TypeDefs.h"
#include "ConversionBase.h"
#include "smoke/TypeCollection.h"
#include "smoke/TypeDefs.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
double
smoke_TypeDefs_methodWithPrimitiveTypeDef__Double(double input) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        ::smoke::TypeDefs::method_with_primitive_type_def(
            gluecodium::ffi::Conversion<double>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_TypeDefs_methodWithComplexTypeDef__ListOf_1smoke_1TypeDefs_1TestStruct(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<std::vector<::smoke::TypeDefs::TestStruct>>::toFfi(
        ::smoke::TypeDefs::method_with_complex_type_def(
            gluecodium::ffi::Conversion<std::vector<::smoke::TypeDefs::TestStruct>>::toCpp(input)
        )
    );
}
double
smoke_TypeDefs_returnNestedIntTypeDef__Double(double input) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        ::smoke::TypeDefs::return_nested_int_type_def(
            gluecodium::ffi::Conversion<double>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_TypeDefs_returnTestStructTypeDef__TestStruct(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<::smoke::TypeDefs::TestStruct>::toFfi(
        ::smoke::TypeDefs::return_test_struct_type_def(
            gluecodium::ffi::Conversion<::smoke::TypeDefs::TestStruct>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_TypeDefs_returnNestedStructTypeDef__TestStruct(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<::smoke::TypeDefs::TestStruct>::toFfi(
        ::smoke::TypeDefs::return_nested_struct_type_def(
            gluecodium::ffi::Conversion<::smoke::TypeDefs::TestStruct>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_TypeDefs_returnTypeDefPointFromTypeCollection__Point(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<::smoke::Point>::toFfi(
        ::smoke::TypeDefs::return_type_def_point_from_type_collection(
            gluecodium::ffi::Conversion<::smoke::Point>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_TypeDefs_primitiveTypeProperty_get(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::vector<double>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::TypeDefs>>::toCpp(_self)).get_primitive_type_property()
    );
}
void
smoke_TypeDefs_primitiveTypeProperty_set__ListOf_1Double(FfiOpaqueHandle _self, FfiOpaqueHandle value) {
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::TypeDefs>>::toCpp(_self)).set_primitive_type_property(
            gluecodium::ffi::Conversion<std::vector<double>>::toCpp(value)
        );
}
void
smoke_TypeDefs_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::TypeDefs>*>(handle);
}
FfiOpaqueHandle
smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle(double field) {
    auto _result = new (std::nothrow) ::smoke::TypeDefs::StructHavingAliasFieldDefinedBelow(gluecodium::ffi::Conversion<double>::toCpp(field));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::TypeDefs::StructHavingAliasFieldDefinedBelow*>(handle);
}
double
smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_field_field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<::smoke::TypeDefs::StructHavingAliasFieldDefinedBelow*>(handle)->field
    );
}
FfiOpaqueHandle
smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::TypeDefs::StructHavingAliasFieldDefinedBelow>(
            gluecodium::ffi::Conversion<::smoke::TypeDefs::StructHavingAliasFieldDefinedBelow>::toCpp(value)
        )
    );
}
void
smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::TypeDefs::StructHavingAliasFieldDefinedBelow>*>(handle);
}
FfiOpaqueHandle
smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::TypeDefs::StructHavingAliasFieldDefinedBelow>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::TypeDefs::StructHavingAliasFieldDefinedBelow>*>(handle)
    );
}
FfiOpaqueHandle
smoke_TypeDefs_TestStruct_create_handle(FfiOpaqueHandle something) {
    auto _result = new (std::nothrow) ::smoke::TypeDefs::TestStruct(gluecodium::ffi::Conversion<std::string>::toCpp(something));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_TypeDefs_TestStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::TypeDefs::TestStruct*>(handle);
}
FfiOpaqueHandle
smoke_TypeDefs_TestStruct_get_field_something(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<::smoke::TypeDefs::TestStruct*>(handle)->something
    );
}
FfiOpaqueHandle
smoke_TypeDefs_TestStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::TypeDefs::TestStruct>(
            gluecodium::ffi::Conversion<::smoke::TypeDefs::TestStruct>::toCpp(value)
        )
    );
}
void
smoke_TypeDefs_TestStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::TypeDefs::TestStruct>*>(handle);
}
FfiOpaqueHandle
smoke_TypeDefs_TestStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::TypeDefs::TestStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::TypeDefs::TestStruct>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
