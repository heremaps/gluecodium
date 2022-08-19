//
//
#include "cbridge\include\GenericCollections.h"
#include "alien\FooEnum.h"
#include "alien\FooStruct.h"
#include "cbridge\include\StringHandle.h"
#include "cbridge_internal\include\BaseHandleImpl.h"
#include "gluecodium\Hash.h"
#include "gluecodium\Optional.h"
#include "gluecodium\UnorderedMapHash.h"
#include "gluecodium\UnorderedSetHash.h"
#include "gluecodium\VectorHash.h"
#include "smoke\AnotherDummyClass.h"
#include "smoke\AuxStruct.h"
#include "smoke\DummyClass.h"
#include "smoke\DummyInterface.h"
#include "smoke\GenericTypesWithCompoundTypes.h"
#include "smoke\UnreasonablyLazyClass.h"
#include "smoke\VeryBigStruct.h"
#include "smoke\YetAnotherDummyClass.h"
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <new>
_baseRef foobar_ArrayOf__Float_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< float >( ) );
}
_baseRef foobar_ArrayOf__Float_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< float >( *reinterpret_cast<::std::vector< float >*>( handle ) ) );
}
void foobar_ArrayOf__Float_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< float >*>( handle );
}
uint64_t foobar_ArrayOf__Float_count(_baseRef handle) {
    return Conversion<::std::vector< float >>::toCpp( handle ).size( );
}
float foobar_ArrayOf__Float_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::vector< float >>::toCpp(handle)[ index ];
}
void foobar_ArrayOf__Float_append( _baseRef handle, float item )
{
    Conversion<::std::vector< float >>::toCpp(handle).push_back( item );
}
_baseRef foobar_ArrayOf__Float_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< float >>( ::std::vector< float >( ) ) );
}
void foobar_ArrayOf__Float_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< float >>*>( handle );
}
_baseRef foobar_ArrayOf__Float_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< float >>*>( handle ) );
}
_baseRef foobar_ArrayOf__Int_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< int32_t >( ) );
}
_baseRef foobar_ArrayOf__Int_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< int32_t >( *reinterpret_cast<::std::vector< int32_t >*>( handle ) ) );
}
void foobar_ArrayOf__Int_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< int32_t >*>( handle );
}
uint64_t foobar_ArrayOf__Int_count(_baseRef handle) {
    return Conversion<::std::vector< int32_t >>::toCpp( handle ).size( );
}
int32_t foobar_ArrayOf__Int_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::vector< int32_t >>::toCpp(handle)[ index ];
}
void foobar_ArrayOf__Int_append( _baseRef handle, int32_t item )
{
    Conversion<::std::vector< int32_t >>::toCpp(handle).push_back( item );
}
_baseRef foobar_ArrayOf__Int_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< int32_t >>( ::std::vector< int32_t >( ) ) );
}
void foobar_ArrayOf__Int_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< int32_t >>*>( handle );
}
_baseRef foobar_ArrayOf__Int_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< int32_t >>*>( handle ) );
}
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
_baseRef foobar_ArrayOf__UByte_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< uint8_t >( ) );
}
_baseRef foobar_ArrayOf__UByte_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< uint8_t >( *reinterpret_cast<::std::vector< uint8_t >*>( handle ) ) );
}
void foobar_ArrayOf__UByte_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< uint8_t >*>( handle );
}
uint64_t foobar_ArrayOf__UByte_count(_baseRef handle) {
    return Conversion<::std::vector< uint8_t >>::toCpp( handle ).size( );
}
uint8_t foobar_ArrayOf__UByte_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::vector< uint8_t >>::toCpp(handle)[ index ];
}
void foobar_ArrayOf__UByte_append( _baseRef handle, uint8_t item )
{
    Conversion<::std::vector< uint8_t >>::toCpp(handle).push_back( item );
}
_baseRef foobar_ArrayOf__UByte_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< uint8_t >>( ::std::vector< uint8_t >( ) ) );
}
void foobar_ArrayOf__UByte_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< uint8_t >>*>( handle );
}
_baseRef foobar_ArrayOf__UByte_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< uint8_t >>*>( handle ) );
}
_baseRef foobar_ArrayOf_foobar_ArrayOf__Int_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::vector< int32_t > >( ) );
}
_baseRef foobar_ArrayOf_foobar_ArrayOf__Int_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::vector< int32_t > >( *reinterpret_cast<::std::vector< ::std::vector< int32_t > >*>( handle ) ) );
}
void foobar_ArrayOf_foobar_ArrayOf__Int_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::vector< int32_t > >*>( handle );
}
uint64_t foobar_ArrayOf_foobar_ArrayOf__Int_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::vector< int32_t > >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_foobar_ArrayOf__Int_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::vector< int32_t >>::referenceBaseRef(Conversion<::std::vector< ::std::vector< int32_t > >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_foobar_ArrayOf__Int_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::std::vector< int32_t > >>::toCpp(handle).push_back(Conversion<::std::vector< int32_t >>::toCpp(item));
}
_baseRef foobar_ArrayOf_foobar_ArrayOf__Int_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::vector< int32_t > >>( ::std::vector< ::std::vector< int32_t > >( ) ) );
}
void foobar_ArrayOf_foobar_ArrayOf__Int_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::vector< int32_t > >>*>( handle );
}
_baseRef foobar_ArrayOf_foobar_ArrayOf__Int_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::vector< int32_t > >>*>( handle ) );
}
_baseRef foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::unordered_map< int32_t, bool > >( ) );
}
_baseRef foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::unordered_map< int32_t, bool > >( *reinterpret_cast<::std::vector< ::std::unordered_map< int32_t, bool > >*>( handle ) ) );
}
void foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::unordered_map< int32_t, bool > >*>( handle );
}
uint64_t foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::unordered_map< int32_t, bool > >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::unordered_map< int32_t, bool >>::referenceBaseRef(Conversion<::std::vector< ::std::unordered_map< int32_t, bool > >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::std::unordered_map< int32_t, bool > >>::toCpp(handle).push_back(Conversion<::std::unordered_map< int32_t, bool >>::toCpp(item));
}
_baseRef foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::unordered_map< int32_t, bool > >>( ::std::vector< ::std::unordered_map< int32_t, bool > >( ) ) );
}
void foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::unordered_map< int32_t, bool > >>*>( handle );
}
_baseRef foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::unordered_map< int32_t, bool > >>*>( handle ) );
}
_baseRef foobar_ArrayOf_foobar_SetOf__Int_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::unordered_set< int32_t > >( ) );
}
_baseRef foobar_ArrayOf_foobar_SetOf__Int_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::unordered_set< int32_t > >( *reinterpret_cast<::std::vector< ::std::unordered_set< int32_t > >*>( handle ) ) );
}
void foobar_ArrayOf_foobar_SetOf__Int_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::unordered_set< int32_t > >*>( handle );
}
uint64_t foobar_ArrayOf_foobar_SetOf__Int_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::unordered_set< int32_t > >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_foobar_SetOf__Int_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::unordered_set< int32_t >>::referenceBaseRef(Conversion<::std::vector< ::std::unordered_set< int32_t > >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_foobar_SetOf__Int_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::std::unordered_set< int32_t > >>::toCpp(handle).push_back(Conversion<::std::unordered_set< int32_t >>::toCpp(item));
}
_baseRef foobar_ArrayOf_foobar_SetOf__Int_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::unordered_set< int32_t > >>( ::std::vector< ::std::unordered_set< int32_t > >( ) ) );
}
void foobar_ArrayOf_foobar_SetOf__Int_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::unordered_set< int32_t > >>*>( handle );
}
_baseRef foobar_ArrayOf_foobar_SetOf__Int_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::unordered_set< int32_t > >>*>( handle ) );
}
_baseRef foobar_ArrayOf_smoke_AnotherDummyClass_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::shared_ptr< ::smoke::AnotherDummyClass > >( ) );
}
_baseRef foobar_ArrayOf_smoke_AnotherDummyClass_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::shared_ptr< ::smoke::AnotherDummyClass > >( *reinterpret_cast<::std::vector< ::std::shared_ptr< ::smoke::AnotherDummyClass > >*>( handle ) ) );
}
void foobar_ArrayOf_smoke_AnotherDummyClass_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::shared_ptr< ::smoke::AnotherDummyClass > >*>( handle );
}
uint64_t foobar_ArrayOf_smoke_AnotherDummyClass_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::shared_ptr< ::smoke::AnotherDummyClass > >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_smoke_AnotherDummyClass_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::shared_ptr< ::smoke::AnotherDummyClass >>::referenceBaseRef(Conversion<::std::vector< ::std::shared_ptr< ::smoke::AnotherDummyClass > >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_smoke_AnotherDummyClass_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::std::shared_ptr< ::smoke::AnotherDummyClass > >>::toCpp(handle).push_back(Conversion<::std::shared_ptr< ::smoke::AnotherDummyClass >>::toCpp(item));
}
_baseRef foobar_ArrayOf_smoke_AnotherDummyClass_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::AnotherDummyClass > >>( ::std::vector< ::std::shared_ptr< ::smoke::AnotherDummyClass > >( ) ) );
}
void foobar_ArrayOf_smoke_AnotherDummyClass_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::AnotherDummyClass > >>*>( handle );
}
_baseRef foobar_ArrayOf_smoke_AnotherDummyClass_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::AnotherDummyClass > >>*>( handle ) );
}
_baseRef foobar_ArrayOf_smoke_AuxStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::smoke::AuxStruct >( ) );
}
_baseRef foobar_ArrayOf_smoke_AuxStruct_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::smoke::AuxStruct >( *reinterpret_cast<::std::vector< ::smoke::AuxStruct >*>( handle ) ) );
}
void foobar_ArrayOf_smoke_AuxStruct_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::smoke::AuxStruct >*>( handle );
}
uint64_t foobar_ArrayOf_smoke_AuxStruct_count(_baseRef handle) {
    return Conversion<::std::vector< ::smoke::AuxStruct >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_smoke_AuxStruct_get( _baseRef handle, uint64_t index ) {
    return Conversion<::smoke::AuxStruct>::referenceBaseRef(Conversion<::std::vector< ::smoke::AuxStruct >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_smoke_AuxStruct_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::smoke::AuxStruct >>::toCpp(handle).push_back(Conversion<::smoke::AuxStruct>::toCpp(item));
}
_baseRef foobar_ArrayOf_smoke_AuxStruct_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::smoke::AuxStruct >>( ::std::vector< ::smoke::AuxStruct >( ) ) );
}
void foobar_ArrayOf_smoke_AuxStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::smoke::AuxStruct >>*>( handle );
}
_baseRef foobar_ArrayOf_smoke_AuxStruct_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::smoke::AuxStruct >>*>( handle ) );
}
_baseRef foobar_ArrayOf_smoke_DummyClass_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >( ) );
}
_baseRef foobar_ArrayOf_smoke_DummyClass_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >( *reinterpret_cast<::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >*>( handle ) ) );
}
void foobar_ArrayOf_smoke_DummyClass_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >*>( handle );
}
uint64_t foobar_ArrayOf_smoke_DummyClass_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_smoke_DummyClass_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::shared_ptr< ::smoke::DummyClass >>::referenceBaseRef(Conversion<::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_smoke_DummyClass_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >>::toCpp(handle).push_back(Conversion<::std::shared_ptr< ::smoke::DummyClass >>::toCpp(item));
}
_baseRef foobar_ArrayOf_smoke_DummyClass_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >>( ::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >( ) ) );
}
void foobar_ArrayOf_smoke_DummyClass_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >>*>( handle );
}
_baseRef foobar_ArrayOf_smoke_DummyClass_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >>*>( handle ) );
}
_baseRef foobar_ArrayOf_smoke_DummyInterface_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > >( ) );
}
_baseRef foobar_ArrayOf_smoke_DummyInterface_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > >( *reinterpret_cast<::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > >*>( handle ) ) );
}
void foobar_ArrayOf_smoke_DummyInterface_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > >*>( handle );
}
uint64_t foobar_ArrayOf_smoke_DummyInterface_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_smoke_DummyInterface_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::shared_ptr< ::smoke::DummyInterface >>::referenceBaseRef(Conversion<::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_smoke_DummyInterface_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > >>::toCpp(handle).push_back(Conversion<::std::shared_ptr< ::smoke::DummyInterface >>::toCpp(item));
}
_baseRef foobar_ArrayOf_smoke_DummyInterface_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > >>( ::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > >( ) ) );
}
void foobar_ArrayOf_smoke_DummyInterface_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > >>*>( handle );
}
_baseRef foobar_ArrayOf_smoke_DummyInterface_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > >>*>( handle ) );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >( ) );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >( *reinterpret_cast<::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >*>( handle ) ) );
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >*>( handle );
}
uint64_t foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_count(_baseRef handle) {
    return Conversion<::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_get( _baseRef handle, uint64_t index ) {
    return Conversion<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::referenceBaseRef(Conversion<::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>::toCpp(handle).push_back(Conversion<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::toCpp(item));
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>( ::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >( ) ) );
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>*>( handle );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>*>( handle ) );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::alien::FooEnum >( ) );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::alien::FooEnum >( *reinterpret_cast<::std::vector< ::alien::FooEnum >*>( handle ) ) );
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::alien::FooEnum >*>( handle );
}
uint64_t foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_count(_baseRef handle) {
    return Conversion<::std::vector< ::alien::FooEnum >>::toCpp( handle ).size( );
}
uint32_t foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get( _baseRef handle, uint64_t index ) {
    return static_cast<uint32_t>(Conversion<::std::vector< ::alien::FooEnum >>::toCpp(handle)[ index ]);
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_append( _baseRef handle, uint32_t item )
{
    Conversion<::std::vector< ::alien::FooEnum >>::toCpp(handle).push_back( static_cast<::alien::FooEnum>( item ) );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::alien::FooEnum >>( ::std::vector< ::alien::FooEnum >( ) ) );
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::alien::FooEnum >>*>( handle );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::alien::FooEnum >>*>( handle ) );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::alien::FooStruct >( ) );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::alien::FooStruct >( *reinterpret_cast<::std::vector< ::alien::FooStruct >*>( handle ) ) );
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::alien::FooStruct >*>( handle );
}
uint64_t foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_count(_baseRef handle) {
    return Conversion<::std::vector< ::alien::FooStruct >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get( _baseRef handle, uint64_t index ) {
    return Conversion<::alien::FooStruct>::referenceBaseRef(Conversion<::std::vector< ::alien::FooStruct >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::alien::FooStruct >>::toCpp(handle).push_back(Conversion<::alien::FooStruct>::toCpp(item));
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::alien::FooStruct >>( ::std::vector< ::alien::FooStruct >( ) ) );
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::alien::FooStruct >>*>( handle );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::alien::FooStruct >>*>( handle ) );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >( ) );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >( *reinterpret_cast<::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >*>( handle ) ) );
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >*>( handle );
}
uint64_t foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_count(_baseRef handle) {
    return Conversion<::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>::toCpp( handle ).size( );
}
uint32_t foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get( _baseRef handle, uint64_t index ) {
    return static_cast<uint32_t>(Conversion<::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>::toCpp(handle)[ index ]);
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_append( _baseRef handle, uint32_t item )
{
    Conversion<::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>::toCpp(handle).push_back( static_cast<::smoke::GenericTypesWithCompoundTypes::SomeEnum>( item ) );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>( ::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >( ) ) );
}
void foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>*>( handle );
}
_baseRef foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>*>( handle ) );
}
_baseRef foobar_ArrayOf_smoke_UnreasonablyLazyClass_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >( ) );
}
_baseRef foobar_ArrayOf_smoke_UnreasonablyLazyClass_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >( *reinterpret_cast<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >*>( handle ) ) );
}
void foobar_ArrayOf_smoke_UnreasonablyLazyClass_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >*>( handle );
}
uint64_t foobar_ArrayOf_smoke_UnreasonablyLazyClass_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_smoke_UnreasonablyLazyClass_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::shared_ptr< ::smoke::UnreasonablyLazyClass >>::referenceBaseRef(Conversion<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_smoke_UnreasonablyLazyClass_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>::toCpp(handle).push_back(Conversion<::std::shared_ptr< ::smoke::UnreasonablyLazyClass >>::toCpp(item));
}
_baseRef foobar_ArrayOf_smoke_UnreasonablyLazyClass_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>( ::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >( ) ) );
}
void foobar_ArrayOf_smoke_UnreasonablyLazyClass_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>*>( handle );
}
_baseRef foobar_ArrayOf_smoke_UnreasonablyLazyClass_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>*>( handle ) );
}
_baseRef foobar_ArrayOf_smoke_VeryBigStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::smoke::VeryBigStruct >( ) );
}
_baseRef foobar_ArrayOf_smoke_VeryBigStruct_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::smoke::VeryBigStruct >( *reinterpret_cast<::std::vector< ::smoke::VeryBigStruct >*>( handle ) ) );
}
void foobar_ArrayOf_smoke_VeryBigStruct_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::smoke::VeryBigStruct >*>( handle );
}
uint64_t foobar_ArrayOf_smoke_VeryBigStruct_count(_baseRef handle) {
    return Conversion<::std::vector< ::smoke::VeryBigStruct >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_smoke_VeryBigStruct_get( _baseRef handle, uint64_t index ) {
    return Conversion<::smoke::VeryBigStruct>::referenceBaseRef(Conversion<::std::vector< ::smoke::VeryBigStruct >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_smoke_VeryBigStruct_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::smoke::VeryBigStruct >>::toCpp(handle).push_back(Conversion<::smoke::VeryBigStruct>::toCpp(item));
}
_baseRef foobar_ArrayOf_smoke_VeryBigStruct_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::smoke::VeryBigStruct >>( ::std::vector< ::smoke::VeryBigStruct >( ) ) );
}
void foobar_ArrayOf_smoke_VeryBigStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::smoke::VeryBigStruct >>*>( handle );
}
_baseRef foobar_ArrayOf_smoke_VeryBigStruct_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::smoke::VeryBigStruct >>*>( handle ) );
}
_baseRef foobar_ArrayOf_smoke_YetAnotherDummyClass_create_handle() {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::shared_ptr< ::smoke::YetAnotherDummyClass > >( ) );
}
_baseRef foobar_ArrayOf_smoke_YetAnotherDummyClass_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ::std::vector< ::std::shared_ptr< ::smoke::YetAnotherDummyClass > >( *reinterpret_cast<::std::vector< ::std::shared_ptr< ::smoke::YetAnotherDummyClass > >*>( handle ) ) );
}
void foobar_ArrayOf_smoke_YetAnotherDummyClass_release_handle(_baseRef handle) {
    delete reinterpret_cast<::std::vector< ::std::shared_ptr< ::smoke::YetAnotherDummyClass > >*>( handle );
}
uint64_t foobar_ArrayOf_smoke_YetAnotherDummyClass_count(_baseRef handle) {
    return Conversion<::std::vector< ::std::shared_ptr< ::smoke::YetAnotherDummyClass > >>::toCpp( handle ).size( );
}
_baseRef foobar_ArrayOf_smoke_YetAnotherDummyClass_get( _baseRef handle, uint64_t index ) {
    return Conversion<::std::shared_ptr< ::smoke::YetAnotherDummyClass >>::referenceBaseRef(Conversion<::std::vector< ::std::shared_ptr< ::smoke::YetAnotherDummyClass > >>::toCpp( handle )[index]);
}
void foobar_ArrayOf_smoke_YetAnotherDummyClass_append( _baseRef handle, _baseRef item )
{
    Conversion<::std::vector< ::std::shared_ptr< ::smoke::YetAnotherDummyClass > >>::toCpp(handle).push_back(Conversion<::std::shared_ptr< ::smoke::YetAnotherDummyClass >>::toCpp(item));
}
_baseRef foobar_ArrayOf_smoke_YetAnotherDummyClass_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::YetAnotherDummyClass > >>( ::std::vector< ::std::shared_ptr< ::smoke::YetAnotherDummyClass > >( ) ) );
}
void foobar_ArrayOf_smoke_YetAnotherDummyClass_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::YetAnotherDummyClass > >>*>( handle );
}
_baseRef foobar_ArrayOf_smoke_YetAnotherDummyClass_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::vector< ::std::shared_ptr< ::smoke::YetAnotherDummyClass > >>*>( handle ) );
}
_baseRef foobar_MapOf__Float_To__Double_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< float, double >() );
}
void foobar_MapOf__Float_To__Double_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< float, double >>(handle);
}
_baseRef foobar_MapOf__Float_To__Double_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< float, double >::iterator( get_pointer<::std::unordered_map< float, double >>(handle)->begin() ) );
}
void foobar_MapOf__Float_To__Double_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< float, double >::iterator*>( iterator_handle );
}
void foobar_MapOf__Float_To__Double_put(_baseRef handle, float key, double value) {
    (*get_pointer<::std::unordered_map< float, double >>(handle)).emplace(key, value);
}
bool foobar_MapOf__Float_To__Double_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< float, double >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< float, double >>(handle)->end();
}
void foobar_MapOf__Float_To__Double_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< float, double >::iterator*>( iterator_handle );
}
float foobar_MapOf__Float_To__Double_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< float, double >::iterator*>( iterator_handle ))->first;
    return key;
}
double foobar_MapOf__Float_To__Double_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< float, double >::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef foobar_MapOf__Float_To__Double_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< float, double >>( ::std::unordered_map< float, double >( ) ) );
}
void foobar_MapOf__Float_To__Double_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< float, double >>*>( handle );
}
_baseRef foobar_MapOf__Float_To__Double_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< float, double >>*>( handle ) );
}
_baseRef foobar_MapOf__Int_To__Boolean_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, bool >() );
}
void foobar_MapOf__Int_To__Boolean_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< int32_t, bool >>(handle);
}
_baseRef foobar_MapOf__Int_To__Boolean_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, bool >::iterator( get_pointer<::std::unordered_map< int32_t, bool >>(handle)->begin() ) );
}
void foobar_MapOf__Int_To__Boolean_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< int32_t, bool >::iterator*>( iterator_handle );
}
void foobar_MapOf__Int_To__Boolean_put(_baseRef handle, int32_t key, bool value) {
    (*get_pointer<::std::unordered_map< int32_t, bool >>(handle)).emplace(key, value);
}
bool foobar_MapOf__Int_To__Boolean_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< int32_t, bool >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< int32_t, bool >>(handle)->end();
}
void foobar_MapOf__Int_To__Boolean_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< int32_t, bool >::iterator*>( iterator_handle );
}
int32_t foobar_MapOf__Int_To__Boolean_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< int32_t, bool >::iterator*>( iterator_handle ))->first;
    return key;
}
bool foobar_MapOf__Int_To__Boolean_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< int32_t, bool >::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef foobar_MapOf__Int_To__Boolean_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< int32_t, bool >>( ::std::unordered_map< int32_t, bool >( ) ) );
}
void foobar_MapOf__Int_To__Boolean_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, bool >>*>( handle );
}
_baseRef foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, bool >>*>( handle ) );
}
_baseRef foobar_MapOf__Int_To_foobar_ArrayOf__Int_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::std::vector< int32_t > >() );
}
void foobar_MapOf__Int_To_foobar_ArrayOf__Int_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< int32_t, ::std::vector< int32_t > >>(handle);
}
_baseRef foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::std::vector< int32_t > >::iterator( get_pointer<::std::unordered_map< int32_t, ::std::vector< int32_t > >>(handle)->begin() ) );
}
void foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< int32_t, ::std::vector< int32_t > >::iterator*>( iterator_handle );
}
void foobar_MapOf__Int_To_foobar_ArrayOf__Int_put(_baseRef handle, int32_t key, _baseRef value) {
    (*get_pointer<::std::unordered_map< int32_t, ::std::vector< int32_t > >>(handle)).emplace(key, Conversion<::std::vector< int32_t >>::toCpp(value));
}
bool foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< int32_t, ::std::vector< int32_t > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< int32_t, ::std::vector< int32_t > >>(handle)->end();
}
void foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< int32_t, ::std::vector< int32_t > >::iterator*>( iterator_handle );
}
int32_t foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< int32_t, ::std::vector< int32_t > >::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< int32_t, ::std::vector< int32_t > >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::vector< int32_t >>::toBaseRef(value);
}
_baseRef foobar_MapOf__Int_To_foobar_ArrayOf__Int_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< int32_t, ::std::vector< int32_t > >>( ::std::unordered_map< int32_t, ::std::vector< int32_t > >( ) ) );
}
void foobar_MapOf__Int_To_foobar_ArrayOf__Int_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::std::vector< int32_t > >>*>( handle );
}
_baseRef foobar_MapOf__Int_To_foobar_ArrayOf__Int_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::std::vector< int32_t > >>*>( handle ) );
}
_baseRef foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >() );
}
void foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >>(handle);
}
_baseRef foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >::iterator( get_pointer<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >>(handle)->begin() ) );
}
void foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >::iterator*>( iterator_handle );
}
void foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_put(_baseRef handle, int32_t key, _baseRef value) {
    (*get_pointer<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >>(handle)).emplace(key, Conversion<::std::unordered_map< int32_t, bool >>::toCpp(value));
}
bool foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >>(handle)->end();
}
void foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >::iterator*>( iterator_handle );
}
int32_t foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::unordered_map< int32_t, bool >>::toBaseRef(value);
}
_baseRef foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >>( ::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >( ) ) );
}
void foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >>*>( handle );
}
_baseRef foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >>*>( handle ) );
}
_baseRef foobar_MapOf__Int_To_foobar_SetOf__Int_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >() );
}
void foobar_MapOf__Int_To_foobar_SetOf__Int_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >>(handle);
}
_baseRef foobar_MapOf__Int_To_foobar_SetOf__Int_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >::iterator( get_pointer<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >>(handle)->begin() ) );
}
void foobar_MapOf__Int_To_foobar_SetOf__Int_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >::iterator*>( iterator_handle );
}
void foobar_MapOf__Int_To_foobar_SetOf__Int_put(_baseRef handle, int32_t key, _baseRef value) {
    (*get_pointer<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >>(handle)).emplace(key, Conversion<::std::unordered_set< int32_t >>::toCpp(value));
}
bool foobar_MapOf__Int_To_foobar_SetOf__Int_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >>(handle)->end();
}
void foobar_MapOf__Int_To_foobar_SetOf__Int_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >::iterator*>( iterator_handle );
}
int32_t foobar_MapOf__Int_To_foobar_SetOf__Int_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef foobar_MapOf__Int_To_foobar_SetOf__Int_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::unordered_set< int32_t >>::toBaseRef(value);
}
_baseRef foobar_MapOf__Int_To_foobar_SetOf__Int_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >>( ::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >( ) ) );
}
void foobar_MapOf__Int_To_foobar_SetOf__Int_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >>*>( handle );
}
_baseRef foobar_MapOf__Int_To_foobar_SetOf__Int_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >>*>( handle ) );
}
_baseRef foobar_MapOf__Int_To_smoke_DummyClass_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >() );
}
void foobar_MapOf__Int_To_smoke_DummyClass_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >>(handle);
}
_baseRef foobar_MapOf__Int_To_smoke_DummyClass_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >::iterator( get_pointer<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >>(handle)->begin() ) );
}
void foobar_MapOf__Int_To_smoke_DummyClass_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >::iterator*>( iterator_handle );
}
void foobar_MapOf__Int_To_smoke_DummyClass_put(_baseRef handle, int32_t key, _baseRef value) {
    (*get_pointer<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >>(handle)).emplace(key, Conversion<::std::shared_ptr< ::smoke::DummyClass >>::toCpp(value));
}
bool foobar_MapOf__Int_To_smoke_DummyClass_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >>(handle)->end();
}
void foobar_MapOf__Int_To_smoke_DummyClass_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >::iterator*>( iterator_handle );
}
int32_t foobar_MapOf__Int_To_smoke_DummyClass_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef foobar_MapOf__Int_To_smoke_DummyClass_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::shared_ptr< ::smoke::DummyClass >>::toBaseRef(value);
}
_baseRef foobar_MapOf__Int_To_smoke_DummyClass_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >>( ::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >( ) ) );
}
void foobar_MapOf__Int_To_smoke_DummyClass_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >>*>( handle );
}
_baseRef foobar_MapOf__Int_To_smoke_DummyClass_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >>*>( handle ) );
}
_baseRef foobar_MapOf__Int_To_smoke_DummyInterface_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >() );
}
void foobar_MapOf__Int_To_smoke_DummyInterface_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >>(handle);
}
_baseRef foobar_MapOf__Int_To_smoke_DummyInterface_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >::iterator( get_pointer<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >>(handle)->begin() ) );
}
void foobar_MapOf__Int_To_smoke_DummyInterface_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >::iterator*>( iterator_handle );
}
void foobar_MapOf__Int_To_smoke_DummyInterface_put(_baseRef handle, int32_t key, _baseRef value) {
    (*get_pointer<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >>(handle)).emplace(key, Conversion<::std::shared_ptr< ::smoke::DummyInterface >>::toCpp(value));
}
bool foobar_MapOf__Int_To_smoke_DummyInterface_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >>(handle)->end();
}
void foobar_MapOf__Int_To_smoke_DummyInterface_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >::iterator*>( iterator_handle );
}
int32_t foobar_MapOf__Int_To_smoke_DummyInterface_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef foobar_MapOf__Int_To_smoke_DummyInterface_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::shared_ptr< ::smoke::DummyInterface >>::toBaseRef(value);
}
_baseRef foobar_MapOf__Int_To_smoke_DummyInterface_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >>( ::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >( ) ) );
}
void foobar_MapOf__Int_To_smoke_DummyInterface_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >>*>( handle );
}
_baseRef foobar_MapOf__Int_To_smoke_DummyInterface_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > >>*>( handle ) );
}
_baseRef foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::alien::FooEnum >() );
}
void foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< int32_t, ::alien::FooEnum >>(handle);
}
_baseRef foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::alien::FooEnum >::iterator( get_pointer<::std::unordered_map< int32_t, ::alien::FooEnum >>(handle)->begin() ) );
}
void foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< int32_t, ::alien::FooEnum >::iterator*>( iterator_handle );
}
void foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_put(_baseRef handle, int32_t key, uint32_t value) {
    (*get_pointer<::std::unordered_map< int32_t, ::alien::FooEnum >>(handle)).emplace(key, static_cast<::alien::FooEnum>(value));
}
bool foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< int32_t, ::alien::FooEnum >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< int32_t, ::alien::FooEnum >>(handle)->end();
}
void foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< int32_t, ::alien::FooEnum >::iterator*>( iterator_handle );
}
int32_t foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< int32_t, ::alien::FooEnum >::iterator*>( iterator_handle ))->first;
    return key;
}
uint32_t foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< int32_t, ::alien::FooEnum >::iterator*>( iterator_handle ))->second;
    return static_cast<uint32_t>(value);
}
_baseRef foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< int32_t, ::alien::FooEnum >>( ::std::unordered_map< int32_t, ::alien::FooEnum >( ) ) );
}
void foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::alien::FooEnum >>*>( handle );
}
_baseRef foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::alien::FooEnum >>*>( handle ) );
}
_baseRef foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >() );
}
void foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>(handle);
}
_baseRef foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >::iterator( get_pointer<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>(handle)->begin() ) );
}
void foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >::iterator*>( iterator_handle );
}
void foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_put(_baseRef handle, int32_t key, uint32_t value) {
    (*get_pointer<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>(handle)).emplace(key, static_cast<::smoke::GenericTypesWithCompoundTypes::SomeEnum>(value));
}
bool foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>(handle)->end();
}
void foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >::iterator*>( iterator_handle );
}
int32_t foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >::iterator*>( iterator_handle ))->first;
    return key;
}
uint32_t foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >::iterator*>( iterator_handle ))->second;
    return static_cast<uint32_t>(value);
}
_baseRef foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>( ::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >( ) ) );
}
void foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>*>( handle );
}
_baseRef foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >>*>( handle ) );
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
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >() );
}
void foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>(handle);
}
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >::iterator( get_pointer<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>(handle)->begin() ) );
}
void foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >::iterator*>( iterator_handle );
}
void foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_put(_baseRef handle, _baseRef key, _baseRef value) {
    (*get_pointer<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>(handle)).emplace(Conversion<::std::string>::toCpp(key), Conversion<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::toCpp(value));
}
bool foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>(handle)->end();
}
void foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::string>::toBaseRef(key);
}
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >::iterator*>( iterator_handle ))->second;
    return Conversion<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::toBaseRef(value);
}
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>( ::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >( ) ) );
}
void foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>*>( handle );
}
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >>*>( handle ) );
}
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::alien::FooStruct >() );
}
void foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::string, ::alien::FooStruct >>(handle);
}
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::string, ::alien::FooStruct >::iterator( get_pointer<::std::unordered_map< ::std::string, ::alien::FooStruct >>(handle)->begin() ) );
}
void foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::string, ::alien::FooStruct >::iterator*>( iterator_handle );
}
void foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_put(_baseRef handle, _baseRef key, _baseRef value) {
    (*get_pointer<::std::unordered_map< ::std::string, ::alien::FooStruct >>(handle)).emplace(Conversion<::std::string>::toCpp(key), Conversion<::alien::FooStruct>::toCpp(value));
}
bool foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::string, ::alien::FooStruct >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::string, ::alien::FooStruct >>(handle)->end();
}
void foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::string, ::alien::FooStruct >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::string, ::alien::FooStruct >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::string>::toBaseRef(key);
}
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::string, ::alien::FooStruct >::iterator*>( iterator_handle ))->second;
    return Conversion<::alien::FooStruct>::toBaseRef(value);
}
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::std::string, ::alien::FooStruct >>( ::std::unordered_map< ::std::string, ::alien::FooStruct >( ) ) );
}
void foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::string, ::alien::FooStruct >>*>( handle );
}
_baseRef foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::string, ::alien::FooStruct >>*>( handle ) );
}
_baseRef foobar_MapOf__UByte_To__String_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< uint8_t, ::std::string >() );
}
void foobar_MapOf__UByte_To__String_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< uint8_t, ::std::string >>(handle);
}
_baseRef foobar_MapOf__UByte_To__String_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< uint8_t, ::std::string >::iterator( get_pointer<::std::unordered_map< uint8_t, ::std::string >>(handle)->begin() ) );
}
void foobar_MapOf__UByte_To__String_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< uint8_t, ::std::string >::iterator*>( iterator_handle );
}
void foobar_MapOf__UByte_To__String_put(_baseRef handle, uint8_t key, _baseRef value) {
    (*get_pointer<::std::unordered_map< uint8_t, ::std::string >>(handle)).emplace(key, Conversion<::std::string>::toCpp(value));
}
bool foobar_MapOf__UByte_To__String_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< uint8_t, ::std::string >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< uint8_t, ::std::string >>(handle)->end();
}
void foobar_MapOf__UByte_To__String_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< uint8_t, ::std::string >::iterator*>( iterator_handle );
}
uint8_t foobar_MapOf__UByte_To__String_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< uint8_t, ::std::string >::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef foobar_MapOf__UByte_To__String_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< uint8_t, ::std::string >::iterator*>( iterator_handle ))->second;
    return Conversion<::std::string>::toBaseRef(value);
}
_baseRef foobar_MapOf__UByte_To__String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< uint8_t, ::std::string >>( ::std::unordered_map< uint8_t, ::std::string >( ) ) );
}
void foobar_MapOf__UByte_To__String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< uint8_t, ::std::string >>*>( handle );
}
_baseRef foobar_MapOf__UByte_To__String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< uint8_t, ::std::string >>*>( handle ) );
}
_baseRef foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >() );
}
void foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >>(handle);
}
_baseRef foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >::iterator( get_pointer<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >>(handle)->begin() ) );
}
void foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >::iterator*>( iterator_handle );
}
void foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_put(_baseRef handle, _baseRef key, bool value) {
    (*get_pointer<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >>(handle)).emplace(Conversion<::std::vector< int32_t >>::toCpp(key), value);
}
bool foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >>(handle)->end();
}
void foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::vector< int32_t >>::toBaseRef(key);
}
bool foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >>( ::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >( ) ) );
}
void foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >>*>( handle );
}
_baseRef foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > >>*>( handle ) );
}
_baseRef foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >() );
}
void foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>(handle);
}
_baseRef foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >::iterator( get_pointer<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>(handle)->begin() ) );
}
void foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >::iterator*>( iterator_handle );
}
void foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_put(_baseRef handle, _baseRef key, bool value) {
    (*get_pointer<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>(handle)).emplace(Conversion<::std::unordered_map< int32_t, bool >>::toCpp(key), value);
}
bool foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>(handle)->end();
}
void foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::unordered_map< int32_t, bool >>::toBaseRef(key);
}
bool foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>( ::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >( ) ) );
}
void foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>*>( handle );
}
_baseRef foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>*>( handle ) );
}
_baseRef foobar_MapOf_foobar_SetOf__Int_To__Boolean_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >() );
}
void foobar_MapOf_foobar_SetOf__Int_To__Boolean_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>(handle);
}
_baseRef foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >::iterator( get_pointer<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>(handle)->begin() ) );
}
void foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >::iterator*>( iterator_handle );
}
void foobar_MapOf_foobar_SetOf__Int_To__Boolean_put(_baseRef handle, _baseRef key, bool value) {
    (*get_pointer<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>(handle)).emplace(Conversion<::std::unordered_set< int32_t >>::toCpp(key), value);
}
bool foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>(handle)->end();
}
void foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >::iterator*>( iterator_handle );
}
_baseRef foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >::iterator*>( iterator_handle ))->first;
    return Conversion<::std::unordered_set< int32_t >>::toBaseRef(key);
}
bool foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef foobar_MapOf_foobar_SetOf__Int_To__Boolean_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>( ::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >( ) ) );
}
void foobar_MapOf_foobar_SetOf__Int_To__Boolean_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>*>( handle );
}
_baseRef foobar_MapOf_foobar_SetOf__Int_To__Boolean_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>*>( handle ) );
}
_baseRef foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >() );
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >>(handle);
}
_baseRef foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >::iterator( get_pointer<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >>(handle)->begin() ) );
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >::iterator*>( iterator_handle );
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_put(_baseRef handle, uint32_t key, bool value) {
    (*get_pointer<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >>(handle)).emplace(static_cast<::alien::FooEnum>(key), value);
}
bool foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >>(handle)->end();
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >::iterator*>( iterator_handle );
}
uint32_t foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >::iterator*>( iterator_handle ))->first;
    return static_cast<uint32_t>(key);
}
bool foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >>( ::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >( ) ) );
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >>*>( handle );
}
_baseRef foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > >>*>( handle ) );
}
_baseRef foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >() );
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>(handle);
}
_baseRef foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >::iterator( get_pointer<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>(handle)->begin() ) );
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >::iterator*>( iterator_handle );
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_put(_baseRef handle, uint32_t key, bool value) {
    (*get_pointer<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>(handle)).emplace(static_cast<::smoke::GenericTypesWithCompoundTypes::SomeEnum>(key), value);
}
bool foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>(handle)->end();
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >::iterator*>( iterator_handle );
}
uint32_t foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >::iterator*>( iterator_handle ))->first;
    return static_cast<uint32_t>(key);
}
bool foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>( ::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >( ) ) );
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>*>( handle );
}
_baseRef foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>*>( handle ) );
}
_baseRef foobar_SetOf__Float_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< float >() );
}
void foobar_SetOf__Float_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< float >>(handle);
}
void foobar_SetOf__Float_insert(_baseRef handle, float value) {
    (*get_pointer<::std::unordered_set< float >>(handle)).insert(::std::move(value));
}
_baseRef foobar_SetOf__Float_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< float >::iterator( get_pointer<::std::unordered_set< float >>(handle)->begin() ) );
}
void foobar_SetOf__Float_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< float >::iterator*>( iterator_handle );
}
bool foobar_SetOf__Float_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< float >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< float >>(handle)->end();
}
void foobar_SetOf__Float_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< float >::iterator*>( iterator_handle );
}
float foobar_SetOf__Float_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< float >::iterator*>( iterator_handle );
    return value;
}
_baseRef foobar_SetOf__Float_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_set< float >>( ::std::unordered_set< float >( ) ) );
}
void foobar_SetOf__Float_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_set< float >>*>( handle );
}
_baseRef foobar_SetOf__Float_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_set< float >>*>( handle ) );
}
_baseRef foobar_SetOf__Int_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< int32_t >() );
}
void foobar_SetOf__Int_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< int32_t >>(handle);
}
void foobar_SetOf__Int_insert(_baseRef handle, int32_t value) {
    (*get_pointer<::std::unordered_set< int32_t >>(handle)).insert(::std::move(value));
}
_baseRef foobar_SetOf__Int_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< int32_t >::iterator( get_pointer<::std::unordered_set< int32_t >>(handle)->begin() ) );
}
void foobar_SetOf__Int_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< int32_t >::iterator*>( iterator_handle );
}
bool foobar_SetOf__Int_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< int32_t >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< int32_t >>(handle)->end();
}
void foobar_SetOf__Int_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< int32_t >::iterator*>( iterator_handle );
}
int32_t foobar_SetOf__Int_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< int32_t >::iterator*>( iterator_handle );
    return value;
}
_baseRef foobar_SetOf__Int_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_set< int32_t >>( ::std::unordered_set< int32_t >( ) ) );
}
void foobar_SetOf__Int_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_set< int32_t >>*>( handle );
}
_baseRef foobar_SetOf__Int_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_set< int32_t >>*>( handle ) );
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
_baseRef foobar_SetOf__UByte_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< uint8_t >() );
}
void foobar_SetOf__UByte_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< uint8_t >>(handle);
}
void foobar_SetOf__UByte_insert(_baseRef handle, uint8_t value) {
    (*get_pointer<::std::unordered_set< uint8_t >>(handle)).insert(::std::move(value));
}
_baseRef foobar_SetOf__UByte_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< uint8_t >::iterator( get_pointer<::std::unordered_set< uint8_t >>(handle)->begin() ) );
}
void foobar_SetOf__UByte_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< uint8_t >::iterator*>( iterator_handle );
}
bool foobar_SetOf__UByte_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< uint8_t >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< uint8_t >>(handle)->end();
}
void foobar_SetOf__UByte_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< uint8_t >::iterator*>( iterator_handle );
}
uint8_t foobar_SetOf__UByte_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< uint8_t >::iterator*>( iterator_handle );
    return value;
}
_baseRef foobar_SetOf__UByte_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_set< uint8_t >>( ::std::unordered_set< uint8_t >( ) ) );
}
void foobar_SetOf__UByte_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_set< uint8_t >>*>( handle );
}
_baseRef foobar_SetOf__UByte_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_set< uint8_t >>*>( handle ) );
}
_baseRef foobar_SetOf_foobar_ArrayOf__Int_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >() );
}
void foobar_SetOf_foobar_ArrayOf__Int_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >>(handle);
}
void foobar_SetOf_foobar_ArrayOf__Int_insert(_baseRef handle, _baseRef value) {
    (*get_pointer<::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >>(handle)).insert(::std::move(Conversion<::std::vector< int32_t >>::toCpp(value)));
}
_baseRef foobar_SetOf_foobar_ArrayOf__Int_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >::iterator( get_pointer<::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >>(handle)->begin() ) );
}
void foobar_SetOf_foobar_ArrayOf__Int_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >::iterator*>( iterator_handle );
}
bool foobar_SetOf_foobar_ArrayOf__Int_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >>(handle)->end();
}
void foobar_SetOf_foobar_ArrayOf__Int_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >::iterator*>( iterator_handle );
}
_baseRef foobar_SetOf_foobar_ArrayOf__Int_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >::iterator*>( iterator_handle );
    return Conversion<::std::vector< int32_t >>::referenceBaseRef(value);
}
_baseRef foobar_SetOf_foobar_ArrayOf__Int_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >>( ::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >( ) ) );
}
void foobar_SetOf_foobar_ArrayOf__Int_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >>*>( handle );
}
_baseRef foobar_SetOf_foobar_ArrayOf__Int_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > >>*>( handle ) );
}
_baseRef foobar_SetOf_foobar_MapOf__Int_To__Boolean_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >() );
}
void foobar_SetOf_foobar_MapOf__Int_To__Boolean_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>(handle);
}
void foobar_SetOf_foobar_MapOf__Int_To__Boolean_insert(_baseRef handle, _baseRef value) {
    (*get_pointer<::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>(handle)).insert(::std::move(Conversion<::std::unordered_map< int32_t, bool >>::toCpp(value)));
}
_baseRef foobar_SetOf_foobar_MapOf__Int_To__Boolean_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >::iterator( get_pointer<::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>(handle)->begin() ) );
}
void foobar_SetOf_foobar_MapOf__Int_To__Boolean_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >::iterator*>( iterator_handle );
}
bool foobar_SetOf_foobar_MapOf__Int_To__Boolean_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>(handle)->end();
}
void foobar_SetOf_foobar_MapOf__Int_To__Boolean_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >::iterator*>( iterator_handle );
}
_baseRef foobar_SetOf_foobar_MapOf__Int_To__Boolean_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >::iterator*>( iterator_handle );
    return Conversion<::std::unordered_map< int32_t, bool >>::referenceBaseRef(value);
}
_baseRef foobar_SetOf_foobar_MapOf__Int_To__Boolean_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>( ::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >( ) ) );
}
void foobar_SetOf_foobar_MapOf__Int_To__Boolean_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>*>( handle );
}
_baseRef foobar_SetOf_foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > >>*>( handle ) );
}
_baseRef foobar_SetOf_foobar_SetOf__Int_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >() );
}
void foobar_SetOf_foobar_SetOf__Int_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>(handle);
}
void foobar_SetOf_foobar_SetOf__Int_insert(_baseRef handle, _baseRef value) {
    (*get_pointer<::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>(handle)).insert(::std::move(Conversion<::std::unordered_set< int32_t >>::toCpp(value)));
}
_baseRef foobar_SetOf_foobar_SetOf__Int_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >::iterator( get_pointer<::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>(handle)->begin() ) );
}
void foobar_SetOf_foobar_SetOf__Int_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >::iterator*>( iterator_handle );
}
bool foobar_SetOf_foobar_SetOf__Int_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>(handle)->end();
}
void foobar_SetOf_foobar_SetOf__Int_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >::iterator*>( iterator_handle );
}
_baseRef foobar_SetOf_foobar_SetOf__Int_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >::iterator*>( iterator_handle );
    return Conversion<::std::unordered_set< int32_t >>::referenceBaseRef(value);
}
_baseRef foobar_SetOf_foobar_SetOf__Int_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>( ::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >( ) ) );
}
void foobar_SetOf_foobar_SetOf__Int_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>*>( handle );
}
_baseRef foobar_SetOf_foobar_SetOf__Int_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >>*>( handle ) );
}
_baseRef foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >() );
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >>(handle);
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert(_baseRef handle, uint32_t value) {
    (*get_pointer<::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >>(handle)).insert(::std::move(static_cast<::alien::FooEnum>(value)));
}
_baseRef foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >::iterator( get_pointer<::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >>(handle)->begin() ) );
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >::iterator*>( iterator_handle );
}
bool foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >>(handle)->end();
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >::iterator*>( iterator_handle );
}
uint32_t foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >::iterator*>( iterator_handle );
    return static_cast<uint32_t>(value);
}
_baseRef foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >>( ::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >( ) ) );
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >>*>( handle );
}
_baseRef foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > >>*>( handle ) );
}
_baseRef foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >() );
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(_baseRef handle) {
    delete get_pointer<::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>(handle);
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert(_baseRef handle, uint32_t value) {
    (*get_pointer<::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>(handle)).insert(::std::move(static_cast<::smoke::GenericTypesWithCompoundTypes::SomeEnum>(value)));
}
_baseRef foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >::iterator( get_pointer<::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>(handle)->begin() ) );
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >::iterator*>( iterator_handle );
}
bool foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >::iterator*>( iterator_handle ) != get_pointer<::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>(handle)->end();
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >::iterator*>( iterator_handle );
}
uint32_t foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >::iterator*>( iterator_handle );
    return static_cast<uint32_t>(value);
}
_baseRef foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( ::std::nothrow ) ::gluecodium::optional<::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>( ::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >( ) ) );
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>*>( handle );
}
_baseRef foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >>*>( handle ) );
}
