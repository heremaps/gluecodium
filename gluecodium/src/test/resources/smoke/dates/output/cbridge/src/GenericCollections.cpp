//
//
#include "cbridge/include/GenericCollections.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TimePointHash.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/DatesSteady.h"
#include <chrono>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <new>
_baseRef foobar_ArrayOf__Date_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::chrono::system_clock::time_point >( ) );
}
_baseRef foobar_ArrayOf__Date_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::chrono::system_clock::time_point >( *reinterpret_cast<::std::vector< ::std::chrono::system_clock::time_point >*>( handle ) ) );
}
void foobar_ArrayOf__Date_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::chrono::system_clock::time_point >*>( handle );
}
uint64_t foobar_ArrayOf__Date_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::chrono::system_clock::time_point >>::toCpp( handle ).size( );
}
double foobar_ArrayOf__Date_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::chrono::system_clock::time_point>::referenceBaseRef(Conversion<::std::vector< ::std::chrono::system_clock::time_point >>::toCpp( handle )[index]);
}
void foobar_ArrayOf__Date_append( _baseRef handle, double item )
{
    Conversion<::std::vector< ::std::chrono::system_clock::time_point >>::toCpp(handle).push_back(Conversion<::std::chrono::system_clock::time_point>::toCpp(item));
}
_baseRef foobar_ArrayOf__Date_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::chrono::system_clock::time_point >>( ::std::vector< ::std::chrono::system_clock::time_point >( ) ) );
}
void foobar_ArrayOf__Date_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::chrono::system_clock::time_point >>*>( handle );
}
_baseRef foobar_ArrayOf__Date_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::chrono::system_clock::time_point >>*>( handle ) );
}
_baseRef foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< std::chrono::steady_clock::time_point >( ) );
}
_baseRef foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< std::chrono::steady_clock::time_point >( *reinterpret_cast<::std::vector< std::chrono::steady_clock::time_point >*>( handle ) ) );
}
void foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< std::chrono::steady_clock::time_point >*>( handle );
}
uint64_t foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_count(_baseRef handle) {
    return Conversion<::std::vector< std::chrono::steady_clock::time_point >>::toCpp( handle ).size( );
}
double foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_get( _baseRef handle, uint64_t index ) {
    return Conversion<std::chrono::steady_clock::time_point>::referenceBaseRef(Conversion<::std::vector< std::chrono::steady_clock::time_point >>::toCpp( handle )[index]);
}
void foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_append( _baseRef handle, double item )
{
    Conversion<::std::vector< std::chrono::steady_clock::time_point >>::toCpp(handle).push_back(Conversion<std::chrono::steady_clock::time_point>::toCpp(item));
}
_baseRef foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< std::chrono::steady_clock::time_point >>( ::std::vector< std::chrono::steady_clock::time_point >( ) ) );
}
void foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< std::chrono::steady_clock::time_point >>*>( handle );
}
_baseRef foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< std::chrono::steady_clock::time_point >>*>( handle ) );
}
_baseRef foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >() );
}
void foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >>(handle);
}
_baseRef foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >::iterator( get_pointer<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >>(handle)->begin() ) );
}
void foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >::iterator*>( iterator_handle );
}
void foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_put(_baseRef handle, double key, _baseRef value) {
    (*get_pointer<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >>(handle)).emplace(Conversion<std::chrono::steady_clock::time_point>::toCpp(key), Conversion<::std::string>::toCpp(value));
}
bool foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >>(handle)->end();
}
void foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >::iterator*>( iterator_handle );
}
double foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >::iterator*>( iterator_handle ))->first;
    return Conversion<std::chrono::steady_clock::time_point>::toBaseRef(key);
}
_baseRef foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::string>::toBaseRef(value);
}
_baseRef foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >>( ::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >( ) ) );
}
void foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >>*>( handle );
}
_baseRef foobar_MapOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_To__String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< std::chrono::steady_clock::time_point, ::std::string, ::gluecodium::hash< std::chrono::steady_clock::time_point > >>*>( handle ) );
}
_baseRef foobar_MapOf__String_To__Date_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >() );
}
void foobar_MapOf__String_To__Date_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >>(handle);
}
_baseRef foobar_MapOf__String_To__Date_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >::iterator( get_pointer<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >>(handle)->begin() ) );
}
void foobar_MapOf__String_To__Date_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >::iterator*>( iterator_handle );
}
void foobar_MapOf__String_To__Date_put(_baseRef handle, _baseRef key, double value) {
    (*get_pointer<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >>(handle)).emplace(Conversion<::std::string>::toCpp(key), Conversion<::std::chrono::system_clock::time_point>::toCpp(value));
}
bool foobar_MapOf__String_To__Date_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >>(handle)->end();
}
void foobar_MapOf__String_To__Date_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf__String_To__Date_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::string>::toBaseRef(key);
}
double foobar_MapOf__String_To__Date_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::chrono::system_clock::time_point>::toBaseRef(value);
}
_baseRef foobar_MapOf__String_To__Date_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >>( ::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >( ) ) );
}
void foobar_MapOf__String_To__Date_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >>*>( handle );
}
_baseRef foobar_MapOf__String_To__Date_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >>*>( handle ) );
}
_baseRef foobar_SetOf__Date_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >() );
}
void foobar_SetOf__Date_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >>(handle);
}
void foobar_SetOf__Date_insert(_baseRef handle, double value) {
    (*get_pointer<::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >>(handle)).insert(::std::move(Conversion<::std::chrono::system_clock::time_point>::toCpp(value)));
}
_baseRef foobar_SetOf__Date_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >::iterator( get_pointer<::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >>(handle)->begin() ) );
}
void foobar_SetOf__Date_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >::iterator*>( iterator_handle );
}
bool foobar_SetOf__Date_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >>(handle)->end();
}
void foobar_SetOf__Date_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >::iterator*>( iterator_handle );
}
double foobar_SetOf__Date_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >::iterator*>( iterator_handle );
    return Conversion<::std::chrono::system_clock::time_point>::referenceBaseRef(value);
}
_baseRef foobar_SetOf__Date_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >>( ::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >( ) ) );
}
void foobar_SetOf__Date_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >>*>( handle );
}
_baseRef foobar_SetOf__Date_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >>*>( handle ) );
}
