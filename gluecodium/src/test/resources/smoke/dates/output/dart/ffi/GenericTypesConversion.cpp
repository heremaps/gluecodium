#include "GenericTypesConversion.h"
#include "ConversionBase.h"
#include "gluecodium/TimePointHash.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <chrono>
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
library_foobar_ListOf_Date_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::chrono::system_clock::time_point>());
}
void
library_foobar_ListOf_Date_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<std::chrono::system_clock::time_point>*>(handle);
}
void
library_foobar_ListOf_Date_insert(FfiOpaqueHandle handle, uint64_t value) {
    reinterpret_cast<std::vector<std::chrono::system_clock::time_point>*>(handle)->push_back(
        gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toCpp(value)
    );
}
FfiOpaqueHandle
library_foobar_ListOf_Date_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::chrono::system_clock::time_point>::iterator(
        reinterpret_cast<std::vector<std::chrono::system_clock::time_point>*>(handle)->begin()
    ));
}
void
library_foobar_ListOf_Date_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<std::chrono::system_clock::time_point>::iterator*>(iterator_handle);
}
bool
library_foobar_ListOf_Date_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<std::chrono::system_clock::time_point>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<std::chrono::system_clock::time_point>*>(handle)->end();
}
void
library_foobar_ListOf_Date_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<std::chrono::system_clock::time_point>::iterator*>(iterator_handle);
}
uint64_t
library_foobar_ListOf_Date_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toFfi(
        **reinterpret_cast<std::vector<std::chrono::system_clock::time_point>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
library_foobar_ListOf_Date_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<std::chrono::system_clock::time_point>>(
            gluecodium::ffi::Conversion<std::vector<std::chrono::system_clock::time_point>>::toCpp(value)
        )
    );
}
void
library_foobar_ListOf_Date_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<std::chrono::system_clock::time_point>>*>(handle);
}
FfiOpaqueHandle
library_foobar_ListOf_Date_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<std::chrono::system_clock::time_point>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<std::chrono::system_clock::time_point>>*>(handle)
    );
}
FfiOpaqueHandle
library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::chrono::steady_clock::time_point>());
}
void
library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::vector<std::chrono::steady_clock::time_point>*>(handle);
}
void
library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_insert(FfiOpaqueHandle handle, uint64_t value) {
    reinterpret_cast<std::vector<std::chrono::steady_clock::time_point>*>(handle)->push_back(
        gluecodium::ffi::Conversion<std::chrono::steady_clock::time_point>::toCpp(value)
    );
}
FfiOpaqueHandle
library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::vector<std::chrono::steady_clock::time_point>::iterator(
        reinterpret_cast<std::vector<std::chrono::steady_clock::time_point>*>(handle)->begin()
    ));
}
void
library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::vector<std::chrono::steady_clock::time_point>::iterator*>(iterator_handle);
}
bool
library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::vector<std::chrono::steady_clock::time_point>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::vector<std::chrono::steady_clock::time_point>*>(handle)->end();
}
void
library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::vector<std::chrono::steady_clock::time_point>::iterator*>(iterator_handle);
}
uint64_t
library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::chrono::steady_clock::time_point>::toFfi(
        **reinterpret_cast<std::vector<std::chrono::steady_clock::time_point>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::vector<std::chrono::steady_clock::time_point>>(
            gluecodium::ffi::Conversion<std::vector<std::chrono::steady_clock::time_point>>::toCpp(value)
        )
    );
}
void
library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::vector<std::chrono::steady_clock::time_point>>*>(handle);
}
FfiOpaqueHandle
library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::vector<std::chrono::steady_clock::time_point>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::vector<std::chrono::steady_clock::time_point>>*>(handle)
    );
}
FfiOpaqueHandle
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>());
}
void
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>*>(handle);
}
void
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_put(FfiOpaqueHandle handle, uint64_t key, FfiOpaqueHandle value) {
    reinterpret_cast<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>*>(handle)->emplace(
        gluecodium::ffi::Conversion<std::chrono::steady_clock::time_point>::toCpp(key),
        gluecodium::ffi::Conversion<std::string>::toCpp(value)
    );
}
FfiOpaqueHandle
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>::iterator(
        reinterpret_cast<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>*>(handle)->begin()
    ));
}
void
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>::iterator*>(iterator_handle);
}
bool
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>*>(handle)->end();
}
void
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>::iterator*>(iterator_handle);
}
uint64_t
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::chrono::steady_clock::time_point>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>::iterator*>(iterator_handle))->first
    );
}
FfiOpaqueHandle
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>>(
            gluecodium::ffi::Conversion<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>>::toCpp(value)
        )
    );
}
void
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>>*>(handle);
}
FfiOpaqueHandle
library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<std::chrono::steady_clock::time_point, std::string, gluecodium::hash<std::chrono::steady_clock::time_point>>>*>(handle)
    );
}
FfiOpaqueHandle
library_foobar_MapOf_String_to_Date_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::string, std::chrono::system_clock::time_point>());
}
void
library_foobar_MapOf_String_to_Date_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_map<std::string, std::chrono::system_clock::time_point>*>(handle);
}
void
library_foobar_MapOf_String_to_Date_put(FfiOpaqueHandle handle, FfiOpaqueHandle key, uint64_t value) {
    reinterpret_cast<std::unordered_map<std::string, std::chrono::system_clock::time_point>*>(handle)->emplace(
        gluecodium::ffi::Conversion<std::string>::toCpp(key),
        gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toCpp(value)
    );
}
FfiOpaqueHandle
library_foobar_MapOf_String_to_Date_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_map<std::string, std::chrono::system_clock::time_point>::iterator(
        reinterpret_cast<std::unordered_map<std::string, std::chrono::system_clock::time_point>*>(handle)->begin()
    ));
}
void
library_foobar_MapOf_String_to_Date_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, std::chrono::system_clock::time_point>::iterator*>(iterator_handle);
}
bool
library_foobar_MapOf_String_to_Date_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, std::chrono::system_clock::time_point>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_map<std::string, std::chrono::system_clock::time_point>*>(handle)->end();
}
void
library_foobar_MapOf_String_to_Date_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, std::chrono::system_clock::time_point>::iterator*>(iterator_handle);
}
FfiOpaqueHandle
library_foobar_MapOf_String_to_Date_iterator_get_key(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::string, std::chrono::system_clock::time_point>::iterator*>(iterator_handle))->first
    );
}
uint64_t
library_foobar_MapOf_String_to_Date_iterator_get_value(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toFfi(
        (*reinterpret_cast<std::unordered_map<std::string, std::chrono::system_clock::time_point>::iterator*>(iterator_handle))->second
    );
}
FfiOpaqueHandle
library_foobar_MapOf_String_to_Date_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_map<std::string, std::chrono::system_clock::time_point>>(
            gluecodium::ffi::Conversion<std::unordered_map<std::string, std::chrono::system_clock::time_point>>::toCpp(value)
        )
    );
}
void
library_foobar_MapOf_String_to_Date_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_map<std::string, std::chrono::system_clock::time_point>>*>(handle);
}
FfiOpaqueHandle
library_foobar_MapOf_String_to_Date_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_map<std::string, std::chrono::system_clock::time_point>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_map<std::string, std::chrono::system_clock::time_point>>*>(handle)
    );
}
FfiOpaqueHandle
library_foobar_SetOf_Date_create_handle() {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>());
}
void
library_foobar_SetOf_Date_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>*>(handle);
}
void
library_foobar_SetOf_Date_insert(FfiOpaqueHandle handle, uint64_t value) {
    reinterpret_cast<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>*>(handle)->insert(
        gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toCpp(value)
    );
}
FfiOpaqueHandle
library_foobar_SetOf_Date_iterator(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>::iterator(
        reinterpret_cast<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>*>(handle)->begin()
    ));
}
void
library_foobar_SetOf_Date_iterator_release_handle(FfiOpaqueHandle iterator_handle) {
    delete reinterpret_cast<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>::iterator*>(iterator_handle);
}
bool
library_foobar_SetOf_Date_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle iterator_handle) {
    return *reinterpret_cast<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>::iterator*>(iterator_handle) !=
        reinterpret_cast<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>*>(handle)->end();
}
void
library_foobar_SetOf_Date_iterator_increment(FfiOpaqueHandle iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>::iterator*>(iterator_handle);
}
uint64_t
library_foobar_SetOf_Date_iterator_get(FfiOpaqueHandle iterator_handle) {
    return gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toFfi(
        **reinterpret_cast<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>::iterator*>(iterator_handle)
    );
}
FfiOpaqueHandle
library_foobar_SetOf_Date_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>>(
            gluecodium::ffi::Conversion<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>>::toCpp(value)
        )
    );
}
void
library_foobar_SetOf_Date_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>>*>(handle);
}
FfiOpaqueHandle
library_foobar_SetOf_Date_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::unordered_set<std::chrono::system_clock::time_point, gluecodium::hash<std::chrono::system_clock::time_point>>>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
