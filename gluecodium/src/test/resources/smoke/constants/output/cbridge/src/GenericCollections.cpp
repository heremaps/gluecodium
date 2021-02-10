//
//
#include "cbridge/include/GenericCollections.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <new>
_baseRef foobar_ArrayOf__String_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::string >( ) );
}
_baseRef foobar_ArrayOf__String_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::string >( *reinterpret_cast<::std::vector< ::std::string >*>( handle ) ) );
}
void foobar_ArrayOf__String_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::string >*>( handle );
}
uint64_t foobar_ArrayOf__String_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::string >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf__String_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::string>::referenceBaseRef(Conversion<::std::vector< ::std::string >>::toCpp( handle )[index]);
}
void foobar_ArrayOf__String_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::std::string >>::toCpp(handle).push_back(Conversion<::std::string>::toCpp(item));
}
_baseRef foobar_ArrayOf__String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::string >>( ::std::vector< ::std::string >( ) ) );
}
void foobar_ArrayOf__String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::string >>*>( handle );
}
_baseRef foobar_ArrayOf__String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::string >>*>( handle ) );
}
_baseRef foobar_MapOf__String_To__String_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::std::string >() );
}
void foobar_MapOf__String_To__String_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::string, ::std::string >>(handle);
}
_baseRef foobar_MapOf__String_To__String_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::std::string >::iterator( get_pointer<::std::unordered_map< ::std::string, ::std::string >>(handle)->begin() ) );
}
void foobar_MapOf__String_To__String_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::string, ::std::string >::iterator*>( iterator_handle );
}
void foobar_MapOf__String_To__String_put(_baseRef handle, _baseRef key, _baseRef value) {
    (*get_pointer<::std::unordered_map< ::std::string, ::std::string >>(handle)).emplace(Conversion<::std::string>::toCpp(key), Conversion<::std::string>::toCpp(value));
}
bool foobar_MapOf__String_To__String_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::string, ::std::string >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::string, ::std::string >>(handle)->end();
}
void foobar_MapOf__String_To__String_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::string, ::std::string >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf__String_To__String_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::string, ::std::string >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::string>::toBaseRef(key);
}
_baseRef foobar_MapOf__String_To__String_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::string, ::std::string >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::string>::toBaseRef(value);
}
_baseRef foobar_MapOf__String_To__String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::std::string, ::std::string >>( ::std::unordered_map< ::std::string, ::std::string >( ) ) );
}
void foobar_MapOf__String_To__String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::string, ::std::string >>*>( handle );
}
_baseRef foobar_MapOf__String_To__String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::string, ::std::string >>*>( handle ) );
}
_baseRef foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >() );
}
void foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >>(handle);
}
_baseRef foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >::iterator( get_pointer<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >>(handle)->begin() ) );
}
void foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >::iterator*>( iterator_handle );
}
void foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_put(_baseRef handle, _baseRef key, _baseRef value) {
    (*get_pointer<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >>(handle)).emplace(Conversion<::std::vector< ::std::string >>::toCpp(key), Conversion<::std::unordered_set< ::std::string >>::toCpp(value));
}
bool foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >>(handle)->end();
}
void foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::vector< ::std::string >>::toBaseRef(key);
}
_baseRef foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::unordered_set< ::std::string >>::toBaseRef(value);
}
_baseRef foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >>( ::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >( ) ) );
}
void foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >>*>( handle );
}
_baseRef foobar_MapOf_foobar_ArrayOf__String_To_foobar_SetOf__String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > >>*>( handle ) );
}
_baseRef foobar_SetOf__String_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::string >() );
}
void foobar_SetOf__String_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< ::std::string >>(handle);
}
void foobar_SetOf__String_insert(_baseRef handle, _baseRef value) {
    (*get_pointer<::std::unordered_set< ::std::string >>(handle)).insert(::std::move(Conversion<::std::string>::toCpp(value)));
}
_baseRef foobar_SetOf__String_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::string >::iterator( get_pointer<::std::unordered_set< ::std::string >>(handle)->begin() ) );
}
void foobar_SetOf__String_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< ::std::string >::iterator*>( iterator_handle );
}
bool foobar_SetOf__String_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< ::std::string >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< ::std::string >>(handle)->end();
}
void foobar_SetOf__String_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< ::std::string >::iterator*>( iterator_handle );
}
_baseRef foobar_SetOf__String_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< ::std::string >::iterator*>( iterator_handle );
    return Conversion<::std::string>::referenceBaseRef(value);
}
_baseRef foobar_SetOf__String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_set< ::std::string >>( ::std::unordered_set< ::std::string >( ) ) );
}
void foobar_SetOf__String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::std::string >>*>( handle );
}
_baseRef foobar_SetOf__String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::std::string >>*>( handle ) );
}
