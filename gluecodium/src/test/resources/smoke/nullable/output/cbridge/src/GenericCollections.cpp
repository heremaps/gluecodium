//
//
#include "cbridge/include/GenericCollections.h"
#include "cbridge/include/DateHandle.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TimePointHash.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Nullable.h"
#include <chrono>
#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>
#include <new>
_baseRef ArrayOf__Date_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::chrono::system_clock::time_point >( ) );
}
_baseRef ArrayOf__Date_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::chrono::system_clock::time_point >( *reinterpret_cast<::std::vector< ::std::chrono::system_clock::time_point >*>( handle ) ) );
}
void ArrayOf__Date_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::chrono::system_clock::time_point >*>( handle );
}
uint64_t ArrayOf__Date_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::chrono::system_clock::time_point >>::toCpp( handle ).size( );
}
double ArrayOf__Date_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::chrono::system_clock::time_point>::referenceBaseRef(Conversion<::std::vector< ::std::chrono::system_clock::time_point >>::toCpp( handle )[index]);
}
void ArrayOf__Date_append( _baseRef handle, double item )
{
    Conversion<::std::vector< ::std::chrono::system_clock::time_point >>::toCpp(handle).push_back(Conversion<::std::chrono::system_clock::time_point>::toCpp(item));
}
_baseRef ArrayOf__Date_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::chrono::system_clock::time_point >>( ::std::vector< ::std::chrono::system_clock::time_point >( ) ) );
}
void ArrayOf__Date_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::chrono::system_clock::time_point >>*>( handle );
}
_baseRef ArrayOf__Date_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::chrono::system_clock::time_point >>*>( handle ) );
}
_baseRef ArrayOf__String_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::string >( ) );
}
_baseRef ArrayOf__String_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::string >( *reinterpret_cast<::std::vector< ::std::string >*>( handle ) ) );
}
void ArrayOf__String_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::string >*>( handle );
}
uint64_t ArrayOf__String_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::string >>::toCpp( handle ).size( );
}
_baseRef ArrayOf__String_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::string>::referenceBaseRef(Conversion<::std::vector< ::std::string >>::toCpp( handle )[index]);
}
void ArrayOf__String_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::std::string >>::toCpp(handle).push_back(Conversion<::std::string>::toCpp(item));
}
_baseRef ArrayOf__String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::string >>( ::std::vector< ::std::string >( ) ) );
}
void ArrayOf__String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::string >>*>( handle );
}
_baseRef ArrayOf__String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::string >>*>( handle ) );
}
_baseRef ArrayOf_nullable_Date_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >( ) );
}
_baseRef ArrayOf_nullable_Date_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >( *reinterpret_cast<::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >*>( handle ) ) );
}
void ArrayOf_nullable_Date_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >*>( handle );
}
uint64_t ArrayOf_nullable_Date_count(_baseRef handle) {
    return Conversion<::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >>::toCpp( handle ).size( );
}
_baseRef ArrayOf_nullable_Date_get( _baseRef handle, uint64_t index ) {
    return Conversion<::gluecodium::optional< ::std::chrono::system_clock::time_point >>::referenceBaseRef(Conversion<::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >>::toCpp( handle )[index]);
}
void ArrayOf_nullable_Date_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >>::toCpp(handle).push_back(Conversion<::gluecodium::optional< ::std::chrono::system_clock::time_point >>::toCpp(item));
}
_baseRef ArrayOf_nullable_Date_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >>( ::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >( ) ) );
}
void ArrayOf_nullable_Date_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >>*>( handle );
}
_baseRef ArrayOf_nullable_Date_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >>*>( handle ) );
}
_baseRef MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >() );
}
void MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >>(handle);
}
_baseRef MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >::iterator( get_pointer<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >>(handle)->begin() ) );
}
void MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >::iterator*>( iterator_handle );
}
void MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_put(_baseRef handle, int32_t key, _baseRef value) {
    (*get_pointer<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >>(handle)).emplace(key, Conversion<::gluecodium::optional< ::smoke::Nullable::SomeStruct >>::toCpp(value));
}
bool MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >>(handle)->end();
}
void MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >::iterator*>( iterator_handle );
}
int32_t MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >::iterator*>( iterator_handle ))->second;
    return Conversion<::gluecodium::optional< ::smoke::Nullable::SomeStruct >>::toBaseRef(value);
}
_baseRef MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >>( ::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >( ) ) );
}
void MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >>*>( handle );
}
_baseRef MapOf__Int_To_nullable_smoke_Nullable_SomeStruct_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >>*>( handle ) );
}
_baseRef MapOf__Long_To__String_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int64_t, ::std::string >() );
}
void MapOf__Long_To__String_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< int64_t, ::std::string >>(handle);
}
_baseRef MapOf__Long_To__String_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int64_t, ::std::string >::iterator( get_pointer<::std::unordered_map< int64_t, ::std::string >>(handle)->begin() ) );
}
void MapOf__Long_To__String_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< int64_t, ::std::string >::iterator*>( iterator_handle );
}
void MapOf__Long_To__String_put(_baseRef handle, int64_t key, _baseRef value) {
    (*get_pointer<::std::unordered_map< int64_t, ::std::string >>(handle)).emplace(key, Conversion<::std::string>::toCpp(value));
}
bool MapOf__Long_To__String_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< int64_t, ::std::string >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< int64_t, ::std::string >>(handle)->end();
}
void MapOf__Long_To__String_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< int64_t, ::std::string >::iterator*>( iterator_handle );
}
int64_t MapOf__Long_To__String_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< int64_t, ::std::string >::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef MapOf__Long_To__String_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< int64_t, ::std::string >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::string>::toBaseRef(value);
}
_baseRef MapOf__Long_To__String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< int64_t, ::std::string >>( ::std::unordered_map< int64_t, ::std::string >( ) ) );
}
void MapOf__Long_To__String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< int64_t, ::std::string >>*>( handle );
}
_baseRef MapOf__Long_To__String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< int64_t, ::std::string >>*>( handle ) );
}
