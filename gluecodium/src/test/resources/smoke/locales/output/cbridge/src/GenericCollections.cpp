//
//
#include "cbridge/include/GenericCollections.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Locale.h"
#include "gluecodium/Optional.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <new>
_baseRef foobar_ArrayOf__Locale_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::gluecodium::Locale >( ) );
}
_baseRef foobar_ArrayOf__Locale_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::gluecodium::Locale >( *reinterpret_cast<::std::vector< ::gluecodium::Locale >*>( handle ) ) );
}
void foobar_ArrayOf__Locale_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::gluecodium::Locale >*>( handle );
}
uint64_t foobar_ArrayOf__Locale_count(_baseRef handle) {
    return Conversion<::std::vector< ::gluecodium::Locale >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf__Locale_get( _baseRef handle, uint64_t index ) {
    return Conversion<::gluecodium::Locale>::referenceBaseRef(Conversion<::std::vector< ::gluecodium::Locale >>::toCpp( handle )[index]);
}
void foobar_ArrayOf__Locale_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::gluecodium::Locale >>::toCpp(handle).push_back(Conversion<::gluecodium::Locale>::toCpp(item));
}
_baseRef foobar_ArrayOf__Locale_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::gluecodium::Locale >>( ::std::vector< ::gluecodium::Locale >( ) ) );
}
void foobar_ArrayOf__Locale_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::gluecodium::Locale >>*>( handle );
}
_baseRef foobar_ArrayOf__Locale_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::gluecodium::Locale >>*>( handle ) );
}
_baseRef foobar_MapOf__Locale_To__String_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >() );
}
void foobar_MapOf__Locale_To__String_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >>(handle);
}
_baseRef foobar_MapOf__Locale_To__String_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >::iterator( get_pointer<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >>(handle)->begin() ) );
}
void foobar_MapOf__Locale_To__String_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >::iterator*>( iterator_handle );
}
void foobar_MapOf__Locale_To__String_put(_baseRef handle, _baseRef key, _baseRef value) {
    (*get_pointer<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >>(handle)).emplace(Conversion<::gluecodium::Locale>::toCpp(key), Conversion<::std::string>::toCpp(value));
}
bool foobar_MapOf__Locale_To__String_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >>(handle)->end();
}
void foobar_MapOf__Locale_To__String_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf__Locale_To__String_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >::iterator*>( iterator_handle ))->first;
    return Conversion<::gluecodium::Locale>::toBaseRef(key);
}
_baseRef foobar_MapOf__Locale_To__String_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::string>::toBaseRef(value);
}
_baseRef foobar_MapOf__Locale_To__String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >>( ::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >( ) ) );
}
void foobar_MapOf__Locale_To__String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >>*>( handle );
}
_baseRef foobar_MapOf__Locale_To__String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::gluecodium::Locale, ::std::string, ::gluecodium::hash< ::gluecodium::Locale > >>*>( handle ) );
}
_baseRef foobar_MapOf__String_To__Locale_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::gluecodium::Locale >() );
}
void foobar_MapOf__String_To__Locale_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::string, ::gluecodium::Locale >>(handle);
}
_baseRef foobar_MapOf__String_To__Locale_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::gluecodium::Locale >::iterator( get_pointer<::std::unordered_map< ::std::string, ::gluecodium::Locale >>(handle)->begin() ) );
}
void foobar_MapOf__String_To__Locale_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::string, ::gluecodium::Locale >::iterator*>( iterator_handle );
}
void foobar_MapOf__String_To__Locale_put(_baseRef handle, _baseRef key, _baseRef value) {
    (*get_pointer<::std::unordered_map< ::std::string, ::gluecodium::Locale >>(handle)).emplace(Conversion<::std::string>::toCpp(key), Conversion<::gluecodium::Locale>::toCpp(value));
}
bool foobar_MapOf__String_To__Locale_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::string, ::gluecodium::Locale >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::string, ::gluecodium::Locale >>(handle)->end();
}
void foobar_MapOf__String_To__Locale_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::string, ::gluecodium::Locale >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf__String_To__Locale_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::string, ::gluecodium::Locale >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::string>::toBaseRef(key);
}
_baseRef foobar_MapOf__String_To__Locale_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::string, ::gluecodium::Locale >::iterator*>( iterator_handle ))->second;
    return Conversion<::gluecodium::Locale>::toBaseRef(value);
}
_baseRef foobar_MapOf__String_To__Locale_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::std::string, ::gluecodium::Locale >>( ::std::unordered_map< ::std::string, ::gluecodium::Locale >( ) ) );
}
void foobar_MapOf__String_To__Locale_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::string, ::gluecodium::Locale >>*>( handle );
}
_baseRef foobar_MapOf__String_To__Locale_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::string, ::gluecodium::Locale >>*>( handle ) );
}
_baseRef foobar_SetOf__Locale_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >() );
}
void foobar_SetOf__Locale_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >>(handle);
}
void foobar_SetOf__Locale_insert(_baseRef handle, _baseRef value) {
    (*get_pointer<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >>(handle)).insert(::std::move(Conversion<::gluecodium::Locale>::toCpp(value)));
}
_baseRef foobar_SetOf__Locale_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >::iterator( get_pointer<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >>(handle)->begin() ) );
}
void foobar_SetOf__Locale_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >::iterator*>( iterator_handle );
}
bool foobar_SetOf__Locale_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >>(handle)->end();
}
void foobar_SetOf__Locale_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >::iterator*>( iterator_handle );
}
_baseRef foobar_SetOf__Locale_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >::iterator*>( iterator_handle );
    return Conversion<::gluecodium::Locale>::referenceBaseRef(value);
}
_baseRef foobar_SetOf__Locale_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >>( ::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >( ) ) );
}
void foobar_SetOf__Locale_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >>*>( handle );
}
_baseRef foobar_SetOf__Locale_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::gluecodium::Locale, ::gluecodium::hash< ::gluecodium::Locale > >>*>( handle ) );
}
