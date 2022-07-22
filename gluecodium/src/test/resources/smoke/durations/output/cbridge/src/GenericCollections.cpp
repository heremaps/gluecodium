//
//
#include "cbridge/include/GenericCollections.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/DurationHash.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <chrono>
#include <optional>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <new>
_baseRef foobar_ArrayOf__Duration_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::chrono::seconds >( ) );
}
_baseRef foobar_ArrayOf__Duration_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::chrono::seconds >( *reinterpret_cast<::std::vector< ::std::chrono::seconds >*>( handle ) ) );
}
void foobar_ArrayOf__Duration_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::chrono::seconds >*>( handle );
}
uint64_t foobar_ArrayOf__Duration_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::chrono::seconds >>::toCpp( handle ).size( );
}
double foobar_ArrayOf__Duration_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::chrono::seconds>::referenceBaseRef(Conversion<::std::vector< ::std::chrono::seconds >>::toCpp( handle )[index]);
}
void foobar_ArrayOf__Duration_append( _baseRef handle, double item )
{
    Conversion<::std::vector< ::std::chrono::seconds >>::toCpp(handle).push_back(Conversion<::std::chrono::seconds>::toCpp(item));
}
_baseRef foobar_ArrayOf__Duration_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) std::optional<::std::vector< ::std::chrono::seconds >>( ::std::vector< ::std::chrono::seconds >( ) ) );
}
void foobar_ArrayOf__Duration_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::std::vector< ::std::chrono::seconds >>*>( handle );
}
_baseRef foobar_ArrayOf__Duration_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::std::vector< ::std::chrono::seconds >>*>( handle ) );
}
_baseRef foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< std::chrono::milliseconds >( ) );
}
_baseRef foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< std::chrono::milliseconds >( *reinterpret_cast<::std::vector< std::chrono::milliseconds >*>( handle ) ) );
}
void foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< std::chrono::milliseconds >*>( handle );
}
uint64_t foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_count(_baseRef handle) {
    return Conversion<::std::vector< std::chrono::milliseconds >>::toCpp( handle ).size( );
}
double foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_get( _baseRef handle, uint64_t index ) {
    return Conversion<std::chrono::milliseconds>::referenceBaseRef(Conversion<::std::vector< std::chrono::milliseconds >>::toCpp( handle )[index]);
}
void foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_append( _baseRef handle, double item )
{
    Conversion<::std::vector< std::chrono::milliseconds >>::toCpp(handle).push_back(Conversion<std::chrono::milliseconds>::toCpp(item));
}
_baseRef foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) std::optional<::std::vector< std::chrono::milliseconds >>( ::std::vector< std::chrono::milliseconds >( ) ) );
}
void foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::std::vector< std::chrono::milliseconds >>*>( handle );
}
_baseRef foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::std::vector< std::chrono::milliseconds >>*>( handle ) );
}
_baseRef foobar_MapOf__Duration_To__String_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >() );
}
void foobar_MapOf__Duration_To__String_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >>(handle);
}
_baseRef foobar_MapOf__Duration_To__String_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >::iterator( get_pointer<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >>(handle)->begin() ) );
}
void foobar_MapOf__Duration_To__String_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >::iterator*>( iterator_handle );
}
void foobar_MapOf__Duration_To__String_put(_baseRef handle, double key, _baseRef value) {
    (*get_pointer<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >>(handle)).emplace(Conversion<::std::chrono::seconds>::toCpp(key), Conversion<::std::string>::toCpp(value));
}
bool foobar_MapOf__Duration_To__String_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >>(handle)->end();
}
void foobar_MapOf__Duration_To__String_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >::iterator*>( iterator_handle );
}
double foobar_MapOf__Duration_To__String_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::chrono::seconds>::toBaseRef(key);
}
_baseRef foobar_MapOf__Duration_To__String_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::string>::toBaseRef(value);
}
_baseRef foobar_MapOf__Duration_To__String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) std::optional<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >>( ::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >( ) ) );
}
void foobar_MapOf__Duration_To__String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >>*>( handle );
}
_baseRef foobar_MapOf__Duration_To__String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >>*>( handle ) );
}
_baseRef foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >() );
}
void foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >>(handle);
}
_baseRef foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >::iterator( get_pointer<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >>(handle)->begin() ) );
}
void foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >::iterator*>( iterator_handle );
}
void foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_put(_baseRef handle, double key, _baseRef value) {
    (*get_pointer<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >>(handle)).emplace(Conversion<std::chrono::milliseconds>::toCpp(key), Conversion<::std::string>::toCpp(value));
}
bool foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >>(handle)->end();
}
void foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >::iterator*>( iterator_handle );
}
double foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >::iterator*>( iterator_handle ))->first;
    return Conversion<std::chrono::milliseconds>::toBaseRef(key);
}
_baseRef foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::string>::toBaseRef(value);
}
_baseRef foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) std::optional<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >>( ::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >( ) ) );
}
void foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >>*>( handle );
}
_baseRef foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >>*>( handle ) );
}
_baseRef foobar_MapOf__String_To__Duration_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::std::chrono::seconds >() );
}
void foobar_MapOf__String_To__Duration_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::string, ::std::chrono::seconds >>(handle);
}
_baseRef foobar_MapOf__String_To__Duration_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::std::chrono::seconds >::iterator( get_pointer<::std::unordered_map< ::std::string, ::std::chrono::seconds >>(handle)->begin() ) );
}
void foobar_MapOf__String_To__Duration_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::string, ::std::chrono::seconds >::iterator*>( iterator_handle );
}
void foobar_MapOf__String_To__Duration_put(_baseRef handle, _baseRef key, double value) {
    (*get_pointer<::std::unordered_map< ::std::string, ::std::chrono::seconds >>(handle)).emplace(Conversion<::std::string>::toCpp(key), Conversion<::std::chrono::seconds>::toCpp(value));
}
bool foobar_MapOf__String_To__Duration_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::string, ::std::chrono::seconds >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::string, ::std::chrono::seconds >>(handle)->end();
}
void foobar_MapOf__String_To__Duration_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::string, ::std::chrono::seconds >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf__String_To__Duration_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::string, ::std::chrono::seconds >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::string>::toBaseRef(key);
}
double foobar_MapOf__String_To__Duration_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::string, ::std::chrono::seconds >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::chrono::seconds>::toBaseRef(value);
}
_baseRef foobar_MapOf__String_To__Duration_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) std::optional<::std::unordered_map< ::std::string, ::std::chrono::seconds >>( ::std::unordered_map< ::std::string, ::std::chrono::seconds >( ) ) );
}
void foobar_MapOf__String_To__Duration_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::std::unordered_map< ::std::string, ::std::chrono::seconds >>*>( handle );
}
_baseRef foobar_MapOf__String_To__Duration_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::std::unordered_map< ::std::string, ::std::chrono::seconds >>*>( handle ) );
}
_baseRef foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, std::chrono::milliseconds >() );
}
void foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::string, std::chrono::milliseconds >>(handle);
}
_baseRef foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, std::chrono::milliseconds >::iterator( get_pointer<::std::unordered_map< ::std::string, std::chrono::milliseconds >>(handle)->begin() ) );
}
void foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::string, std::chrono::milliseconds >::iterator*>( iterator_handle );
}
void foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_put(_baseRef handle, _baseRef key, double value) {
    (*get_pointer<::std::unordered_map< ::std::string, std::chrono::milliseconds >>(handle)).emplace(Conversion<::std::string>::toCpp(key), Conversion<std::chrono::milliseconds>::toCpp(value));
}
bool foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::string, std::chrono::milliseconds >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::string, std::chrono::milliseconds >>(handle)->end();
}
void foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::string, std::chrono::milliseconds >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::string, std::chrono::milliseconds >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::string>::toBaseRef(key);
}
double foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::string, std::chrono::milliseconds >::iterator*>( iterator_handle ))->second;
    return Conversion<std::chrono::milliseconds>::toBaseRef(value);
}
_baseRef foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) std::optional<::std::unordered_map< ::std::string, std::chrono::milliseconds >>( ::std::unordered_map< ::std::string, std::chrono::milliseconds >( ) ) );
}
void foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::std::unordered_map< ::std::string, std::chrono::milliseconds >>*>( handle );
}
_baseRef foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::std::unordered_map< ::std::string, std::chrono::milliseconds >>*>( handle ) );
}
_baseRef foobar_SetOf__Duration_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >() );
}
void foobar_SetOf__Duration_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >>(handle);
}
void foobar_SetOf__Duration_insert(_baseRef handle, double value) {
    (*get_pointer<::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >>(handle)).insert(::std::move(Conversion<::std::chrono::seconds>::toCpp(value)));
}
_baseRef foobar_SetOf__Duration_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >::iterator( get_pointer<::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >>(handle)->begin() ) );
}
void foobar_SetOf__Duration_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >::iterator*>( iterator_handle );
}
bool foobar_SetOf__Duration_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >>(handle)->end();
}
void foobar_SetOf__Duration_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >::iterator*>( iterator_handle );
}
double foobar_SetOf__Duration_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >::iterator*>( iterator_handle );
    return Conversion<::std::chrono::seconds>::referenceBaseRef(value);
}
_baseRef foobar_SetOf__Duration_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) std::optional<::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >>( ::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >( ) ) );
}
void foobar_SetOf__Duration_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >>*>( handle );
}
_baseRef foobar_SetOf__Duration_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >>*>( handle ) );
}
_baseRef foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >() );
}
void foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >>(handle);
}
void foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_insert(_baseRef handle, double value) {
    (*get_pointer<::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >>(handle)).insert(::std::move(Conversion<std::chrono::milliseconds>::toCpp(value)));
}
_baseRef foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >::iterator( get_pointer<::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >>(handle)->begin() ) );
}
void foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >::iterator*>( iterator_handle );
}
bool foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >>(handle)->end();
}
void foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >::iterator*>( iterator_handle );
}
double foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >::iterator*>( iterator_handle );
    return Conversion<std::chrono::milliseconds>::referenceBaseRef(value);
}
_baseRef foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) std::optional<::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >>( ::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >( ) ) );
}
void foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >>*>( handle );
}
_baseRef foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >>*>( handle ) );
}
