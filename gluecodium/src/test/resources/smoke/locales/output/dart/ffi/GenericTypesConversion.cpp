#include "GenericTypesConversion.h"
#include "ConversionBase.h"
#include "gluecodium/Locale.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
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
library_foobar_ListOf_Locale_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<gluecodium::Locale>());
}
void
library_foobar_ListOf_Locale_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<gluecodium::Locale>*>(handle);
}
void
library_foobar_ListOf_Locale_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::vector<gluecodium::Locale>*>(handle)->push_back(
        gluecodium::ffi::Conversion<gluecodium::Locale>::toCpp(value)
    );
}
FfiOpaqueHandle
library_foobar_ListOf_Locale_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<gluecodium::Locale>::iterator(
        reinterpret_cast<std::vector<gluecodium::Locale>*>(handle)->begin()
    ));
}
void
library_foobar_ListOf_Locale_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<gluecodium::Locale>::iterator*>(iterator_handle);
}
bool
library_foobar_ListOf_Locale_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<gluecodium::Locale>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<gluecodium::Locale>*>(handle)->end();
}
void
library_foobar_ListOf_Locale_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<gluecodium::Locale>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
library_foobar_ListOf_Locale_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<gluecodium::Locale>::toFfi(
        **reinterpret_cast<std::vector<gluecodium::Locale>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
library_foobar_ListOf_Locale_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<std::vector<gluecodium::Locale>>(
            gluecodium::ffi::Conversion<std::vector<gluecodium::Locale>>::toCpp(value)
        )
    );
}
void
library_foobar_ListOf_Locale_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<std::vector<gluecodium::Locale>>*>(handle);
}
FfiOpaqueHandle
library_foobar_ListOf_Locale_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<gluecodium::Locale>>::toFfi(
        **reinterpret_cast<std::optional<std::vector<gluecodium::Locale>>*>(handle)
    );
}
FfiOpaqueHandle
library_foobar_MapOf_Locale_to_String_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>());
}
void
library_foobar_MapOf_Locale_to_String_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>*>(handle);
}
void
library_foobar_MapOf_Locale_to_String_put(FfiOpaqueHandle handle, FfiOpaqueHandle key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<gluecodium::Locale>::toCpp(key),
        gluecodium::ffi::Conversion<std::string>::toCpp(value)
    );
}
FfiOpaqueHandle
library_foobar_MapOf_Locale_to_String_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>::iterator(
        reinterpret_cast<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>*>(handle)->begin()
    ));
}
void
library_foobar_MapOf_Locale_to_String_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>::iterator*>(iterator_handle);
}
bool
library_foobar_MapOf_Locale_to_String_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>*>(handle)->end();
}
void
library_foobar_MapOf_Locale_to_String_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
library_foobar_MapOf_Locale_to_String_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<gluecodium::Locale>::toFfi(
        (*reinterpret_cast<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
library_foobar_MapOf_Locale_to_String_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*reinterpret_cast<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
library_foobar_MapOf_Locale_to_String_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>>(
            gluecodium::ffi::Conversion<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>>::toCpp(value)
        )
    );
}
void
library_foobar_MapOf_Locale_to_String_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>>*>(handle);
}
FfiOpaqueHandle
library_foobar_MapOf_Locale_to_String_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>>::toFfi(
        **reinterpret_cast<std::optional<std::unordered_map<gluecodium::Locale, std::string, gluecodium::hash<gluecodium::Locale>>>*>(handle)
    );
}
FfiOpaqueHandle
library_foobar_MapOf_String_to_Locale_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::string, gluecodium::Locale>());
}
void
library_foobar_MapOf_String_to_Locale_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<std::string, gluecodium::Locale>*>(handle);
}
void
library_foobar_MapOf_String_to_Locale_put(FfiOpaqueHandle handle, FfiOpaqueHandle key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<std::string, gluecodium::Locale>*>(handle)->emplace(
        gluecodium::ffi::Conversion<std::string>::toCpp(key),
        gluecodium::ffi::Conversion<gluecodium::Locale>::toCpp(value)
    );
}
FfiOpaqueHandle
library_foobar_MapOf_String_to_Locale_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::string, gluecodium::Locale>::iterator(
        reinterpret_cast<std::unordered_map<std::string, gluecodium::Locale>*>(handle)->begin()
    ));
}
void
library_foobar_MapOf_String_to_Locale_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, gluecodium::Locale>::iterator*>(iterator_handle);
}
bool
library_foobar_MapOf_String_to_Locale_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, gluecodium::Locale>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<std::string, gluecodium::Locale>*>(handle)->end();
}
void
library_foobar_MapOf_String_to_Locale_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, gluecodium::Locale>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
library_foobar_MapOf_String_to_Locale_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::string, gluecodium::Locale>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
library_foobar_MapOf_String_to_Locale_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<gluecodium::Locale>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::string, gluecodium::Locale>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
library_foobar_MapOf_String_to_Locale_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<std::unordered_map<std::string, gluecodium::Locale>>(
            gluecodium::ffi::Conversion<std::unordered_map<std::string, gluecodium::Locale>>::toCpp(value)
        )
    );
}
void
library_foobar_MapOf_String_to_Locale_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<std::unordered_map<std::string, gluecodium::Locale>>*>(handle);
}
FfiOpaqueHandle
library_foobar_MapOf_String_to_Locale_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<std::string, gluecodium::Locale>>::toFfi(
        **reinterpret_cast<std::optional<std::unordered_map<std::string, gluecodium::Locale>>*>(handle)
    );
}
FfiOpaqueHandle
library_foobar_SetOf_Locale_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>());
}
void
library_foobar_SetOf_Locale_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>*>(handle);
}
void
library_foobar_SetOf_Locale_insert(FfiOpaqueHandle handle, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>*>(handle)->insert(
        gluecodium::ffi::Conversion<gluecodium::Locale>::toCpp(value)
    );
}
FfiOpaqueHandle
library_foobar_SetOf_Locale_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>::iterator(
        reinterpret_cast<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>*>(handle)->begin()
    ));
}
void
library_foobar_SetOf_Locale_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>::iterator*>(iterator_handle);
}
bool
library_foobar_SetOf_Locale_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>*>(handle)->end();
}
void
library_foobar_SetOf_Locale_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
library_foobar_SetOf_Locale_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<gluecodium::Locale>::toFfi(
        **reinterpret_cast<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
library_foobar_SetOf_Locale_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>>(
            gluecodium::ffi::Conversion<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>>::toCpp(value)
        )
    );
}
void
library_foobar_SetOf_Locale_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>>*>(handle);
}
FfiOpaqueHandle
library_foobar_SetOf_Locale_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>>::toFfi(
        **reinterpret_cast<std::optional<std::unordered_set<gluecodium::Locale, gluecodium::hash<gluecodium::Locale>>>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
