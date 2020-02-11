#include "GenericTypesConversion.h"
#include "ConversionBase.h"
#include "alien/FooEnum.h"
#include "alien/FooStruct.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/DummyClass.h"
#include "smoke/DummyInterface.h"
#include "smoke/GenericTypesWithCompoundTypes.h"
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
ListOf_Float_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<float>());
}
void
ListOf_Float_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<float>*>(handle);
}
void
ListOf_Float_insert(FfiOpaqueHandle handle, float value) {
    reinterpret_cast<std::vector<float>*>(handle)->push_back(
        gluecodium::ffi::Conversion<float>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_Float_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<float>::iterator(
        reinterpret_cast<std::vector<float>*>(handle)->begin()
    ));
}
void
ListOf_Float_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<float>::iterator*>(iterator_handle);
}
bool
ListOf_Float_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<float>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<float>*>(handle)->end();
}
void
ListOf_Float_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<float>::iterator*>(iterator_handle);
}
float
ListOf_Float_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<float>::toFfi(
        **reinterpret_cast<std::vector<float>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_Float_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<float>>(
            gluecodium::ffi::Conversion<std::vector<float>>::toCpp(value)
        )
    );
}
void
ListOf_Float_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<float>>*>(handle);
}
FfiOpaqueHandle
ListOf_Float_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<float>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<float>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_Int_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<int32_t>());
}
void
ListOf_Int_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<int32_t>*>(handle);
}
void
ListOf_Int_insert(FfiOpaqueHandle handle, int32_t value) {
    reinterpret_cast<std::vector<int32_t>*>(handle)->push_back(
        gluecodium::ffi::Conversion<int32_t>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_Int_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<int32_t>::iterator(
        reinterpret_cast<std::vector<int32_t>*>(handle)->begin()
    ));
}
void
ListOf_Int_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<int32_t>::iterator*>(iterator_handle);
}
bool
ListOf_Int_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<int32_t>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<int32_t>*>(handle)->end();
}
void
ListOf_Int_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<int32_t>::iterator*>(iterator_handle);
}
int32_t
ListOf_Int_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        **reinterpret_cast<std::vector<int32_t>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_Int_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<int32_t>>(
            gluecodium::ffi::Conversion<std::vector<int32_t>>::toCpp(value)
        )
    );
}
void
ListOf_Int_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<int32_t>>*>(handle);
}
FfiOpaqueHandle
ListOf_Int_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<int32_t>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<int32_t>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_ListOf_Int_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::vector<int32_t>>());
}
void
ListOf_ListOf_Int_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<std::vector<int32_t>>*>(handle);
}
void
ListOf_ListOf_Int_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::vector<std::vector<int32_t>>*>(handle)->push_back(
        gluecodium::ffi::Conversion<std::vector<int32_t>>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_ListOf_Int_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::vector<int32_t>>::iterator(
        reinterpret_cast<std::vector<std::vector<int32_t>>*>(handle)->begin()
    ));
}
void
ListOf_ListOf_Int_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<std::vector<int32_t>>::iterator*>(iterator_handle);
}
bool
ListOf_ListOf_Int_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<std::vector<int32_t>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<std::vector<int32_t>>*>(handle)->end();
}
void
ListOf_ListOf_Int_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<std::vector<int32_t>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
ListOf_ListOf_Int_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::vector<int32_t>>::toFfi(
        **reinterpret_cast<std::vector<std::vector<int32_t>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_ListOf_Int_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<std::vector<int32_t>>>(
            gluecodium::ffi::Conversion<std::vector<std::vector<int32_t>>>::toCpp(value)
        )
    );
}
void
ListOf_ListOf_Int_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<std::vector<int32_t>>>*>(handle);
}
FfiOpaqueHandle
ListOf_ListOf_Int_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<std::vector<int32_t>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<std::vector<int32_t>>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_MapOf_Int_to_Boolean_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::unordered_map<int32_t, bool>>());
}
void
ListOf_MapOf_Int_to_Boolean_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<std::unordered_map<int32_t, bool>>*>(handle);
}
void
ListOf_MapOf_Int_to_Boolean_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::vector<std::unordered_map<int32_t, bool>>*>(handle)->push_back(
        gluecodium::ffi::Conversion<std::unordered_map<int32_t, bool>>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_MapOf_Int_to_Boolean_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::unordered_map<int32_t, bool>>::iterator(
        reinterpret_cast<std::vector<std::unordered_map<int32_t, bool>>*>(handle)->begin()
    ));
}
void
ListOf_MapOf_Int_to_Boolean_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<std::unordered_map<int32_t, bool>>::iterator*>(iterator_handle);
}
bool
ListOf_MapOf_Int_to_Boolean_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<std::unordered_map<int32_t, bool>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<std::unordered_map<int32_t, bool>>*>(handle)->end();
}
void
ListOf_MapOf_Int_to_Boolean_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<std::unordered_map<int32_t, bool>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
ListOf_MapOf_Int_to_Boolean_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, bool>>::toFfi(
        **reinterpret_cast<std::vector<std::unordered_map<int32_t, bool>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_MapOf_Int_to_Boolean_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<std::unordered_map<int32_t, bool>>>(
            gluecodium::ffi::Conversion<std::vector<std::unordered_map<int32_t, bool>>>::toCpp(value)
        )
    );
}
void
ListOf_MapOf_Int_to_Boolean_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<std::unordered_map<int32_t, bool>>>*>(handle);
}
FfiOpaqueHandle
ListOf_MapOf_Int_to_Boolean_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<std::unordered_map<int32_t, bool>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<std::unordered_map<int32_t, bool>>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_SetOf_Int_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::unordered_set<int32_t>>());
}
void
ListOf_SetOf_Int_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<std::unordered_set<int32_t>>*>(handle);
}
void
ListOf_SetOf_Int_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::vector<std::unordered_set<int32_t>>*>(handle)->push_back(
        gluecodium::ffi::Conversion<std::unordered_set<int32_t>>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_SetOf_Int_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::unordered_set<int32_t>>::iterator(
        reinterpret_cast<std::vector<std::unordered_set<int32_t>>*>(handle)->begin()
    ));
}
void
ListOf_SetOf_Int_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<std::unordered_set<int32_t>>::iterator*>(iterator_handle);
}
bool
ListOf_SetOf_Int_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<std::unordered_set<int32_t>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<std::unordered_set<int32_t>>*>(handle)->end();
}
void
ListOf_SetOf_Int_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<std::unordered_set<int32_t>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
ListOf_SetOf_Int_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::unordered_set<int32_t>>::toFfi(
        **reinterpret_cast<std::vector<std::unordered_set<int32_t>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_SetOf_Int_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<std::unordered_set<int32_t>>>(
            gluecodium::ffi::Conversion<std::vector<std::unordered_set<int32_t>>>::toCpp(value)
        )
    );
}
void
ListOf_SetOf_Int_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<std::unordered_set<int32_t>>>*>(handle);
}
FfiOpaqueHandle
ListOf_SetOf_Int_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<std::unordered_set<int32_t>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<std::unordered_set<int32_t>>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_String_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::string>());
}
void
ListOf_String_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<std::string>*>(handle);
}
void
ListOf_String_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::vector<std::string>*>(handle)->push_back(
        gluecodium::ffi::Conversion<std::string>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_String_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::string>::iterator(
        reinterpret_cast<std::vector<std::string>*>(handle)->begin()
    ));
}
void
ListOf_String_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<std::string>::iterator*>(iterator_handle);
}
bool
ListOf_String_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<std::string>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<std::string>*>(handle)->end();
}
void
ListOf_String_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<std::string>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
ListOf_String_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        **reinterpret_cast<std::vector<std::string>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_String_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<std::string>>(
            gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(value)
        )
    );
}
void
ListOf_String_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<std::string>>*>(handle);
}
FfiOpaqueHandle
ListOf_String_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<std::string>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<std::string>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_UByte_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<uint8_t>());
}
void
ListOf_UByte_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<uint8_t>*>(handle);
}
void
ListOf_UByte_insert(FfiOpaqueHandle handle, uint8_t value) {
    reinterpret_cast<std::vector<uint8_t>*>(handle)->push_back(
        gluecodium::ffi::Conversion<uint8_t>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_UByte_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<uint8_t>::iterator(
        reinterpret_cast<std::vector<uint8_t>*>(handle)->begin()
    ));
}
void
ListOf_UByte_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<uint8_t>::iterator*>(iterator_handle);
}
bool
ListOf_UByte_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<uint8_t>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<uint8_t>*>(handle)->end();
}
void
ListOf_UByte_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<uint8_t>::iterator*>(iterator_handle);
}
uint8_t
ListOf_UByte_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<uint8_t>::toFfi(
        **reinterpret_cast<std::vector<uint8_t>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_UByte_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<uint8_t>>(
            gluecodium::ffi::Conversion<std::vector<uint8_t>>::toCpp(value)
        )
    );
}
void
ListOf_UByte_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<uint8_t>>*>(handle);
}
FfiOpaqueHandle
ListOf_UByte_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<uint8_t>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<uint8_t>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_DummyClass_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::shared_ptr<::smoke::DummyClass>>());
}
void
ListOf_smoke_DummyClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyClass>>*>(handle);
}
void
ListOf_smoke_DummyClass_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyClass>>*>(handle)->push_back(
        gluecodium::ffi::Conversion<std::shared_ptr<::smoke::DummyClass>>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_smoke_DummyClass_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::shared_ptr<::smoke::DummyClass>>::iterator(
        reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyClass>>*>(handle)->begin()
    ));
}
void
ListOf_smoke_DummyClass_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyClass>>::iterator*>(iterator_handle);
}
bool
ListOf_smoke_DummyClass_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyClass>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyClass>>*>(handle)->end();
}
void
ListOf_smoke_DummyClass_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyClass>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
ListOf_smoke_DummyClass_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::DummyClass>>::toFfi(
        **reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyClass>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_DummyClass_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<std::shared_ptr<::smoke::DummyClass>>>(
            gluecodium::ffi::Conversion<std::vector<std::shared_ptr<::smoke::DummyClass>>>::toCpp(value)
        )
    );
}
void
ListOf_smoke_DummyClass_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<std::shared_ptr<::smoke::DummyClass>>>*>(handle);
}
FfiOpaqueHandle
ListOf_smoke_DummyClass_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<std::shared_ptr<::smoke::DummyClass>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<std::shared_ptr<::smoke::DummyClass>>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_DummyInterface_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::shared_ptr<::smoke::DummyInterface>>());
}
void
ListOf_smoke_DummyInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyInterface>>*>(handle);
}
void
ListOf_smoke_DummyInterface_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyInterface>>*>(handle)->push_back(
        gluecodium::ffi::Conversion<std::shared_ptr<::smoke::DummyInterface>>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_smoke_DummyInterface_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::shared_ptr<::smoke::DummyInterface>>::iterator(
        reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyInterface>>*>(handle)->begin()
    ));
}
void
ListOf_smoke_DummyInterface_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyInterface>>::iterator*>(iterator_handle);
}
bool
ListOf_smoke_DummyInterface_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyInterface>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyInterface>>*>(handle)->end();
}
void
ListOf_smoke_DummyInterface_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyInterface>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
ListOf_smoke_DummyInterface_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::DummyInterface>>::toFfi(
        **reinterpret_cast<std::vector<std::shared_ptr<::smoke::DummyInterface>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_DummyInterface_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<std::shared_ptr<::smoke::DummyInterface>>>(
            gluecodium::ffi::Conversion<std::vector<std::shared_ptr<::smoke::DummyInterface>>>::toCpp(value)
        )
    );
}
void
ListOf_smoke_DummyInterface_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<std::shared_ptr<::smoke::DummyInterface>>>*>(handle);
}
FfiOpaqueHandle
ListOf_smoke_DummyInterface_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<std::shared_ptr<::smoke::DummyInterface>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<std::shared_ptr<::smoke::DummyInterface>>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>());
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>*>(handle);
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>*>(handle)->push_back(
        gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::iterator(
        reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>*>(handle)->begin()
    ));
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::iterator*>(iterator_handle);
}
bool
ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>*>(handle)->end();
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::toFfi(
        **reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>>(
            gluecodium::ffi::Conversion<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>>::toCpp(value)
        )
    );
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>>*>(handle);
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<::alien::FooEnum>());
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<::alien::FooEnum>*>(handle);
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert(FfiOpaqueHandle handle, uint32_t value) {
    reinterpret_cast<std::vector<::alien::FooEnum>*>(handle)->push_back(
        gluecodium::ffi::Conversion<::alien::FooEnum>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<::alien::FooEnum>::iterator(
        reinterpret_cast<std::vector<::alien::FooEnum>*>(handle)->begin()
    ));
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<::alien::FooEnum>::iterator*>(iterator_handle);
}
bool
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<::alien::FooEnum>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<::alien::FooEnum>*>(handle)->end();
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<::alien::FooEnum>::iterator*>(iterator_handle);
}
uint32_t
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::alien::FooEnum>::toFfi(
        **reinterpret_cast<std::vector<::alien::FooEnum>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<::alien::FooEnum>>(
            gluecodium::ffi::Conversion<std::vector<::alien::FooEnum>>::toCpp(value)
        )
    );
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<::alien::FooEnum>>*>(handle);
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<::alien::FooEnum>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<::alien::FooEnum>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<::alien::FooStruct>());
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<::alien::FooStruct>*>(handle);
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::vector<::alien::FooStruct>*>(handle)->push_back(
        gluecodium::ffi::Conversion<::alien::FooStruct>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<::alien::FooStruct>::iterator(
        reinterpret_cast<std::vector<::alien::FooStruct>*>(handle)->begin()
    ));
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<::alien::FooStruct>::iterator*>(iterator_handle);
}
bool
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<::alien::FooStruct>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<::alien::FooStruct>*>(handle)->end();
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<::alien::FooStruct>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::alien::FooStruct>::toFfi(
        **reinterpret_cast<std::vector<::alien::FooStruct>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<::alien::FooStruct>>(
            gluecodium::ffi::Conversion<std::vector<::alien::FooStruct>>::toCpp(value)
        )
    );
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<::alien::FooStruct>>*>(handle);
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<::alien::FooStruct>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<::alien::FooStruct>>*>(handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>());
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>*>(handle);
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert(FfiOpaqueHandle handle, uint32_t value) {
    reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>*>(handle)->push_back(
        gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::toCpp(value)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::iterator(
        reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>*>(handle)->begin()
    ));
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::iterator*>(iterator_handle);
}
bool
ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>*>(handle)->end();
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::iterator*>(iterator_handle);
}
uint32_t
ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::toFfi(
        **reinterpret_cast<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>(
            gluecodium::ffi::Conversion<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::toCpp(value)
        )
    );
}
void
ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle);
}
FfiOpaqueHandle
ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_Float_to_Double_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<float, double>());
}
void
MapOf_Float_to_Double_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<float, double>*>(handle);
}
void
MapOf_Float_to_Double_put(FfiOpaqueHandle handle, float key, double value) {
    reinterpret_cast<std::unordered_map<float, double>*>(handle)->emplace(
        gluecodium::ffi::Conversion<float>::toCpp(key),
        gluecodium::ffi::Conversion<double>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_Float_to_Double_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<float, double>::iterator(
        reinterpret_cast<std::unordered_map<float, double>*>(handle)->begin()
    ));
}
void
MapOf_Float_to_Double_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<float, double>::iterator*>(iterator_handle);
}
bool
MapOf_Float_to_Double_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<float, double>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<float, double>*>(handle)->end();
}
void
MapOf_Float_to_Double_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<float, double>::iterator*>(iterator_handle);
}
float
MapOf_Float_to_Double_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<float>::toFfi(
        (*reinterpret_cast<std::unordered_map<float, double>::iterator*>(iterator_handle))->first
    );
}
double
MapOf_Float_to_Double_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        (*reinterpret_cast<std::unordered_map<float, double>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_Float_to_Double_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<float, double>>(
            gluecodium::ffi::Conversion<std::unordered_map<float, double>>::toCpp(value)
        )
    );
}
void
MapOf_Float_to_Double_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<float, double>>*>(handle);
}
FfiOpaqueHandle
MapOf_Float_to_Double_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<float, double>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<float, double>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_Int_to_Boolean_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, bool>());
}
void
MapOf_Int_to_Boolean_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, bool>*>(handle);
}
void
MapOf_Int_to_Boolean_put(FfiOpaqueHandle handle, int32_t key, bool value) {
    reinterpret_cast<std::unordered_map<int32_t, bool>*>(handle)->emplace(
        gluecodium::ffi::Conversion<int32_t>::toCpp(key),
        gluecodium::ffi::Conversion<bool>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_Int_to_Boolean_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, bool>::iterator(
        reinterpret_cast<std::unordered_map<int32_t, bool>*>(handle)->begin()
    ));
}
void
MapOf_Int_to_Boolean_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, bool>::iterator*>(iterator_handle);
}
bool
MapOf_Int_to_Boolean_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<int32_t, bool>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<int32_t, bool>*>(handle)->end();
}
void
MapOf_Int_to_Boolean_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<int32_t, bool>::iterator*>(iterator_handle);
}
int32_t
MapOf_Int_to_Boolean_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, bool>::iterator*>(iterator_handle))->first
    );
}
bool
MapOf_Int_to_Boolean_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, bool>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_Int_to_Boolean_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<int32_t, bool>>(
            gluecodium::ffi::Conversion<std::unordered_map<int32_t, bool>>::toCpp(value)
        )
    );
}
void
MapOf_Int_to_Boolean_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, bool>>*>(handle);
}
FfiOpaqueHandle
MapOf_Int_to_Boolean_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, bool>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, bool>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_Int_to_ListOf_Int_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, std::vector<int32_t>>());
}
void
MapOf_Int_to_ListOf_Int_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::vector<int32_t>>*>(handle);
}
void
MapOf_Int_to_ListOf_Int_put(FfiOpaqueHandle handle, int32_t key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<int32_t, std::vector<int32_t>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<int32_t>::toCpp(key),
        gluecodium::ffi::Conversion<std::vector<int32_t>>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_Int_to_ListOf_Int_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, std::vector<int32_t>>::iterator(
        reinterpret_cast<std::unordered_map<int32_t, std::vector<int32_t>>*>(handle)->begin()
    ));
}
void
MapOf_Int_to_ListOf_Int_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::vector<int32_t>>::iterator*>(iterator_handle);
}
bool
MapOf_Int_to_ListOf_Int_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<int32_t, std::vector<int32_t>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<int32_t, std::vector<int32_t>>*>(handle)->end();
}
void
MapOf_Int_to_ListOf_Int_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<int32_t, std::vector<int32_t>>::iterator*>(iterator_handle);
}
int32_t
MapOf_Int_to_ListOf_Int_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, std::vector<int32_t>>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
MapOf_Int_to_ListOf_Int_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::vector<int32_t>>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, std::vector<int32_t>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_Int_to_ListOf_Int_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<int32_t, std::vector<int32_t>>>(
            gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::vector<int32_t>>>::toCpp(value)
        )
    );
}
void
MapOf_Int_to_ListOf_Int_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, std::vector<int32_t>>>*>(handle);
}
FfiOpaqueHandle
MapOf_Int_to_ListOf_Int_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::vector<int32_t>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, std::vector<int32_t>>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_Int_to_MapOf_Int_to_Boolean_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>());
}
void
MapOf_Int_to_MapOf_Int_to_Boolean_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>*>(handle);
}
void
MapOf_Int_to_MapOf_Int_to_Boolean_put(FfiOpaqueHandle handle, int32_t key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<int32_t>::toCpp(key),
        gluecodium::ffi::Conversion<std::unordered_map<int32_t, bool>>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_Int_to_MapOf_Int_to_Boolean_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>::iterator(
        reinterpret_cast<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>*>(handle)->begin()
    ));
}
void
MapOf_Int_to_MapOf_Int_to_Boolean_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>::iterator*>(iterator_handle);
}
bool
MapOf_Int_to_MapOf_Int_to_Boolean_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>*>(handle)->end();
}
void
MapOf_Int_to_MapOf_Int_to_Boolean_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>::iterator*>(iterator_handle);
}
int32_t
MapOf_Int_to_MapOf_Int_to_Boolean_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
MapOf_Int_to_MapOf_Int_to_Boolean_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, bool>>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_Int_to_MapOf_Int_to_Boolean_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>>(
            gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>>::toCpp(value)
        )
    );
}
void
MapOf_Int_to_MapOf_Int_to_Boolean_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>>*>(handle);
}
FfiOpaqueHandle
MapOf_Int_to_MapOf_Int_to_Boolean_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, std::unordered_map<int32_t, bool>>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_Int_to_SetOf_Int_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, std::unordered_set<int32_t>>());
}
void
MapOf_Int_to_SetOf_Int_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::unordered_set<int32_t>>*>(handle);
}
void
MapOf_Int_to_SetOf_Int_put(FfiOpaqueHandle handle, int32_t key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<int32_t, std::unordered_set<int32_t>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<int32_t>::toCpp(key),
        gluecodium::ffi::Conversion<std::unordered_set<int32_t>>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_Int_to_SetOf_Int_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, std::unordered_set<int32_t>>::iterator(
        reinterpret_cast<std::unordered_map<int32_t, std::unordered_set<int32_t>>*>(handle)->begin()
    ));
}
void
MapOf_Int_to_SetOf_Int_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::unordered_set<int32_t>>::iterator*>(iterator_handle);
}
bool
MapOf_Int_to_SetOf_Int_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<int32_t, std::unordered_set<int32_t>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<int32_t, std::unordered_set<int32_t>>*>(handle)->end();
}
void
MapOf_Int_to_SetOf_Int_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<int32_t, std::unordered_set<int32_t>>::iterator*>(iterator_handle);
}
int32_t
MapOf_Int_to_SetOf_Int_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, std::unordered_set<int32_t>>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
MapOf_Int_to_SetOf_Int_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::unordered_set<int32_t>>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, std::unordered_set<int32_t>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_Int_to_SetOf_Int_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<int32_t, std::unordered_set<int32_t>>>(
            gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::unordered_set<int32_t>>>::toCpp(value)
        )
    );
}
void
MapOf_Int_to_SetOf_Int_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, std::unordered_set<int32_t>>>*>(handle);
}
FfiOpaqueHandle
MapOf_Int_to_SetOf_Int_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::unordered_set<int32_t>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, std::unordered_set<int32_t>>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_DummyClass_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>());
}
void
MapOf_Int_to_smoke_DummyClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>*>(handle);
}
void
MapOf_Int_to_smoke_DummyClass_put(FfiOpaqueHandle handle, int32_t key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<int32_t>::toCpp(key),
        gluecodium::ffi::Conversion<std::shared_ptr<::smoke::DummyClass>>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_DummyClass_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>::iterator(
        reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>*>(handle)->begin()
    ));
}
void
MapOf_Int_to_smoke_DummyClass_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>::iterator*>(iterator_handle);
}
bool
MapOf_Int_to_smoke_DummyClass_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>*>(handle)->end();
}
void
MapOf_Int_to_smoke_DummyClass_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>::iterator*>(iterator_handle);
}
int32_t
MapOf_Int_to_smoke_DummyClass_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_DummyClass_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::DummyClass>>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_DummyClass_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>>(
            gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>>::toCpp(value)
        )
    );
}
void
MapOf_Int_to_smoke_DummyClass_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>>*>(handle);
}
FfiOpaqueHandle
MapOf_Int_to_smoke_DummyClass_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_DummyInterface_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>());
}
void
MapOf_Int_to_smoke_DummyInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>*>(handle);
}
void
MapOf_Int_to_smoke_DummyInterface_put(FfiOpaqueHandle handle, int32_t key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<int32_t>::toCpp(key),
        gluecodium::ffi::Conversion<std::shared_ptr<::smoke::DummyInterface>>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_DummyInterface_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>::iterator(
        reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>*>(handle)->begin()
    ));
}
void
MapOf_Int_to_smoke_DummyInterface_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>::iterator*>(iterator_handle);
}
bool
MapOf_Int_to_smoke_DummyInterface_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>*>(handle)->end();
}
void
MapOf_Int_to_smoke_DummyInterface_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>::iterator*>(iterator_handle);
}
int32_t
MapOf_Int_to_smoke_DummyInterface_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_DummyInterface_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::DummyInterface>>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_DummyInterface_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>>(
            gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>>::toCpp(value)
        )
    );
}
void
MapOf_Int_to_smoke_DummyInterface_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>>*>(handle);
}
FfiOpaqueHandle
MapOf_Int_to_smoke_DummyInterface_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, ::alien::FooEnum>());
}
void
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, ::alien::FooEnum>*>(handle);
}
void
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_put(FfiOpaqueHandle handle, int32_t key, uint32_t value) {
    reinterpret_cast<std::unordered_map<int32_t, ::alien::FooEnum>*>(handle)->emplace(
        gluecodium::ffi::Conversion<int32_t>::toCpp(key),
        gluecodium::ffi::Conversion<::alien::FooEnum>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, ::alien::FooEnum>::iterator(
        reinterpret_cast<std::unordered_map<int32_t, ::alien::FooEnum>*>(handle)->begin()
    ));
}
void
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, ::alien::FooEnum>::iterator*>(iterator_handle);
}
bool
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<int32_t, ::alien::FooEnum>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<int32_t, ::alien::FooEnum>*>(handle)->end();
}
void
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<int32_t, ::alien::FooEnum>::iterator*>(iterator_handle);
}
int32_t
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, ::alien::FooEnum>::iterator*>(iterator_handle))->first
    );
}
uint32_t
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::alien::FooEnum>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, ::alien::FooEnum>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<int32_t, ::alien::FooEnum>>(
            gluecodium::ffi::Conversion<std::unordered_map<int32_t, ::alien::FooEnum>>::toCpp(value)
        )
    );
}
void
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, ::alien::FooEnum>>*>(handle);
}
FfiOpaqueHandle
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, ::alien::FooEnum>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, ::alien::FooEnum>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>());
}
void
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>*>(handle);
}
void
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_put(FfiOpaqueHandle handle, int32_t key, uint32_t value) {
    reinterpret_cast<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>*>(handle)->emplace(
        gluecodium::ffi::Conversion<int32_t>::toCpp(key),
        gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>::iterator(
        reinterpret_cast<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>*>(handle)->begin()
    ));
}
void
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>::iterator*>(iterator_handle);
}
bool
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>*>(handle)->end();
}
void
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>::iterator*>(iterator_handle);
}
int32_t
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>::iterator*>(iterator_handle))->first
    );
}
uint32_t
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::toFfi(
        (*reinterpret_cast<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>>(
            gluecodium::ffi::Conversion<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::toCpp(value)
        )
    );
}
void
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle);
}
FfiOpaqueHandle
MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_ListOf_Int_to_Boolean_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>());
}
void
MapOf_ListOf_Int_to_Boolean_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>*>(handle);
}
void
MapOf_ListOf_Int_to_Boolean_put(FfiOpaqueHandle handle, FfiOpaqueHandle key, bool value) {
    reinterpret_cast<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<std::vector<int32_t>>::toCpp(key),
        gluecodium::ffi::Conversion<bool>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_ListOf_Int_to_Boolean_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>::iterator(
        reinterpret_cast<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>*>(handle)->begin()
    ));
}
void
MapOf_ListOf_Int_to_Boolean_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>::iterator*>(iterator_handle);
}
bool
MapOf_ListOf_Int_to_Boolean_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>*>(handle)->end();
}
void
MapOf_ListOf_Int_to_Boolean_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
MapOf_ListOf_Int_to_Boolean_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::vector<int32_t>>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>::iterator*>(iterator_handle))->first
    );
}
bool
MapOf_ListOf_Int_to_Boolean_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_ListOf_Int_to_Boolean_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>>(
            gluecodium::ffi::Conversion<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>>::toCpp(value)
        )
    );
}
void
MapOf_ListOf_Int_to_Boolean_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>>*>(handle);
}
FfiOpaqueHandle
MapOf_ListOf_Int_to_Boolean_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<std::vector<int32_t>, bool, gluecodium::hash<std::vector<int32_t>>>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_MapOf_Int_to_Boolean_to_Boolean_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>());
}
void
MapOf_MapOf_Int_to_Boolean_to_Boolean_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>*>(handle);
}
void
MapOf_MapOf_Int_to_Boolean_to_Boolean_put(FfiOpaqueHandle handle, FfiOpaqueHandle key, bool value) {
    reinterpret_cast<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<std::unordered_map<int32_t, bool>>::toCpp(key),
        gluecodium::ffi::Conversion<bool>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_MapOf_Int_to_Boolean_to_Boolean_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>::iterator(
        reinterpret_cast<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>*>(handle)->begin()
    ));
}
void
MapOf_MapOf_Int_to_Boolean_to_Boolean_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>::iterator*>(iterator_handle);
}
bool
MapOf_MapOf_Int_to_Boolean_to_Boolean_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>*>(handle)->end();
}
void
MapOf_MapOf_Int_to_Boolean_to_Boolean_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
MapOf_MapOf_Int_to_Boolean_to_Boolean_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, bool>>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>::iterator*>(iterator_handle))->first
    );
}
bool
MapOf_MapOf_Int_to_Boolean_to_Boolean_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_MapOf_Int_to_Boolean_to_Boolean_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>>(
            gluecodium::ffi::Conversion<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>>::toCpp(value)
        )
    );
}
void
MapOf_MapOf_Int_to_Boolean_to_Boolean_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>>*>(handle);
}
FfiOpaqueHandle
MapOf_MapOf_Int_to_Boolean_to_Boolean_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<std::unordered_map<int32_t, bool>, bool, gluecodium::hash<std::unordered_map<int32_t, bool>>>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_SetOf_Int_to_Boolean_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>());
}
void
MapOf_SetOf_Int_to_Boolean_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>*>(handle);
}
void
MapOf_SetOf_Int_to_Boolean_put(FfiOpaqueHandle handle, FfiOpaqueHandle key, bool value) {
    reinterpret_cast<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<std::unordered_set<int32_t>>::toCpp(key),
        gluecodium::ffi::Conversion<bool>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_SetOf_Int_to_Boolean_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>::iterator(
        reinterpret_cast<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>*>(handle)->begin()
    ));
}
void
MapOf_SetOf_Int_to_Boolean_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>::iterator*>(iterator_handle);
}
bool
MapOf_SetOf_Int_to_Boolean_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>*>(handle)->end();
}
void
MapOf_SetOf_Int_to_Boolean_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
MapOf_SetOf_Int_to_Boolean_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::unordered_set<int32_t>>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>::iterator*>(iterator_handle))->first
    );
}
bool
MapOf_SetOf_Int_to_Boolean_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_SetOf_Int_to_Boolean_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>>(
            gluecodium::ffi::Conversion<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>>::toCpp(value)
        )
    );
}
void
MapOf_SetOf_Int_to_Boolean_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>>*>(handle);
}
FfiOpaqueHandle
MapOf_SetOf_Int_to_Boolean_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<std::unordered_set<int32_t>, bool, gluecodium::hash<std::unordered_set<int32_t>>>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_String_to_String_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::string, std::string>());
}
void
MapOf_String_to_String_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<std::string, std::string>*>(handle);
}
void
MapOf_String_to_String_put(FfiOpaqueHandle handle, FfiOpaqueHandle key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<std::string, std::string>*>(handle)->emplace(
        gluecodium::ffi::Conversion<std::string>::toCpp(key),
        gluecodium::ffi::Conversion<std::string>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_String_to_String_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::string, std::string>::iterator(
        reinterpret_cast<std::unordered_map<std::string, std::string>*>(handle)->begin()
    ));
}
void
MapOf_String_to_String_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, std::string>::iterator*>(iterator_handle);
}
bool
MapOf_String_to_String_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, std::string>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<std::string, std::string>*>(handle)->end();
}
void
MapOf_String_to_String_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, std::string>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
MapOf_String_to_String_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::string, std::string>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
MapOf_String_to_String_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::string, std::string>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_String_to_String_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<std::string, std::string>>(
            gluecodium::ffi::Conversion<std::unordered_map<std::string, std::string>>::toCpp(value)
        )
    );
}
void
MapOf_String_to_String_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<std::string, std::string>>*>(handle);
}
FfiOpaqueHandle
MapOf_String_to_String_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<std::string, std::string>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<std::string, std::string>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>());
}
void
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>*>(handle);
}
void
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_put(FfiOpaqueHandle handle, FfiOpaqueHandle key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>*>(handle)->emplace(
        gluecodium::ffi::Conversion<std::string>::toCpp(key),
        gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>::iterator(
        reinterpret_cast<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>*>(handle)->begin()
    ));
}
void
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>::iterator*>(iterator_handle);
}
bool
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>*>(handle)->end();
}
void
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>>(
            gluecodium::ffi::Conversion<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>>::toCpp(value)
        )
    );
}
void
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>>*>(handle);
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::string, ::alien::FooStruct>());
}
void
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<std::string, ::alien::FooStruct>*>(handle);
}
void
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_put(FfiOpaqueHandle handle, FfiOpaqueHandle key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<std::string, ::alien::FooStruct>*>(handle)->emplace(
        gluecodium::ffi::Conversion<std::string>::toCpp(key),
        gluecodium::ffi::Conversion<::alien::FooStruct>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::string, ::alien::FooStruct>::iterator(
        reinterpret_cast<std::unordered_map<std::string, ::alien::FooStruct>*>(handle)->begin()
    ));
}
void
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, ::alien::FooStruct>::iterator*>(iterator_handle);
}
bool
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, ::alien::FooStruct>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<std::string, ::alien::FooStruct>*>(handle)->end();
}
void
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, ::alien::FooStruct>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::string, ::alien::FooStruct>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::alien::FooStruct>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::string, ::alien::FooStruct>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<std::string, ::alien::FooStruct>>(
            gluecodium::ffi::Conversion<std::unordered_map<std::string, ::alien::FooStruct>>::toCpp(value)
        )
    );
}
void
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<std::string, ::alien::FooStruct>>*>(handle);
}
FfiOpaqueHandle
MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<std::string, ::alien::FooStruct>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<std::string, ::alien::FooStruct>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_UByte_to_String_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<uint8_t, std::string>());
}
void
MapOf_UByte_to_String_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<uint8_t, std::string>*>(handle);
}
void
MapOf_UByte_to_String_put(FfiOpaqueHandle handle, uint8_t key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<uint8_t, std::string>*>(handle)->emplace(
        gluecodium::ffi::Conversion<uint8_t>::toCpp(key),
        gluecodium::ffi::Conversion<std::string>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_UByte_to_String_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<uint8_t, std::string>::iterator(
        reinterpret_cast<std::unordered_map<uint8_t, std::string>*>(handle)->begin()
    ));
}
void
MapOf_UByte_to_String_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<uint8_t, std::string>::iterator*>(iterator_handle);
}
bool
MapOf_UByte_to_String_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<uint8_t, std::string>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<uint8_t, std::string>*>(handle)->end();
}
void
MapOf_UByte_to_String_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<uint8_t, std::string>::iterator*>(iterator_handle);
}
uint8_t
MapOf_UByte_to_String_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<uint8_t>::toFfi(
        (*reinterpret_cast<std::unordered_map<uint8_t, std::string>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
MapOf_UByte_to_String_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*reinterpret_cast<std::unordered_map<uint8_t, std::string>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_UByte_to_String_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<uint8_t, std::string>>(
            gluecodium::ffi::Conversion<std::unordered_map<uint8_t, std::string>>::toCpp(value)
        )
    );
}
void
MapOf_UByte_to_String_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<uint8_t, std::string>>*>(handle);
}
FfiOpaqueHandle
MapOf_UByte_to_String_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<uint8_t, std::string>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<uint8_t, std::string>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>());
}
void
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>*>(handle);
}
void
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_put(FfiOpaqueHandle handle, uint32_t key, bool value) {
    reinterpret_cast<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<::alien::FooEnum>::toCpp(key),
        gluecodium::ffi::Conversion<bool>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>::iterator(
        reinterpret_cast<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>*>(handle)->begin()
    ));
}
void
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>::iterator*>(iterator_handle);
}
bool
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>*>(handle)->end();
}
void
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>::iterator*>(iterator_handle);
}
uint32_t
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::alien::FooEnum>::toFfi(
        (*reinterpret_cast<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>::iterator*>(iterator_handle))->first
    );
}
bool
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*reinterpret_cast<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>>(
            gluecodium::ffi::Conversion<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>>::toCpp(value)
        )
    );
}
void
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>>*>(handle);
}
FfiOpaqueHandle
MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<::alien::FooEnum, bool, gluecodium::hash<::alien::FooEnum>>>*>(handle)
    );
}
FfiOpaqueHandle
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>());
}
void
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle);
}
void
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_put(FfiOpaqueHandle handle, uint32_t key, bool value) {
    reinterpret_cast<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::toCpp(key),
        gluecodium::ffi::Conversion<bool>::toCpp(value)
    );
}
FfiOpaqueHandle
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::iterator(
        reinterpret_cast<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle)->begin()
    ));
}
void
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::iterator*>(iterator_handle);
}
bool
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle)->end();
}
void
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::iterator*>(iterator_handle);
}
uint32_t
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::toFfi(
        (*reinterpret_cast<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::iterator*>(iterator_handle))->first
    );
}
bool
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*reinterpret_cast<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>(
            gluecodium::ffi::Conversion<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>::toCpp(value)
        )
    );
}
void
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>*>(handle);
}
FfiOpaqueHandle
MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>*>(handle)
    );
}
FfiOpaqueHandle
SetOf_Float_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<float>());
}
void
SetOf_Float_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_set<float>*>(handle);
}
void
SetOf_Float_insert(FfiOpaqueHandle handle, float value) {
    reinterpret_cast<std::unordered_set<float>*>(handle)->insert(
        gluecodium::ffi::Conversion<float>::toCpp(value)
    );
}
FfiOpaqueHandle
SetOf_Float_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<float>::iterator(
        reinterpret_cast<std::unordered_set<float>*>(handle)->begin()
    ));
}
void
SetOf_Float_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_set<float>::iterator*>(iterator_handle);
}
bool
SetOf_Float_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_set<float>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_set<float>*>(handle)->end();
}
void
SetOf_Float_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<float>::iterator*>(iterator_handle);
}
float
SetOf_Float_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<float>::toFfi(
        **reinterpret_cast<std::unordered_set<float>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
SetOf_Float_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_set<float>>(
            gluecodium::ffi::Conversion<std::unordered_set<float>>::toCpp(value)
        )
    );
}
void
SetOf_Float_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_set<float>>*>(handle);
}
FfiOpaqueHandle
SetOf_Float_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_set<float>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_set<float>>*>(handle)
    );
}
FfiOpaqueHandle
SetOf_Int_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<int32_t>());
}
void
SetOf_Int_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_set<int32_t>*>(handle);
}
void
SetOf_Int_insert(FfiOpaqueHandle handle, int32_t value) {
    reinterpret_cast<std::unordered_set<int32_t>*>(handle)->insert(
        gluecodium::ffi::Conversion<int32_t>::toCpp(value)
    );
}
FfiOpaqueHandle
SetOf_Int_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<int32_t>::iterator(
        reinterpret_cast<std::unordered_set<int32_t>*>(handle)->begin()
    ));
}
void
SetOf_Int_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_set<int32_t>::iterator*>(iterator_handle);
}
bool
SetOf_Int_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_set<int32_t>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_set<int32_t>*>(handle)->end();
}
void
SetOf_Int_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<int32_t>::iterator*>(iterator_handle);
}
int32_t
SetOf_Int_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        **reinterpret_cast<std::unordered_set<int32_t>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
SetOf_Int_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_set<int32_t>>(
            gluecodium::ffi::Conversion<std::unordered_set<int32_t>>::toCpp(value)
        )
    );
}
void
SetOf_Int_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_set<int32_t>>*>(handle);
}
FfiOpaqueHandle
SetOf_Int_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_set<int32_t>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_set<int32_t>>*>(handle)
    );
}
FfiOpaqueHandle
SetOf_ListOf_Int_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>());
}
void
SetOf_ListOf_Int_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>*>(handle);
}
void
SetOf_ListOf_Int_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>*>(handle)->insert(
        gluecodium::ffi::Conversion<std::vector<int32_t>>::toCpp(value)
    );
}
FfiOpaqueHandle
SetOf_ListOf_Int_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>::iterator(
        reinterpret_cast<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>*>(handle)->begin()
    ));
}
void
SetOf_ListOf_Int_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>::iterator*>(iterator_handle);
}
bool
SetOf_ListOf_Int_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>*>(handle)->end();
}
void
SetOf_ListOf_Int_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
SetOf_ListOf_Int_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::vector<int32_t>>::toFfi(
        **reinterpret_cast<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
SetOf_ListOf_Int_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>>(
            gluecodium::ffi::Conversion<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>>::toCpp(value)
        )
    );
}
void
SetOf_ListOf_Int_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>>*>(handle);
}
FfiOpaqueHandle
SetOf_ListOf_Int_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_set<std::vector<int32_t>, gluecodium::hash<std::vector<int32_t>>>>*>(handle)
    );
}
FfiOpaqueHandle
SetOf_MapOf_Int_to_Boolean_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>());
}
void
SetOf_MapOf_Int_to_Boolean_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>*>(handle);
}
void
SetOf_MapOf_Int_to_Boolean_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>*>(handle)->insert(
        gluecodium::ffi::Conversion<std::unordered_map<int32_t, bool>>::toCpp(value)
    );
}
FfiOpaqueHandle
SetOf_MapOf_Int_to_Boolean_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>::iterator(
        reinterpret_cast<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>*>(handle)->begin()
    ));
}
void
SetOf_MapOf_Int_to_Boolean_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>::iterator*>(iterator_handle);
}
bool
SetOf_MapOf_Int_to_Boolean_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>*>(handle)->end();
}
void
SetOf_MapOf_Int_to_Boolean_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
SetOf_MapOf_Int_to_Boolean_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, bool>>::toFfi(
        **reinterpret_cast<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
SetOf_MapOf_Int_to_Boolean_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>>(
            gluecodium::ffi::Conversion<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>>::toCpp(value)
        )
    );
}
void
SetOf_MapOf_Int_to_Boolean_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>>*>(handle);
}
FfiOpaqueHandle
SetOf_MapOf_Int_to_Boolean_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_set<std::unordered_map<int32_t, bool>, gluecodium::hash<std::unordered_map<int32_t, bool>>>>*>(handle)
    );
}
FfiOpaqueHandle
SetOf_SetOf_Int_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>());
}
void
SetOf_SetOf_Int_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>*>(handle);
}
void
SetOf_SetOf_Int_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>*>(handle)->insert(
        gluecodium::ffi::Conversion<std::unordered_set<int32_t>>::toCpp(value)
    );
}
FfiOpaqueHandle
SetOf_SetOf_Int_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>::iterator(
        reinterpret_cast<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>*>(handle)->begin()
    ));
}
void
SetOf_SetOf_Int_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>::iterator*>(iterator_handle);
}
bool
SetOf_SetOf_Int_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>*>(handle)->end();
}
void
SetOf_SetOf_Int_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
SetOf_SetOf_Int_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::unordered_set<int32_t>>::toFfi(
        **reinterpret_cast<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
SetOf_SetOf_Int_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>>(
            gluecodium::ffi::Conversion<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>>::toCpp(value)
        )
    );
}
void
SetOf_SetOf_Int_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>>*>(handle);
}
FfiOpaqueHandle
SetOf_SetOf_Int_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_set<std::unordered_set<int32_t>, gluecodium::hash<std::unordered_set<int32_t>>>>*>(handle)
    );
}
FfiOpaqueHandle
SetOf_String_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<std::string>());
}
void
SetOf_String_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_set<std::string>*>(handle);
}
void
SetOf_String_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_set<std::string>*>(handle)->insert(
        gluecodium::ffi::Conversion<std::string>::toCpp(value)
    );
}
FfiOpaqueHandle
SetOf_String_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<std::string>::iterator(
        reinterpret_cast<std::unordered_set<std::string>*>(handle)->begin()
    ));
}
void
SetOf_String_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_set<std::string>::iterator*>(iterator_handle);
}
bool
SetOf_String_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_set<std::string>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_set<std::string>*>(handle)->end();
}
void
SetOf_String_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<std::string>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
SetOf_String_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        **reinterpret_cast<std::unordered_set<std::string>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
SetOf_String_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_set<std::string>>(
            gluecodium::ffi::Conversion<std::unordered_set<std::string>>::toCpp(value)
        )
    );
}
void
SetOf_String_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_set<std::string>>*>(handle);
}
FfiOpaqueHandle
SetOf_String_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_set<std::string>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_set<std::string>>*>(handle)
    );
}
FfiOpaqueHandle
SetOf_UByte_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<uint8_t>());
}
void
SetOf_UByte_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_set<uint8_t>*>(handle);
}
void
SetOf_UByte_insert(FfiOpaqueHandle handle, uint8_t value) {
    reinterpret_cast<std::unordered_set<uint8_t>*>(handle)->insert(
        gluecodium::ffi::Conversion<uint8_t>::toCpp(value)
    );
}
FfiOpaqueHandle
SetOf_UByte_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<uint8_t>::iterator(
        reinterpret_cast<std::unordered_set<uint8_t>*>(handle)->begin()
    ));
}
void
SetOf_UByte_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_set<uint8_t>::iterator*>(iterator_handle);
}
bool
SetOf_UByte_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_set<uint8_t>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_set<uint8_t>*>(handle)->end();
}
void
SetOf_UByte_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<uint8_t>::iterator*>(iterator_handle);
}
uint8_t
SetOf_UByte_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<uint8_t>::toFfi(
        **reinterpret_cast<std::unordered_set<uint8_t>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
SetOf_UByte_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_set<uint8_t>>(
            gluecodium::ffi::Conversion<std::unordered_set<uint8_t>>::toCpp(value)
        )
    );
}
void
SetOf_UByte_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_set<uint8_t>>*>(handle);
}
FfiOpaqueHandle
SetOf_UByte_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_set<uint8_t>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_set<uint8_t>>*>(handle)
    );
}
FfiOpaqueHandle
SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>());
}
void
SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>*>(handle);
}
void
SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert(FfiOpaqueHandle handle, uint32_t value) {
    reinterpret_cast<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>*>(handle)->insert(
        gluecodium::ffi::Conversion<::alien::FooEnum>::toCpp(value)
    );
}
FfiOpaqueHandle
SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>::iterator(
        reinterpret_cast<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>*>(handle)->begin()
    ));
}
void
SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>::iterator*>(iterator_handle);
}
bool
SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>*>(handle)->end();
}
void
SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>::iterator*>(iterator_handle);
}
uint32_t
SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::alien::FooEnum>::toFfi(
        **reinterpret_cast<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>>(
            gluecodium::ffi::Conversion<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>>::toCpp(value)
        )
    );
}
void
SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>>*>(handle);
}
FfiOpaqueHandle
SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_set<::alien::FooEnum, gluecodium::hash<::alien::FooEnum>>>*>(handle)
    );
}
FfiOpaqueHandle
SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>());
}
void
SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle);
}
void
SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert(FfiOpaqueHandle handle, uint32_t value) {
    reinterpret_cast<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle)->insert(
        gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::toCpp(value)
    );
}
FfiOpaqueHandle
SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::iterator(
        reinterpret_cast<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle)->begin()
    ));
}
void
SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::iterator*>(iterator_handle);
}
bool
SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>*>(handle)->end();
}
void
SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::iterator*>(iterator_handle);
}
uint32_t
SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<::smoke::GenericTypesWithCompoundTypes::SomeEnum>::toFfi(
        **reinterpret_cast<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>(
            gluecodium::ffi::Conversion<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>::toCpp(value)
        )
    );
}
void
SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>*>(handle);
}
FfiOpaqueHandle
SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, gluecodium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
