//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "alien/FooEnum.h"
#include "alien/FooStruct.h"
#include "cbridge/include/ArrayCollection.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_Arrays.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "genium/Optional.h"
#include "smoke/Arrays.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <vector>
_baseRef ArrayOf_ArrayOf_String_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<std::string>>( ) );
}
_baseRef ArrayOf_ArrayOf_String_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<std::string>>( *reinterpret_cast<std::vector<std::vector<std::string>>*>( handle ) ) );
}
void ArrayOf_ArrayOf_String_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<std::vector<std::string>>*>( handle );
}
uint64_t ArrayOf_ArrayOf_String_count(_baseRef handle) {
    return Conversion<std::vector<std::vector<std::string>>>::toCpp( handle ).size( );
}
_baseRef ArrayOf_ArrayOf_String_get( _baseRef handle, uint64_t index ) { return Conversion<std::vector<std::string>>::referenceBaseRef(Conversion<std::vector<std::vector<std::string>>>::toCpp( handle )[index]);
}
void ArrayOf_ArrayOf_String_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<std::vector<std::string>>>::toCpp(handle).push_back(Conversion<std::vector<std::string>>::toCpp(item));
}
_baseRef ArrayOf_ArrayOf_String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::vector<std::vector<std::string>>>( std::vector<std::vector<std::string>>( ) ) );
}
void ArrayOf_ArrayOf_String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::vector<std::vector<std::string>>>*>( handle );
}
_baseRef ArrayOf_ArrayOf_String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::vector<std::vector<std::string>>>*>( handle ) );
}
_baseRef ArrayOf_ExternalEnum_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooEnum>( ) );
}
_baseRef ArrayOf_ExternalEnum_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooEnum>( *reinterpret_cast<std::vector<::alien::FooEnum>*>( handle ) ) );
}
void ArrayOf_ExternalEnum_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::alien::FooEnum>*>( handle );
}
uint64_t ArrayOf_ExternalEnum_count(_baseRef handle) {
    return Conversion<std::vector<::alien::FooEnum>>::toCpp( handle ).size( );
}
smoke_Arrays_ExternalEnum ArrayOf_ExternalEnum_get( _baseRef handle, uint64_t index ) {
    return static_cast<smoke_Arrays_ExternalEnum>(Conversion<std::vector<::alien::FooEnum>>::toCpp(handle)[ index ]);
}
void ArrayOf_ExternalEnum_append( _baseRef handle, smoke_Arrays_ExternalEnum item )
{
    Conversion<std::vector<::alien::FooEnum>>::toCpp(handle).push_back( static_cast<::alien::FooEnum>( item ) );
}
_baseRef ArrayOf_ExternalEnum_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::vector<::alien::FooEnum>>( std::vector<::alien::FooEnum>( ) ) );
}
void ArrayOf_ExternalEnum_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::vector<::alien::FooEnum>>*>( handle );
}
_baseRef ArrayOf_ExternalEnum_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::vector<::alien::FooEnum>>*>( handle ) );
}
_baseRef ArrayOf_String_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<std::string>( ) );
}
_baseRef ArrayOf_String_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<std::string>( *reinterpret_cast<std::vector<std::string>*>( handle ) ) );
}
void ArrayOf_String_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<std::string>*>( handle );
}
uint64_t ArrayOf_String_count(_baseRef handle) {
    return Conversion<std::vector<std::string>>::toCpp( handle ).size( );
}
_baseRef ArrayOf_String_get( _baseRef handle, uint64_t index ) { return Conversion<std::string>::referenceBaseRef(Conversion<std::vector<std::string>>::toCpp( handle )[index]);
}
void ArrayOf_String_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<std::string>>::toCpp(handle).push_back(Conversion<std::string>::toCpp(item));
}
_baseRef ArrayOf_String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::vector<std::string>>( std::vector<std::string>( ) ) );
}
void ArrayOf_String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::vector<std::string>>*>( handle );
}
_baseRef ArrayOf_String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::vector<std::string>>*>( handle ) );
}
_baseRef ArrayOf_SomeEnum_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::SomeEnum>( ) );
}
_baseRef ArrayOf_SomeEnum_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::SomeEnum>( *reinterpret_cast<std::vector<::smoke::Arrays::SomeEnum>*>( handle ) ) );
}
void ArrayOf_SomeEnum_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::smoke::Arrays::SomeEnum>*>( handle );
}
uint64_t ArrayOf_SomeEnum_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::SomeEnum>>::toCpp( handle ).size( );
}
smoke_Arrays_SomeEnum ArrayOf_SomeEnum_get( _baseRef handle, uint64_t index ) {
    return static_cast<smoke_Arrays_SomeEnum>(Conversion<std::vector<::smoke::Arrays::SomeEnum>>::toCpp(handle)[ index ]);
}
void ArrayOf_SomeEnum_append( _baseRef handle, smoke_Arrays_SomeEnum item )
{
    Conversion<std::vector<::smoke::Arrays::SomeEnum>>::toCpp(handle).push_back( static_cast<::smoke::Arrays::SomeEnum>( item ) );
}
_baseRef ArrayOf_SomeEnum_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::vector<::smoke::Arrays::SomeEnum>>( std::vector<::smoke::Arrays::SomeEnum>( ) ) );
}
void ArrayOf_SomeEnum_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::vector<::smoke::Arrays::SomeEnum>>*>( handle );
}
_baseRef ArrayOf_SomeEnum_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::vector<::smoke::Arrays::SomeEnum>>*>( handle ) );
}
_baseRef ArrayOf_BasicStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::BasicStruct>( ) );
}
_baseRef ArrayOf_BasicStruct_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::BasicStruct>( *reinterpret_cast<std::vector<::smoke::Arrays::BasicStruct>*>( handle ) ) );
}
void ArrayOf_BasicStruct_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::smoke::Arrays::BasicStruct>*>( handle );
}
uint64_t ArrayOf_BasicStruct_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::BasicStruct>>::toCpp( handle ).size( );
}
_baseRef ArrayOf_BasicStruct_get( _baseRef handle, uint64_t index ) { return Conversion<::smoke::Arrays::BasicStruct>::referenceBaseRef(Conversion<std::vector<::smoke::Arrays::BasicStruct>>::toCpp( handle )[index]);
}
void ArrayOf_BasicStruct_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<::smoke::Arrays::BasicStruct>>::toCpp(handle).push_back(Conversion<::smoke::Arrays::BasicStruct>::toCpp(item));
}
_baseRef ArrayOf_BasicStruct_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::vector<::smoke::Arrays::BasicStruct>>( std::vector<::smoke::Arrays::BasicStruct>( ) ) );
}
void ArrayOf_BasicStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::vector<::smoke::Arrays::BasicStruct>>*>( handle );
}
_baseRef ArrayOf_BasicStruct_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::vector<::smoke::Arrays::BasicStruct>>*>( handle ) );
}
_baseRef ArrayOf_Uint8_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<uint8_t>( ) );
}
_baseRef ArrayOf_Uint8_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<uint8_t>( *reinterpret_cast<std::vector<uint8_t>*>( handle ) ) );
}
void ArrayOf_Uint8_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<uint8_t>*>( handle );
}
uint64_t ArrayOf_Uint8_count(_baseRef handle) {
    return Conversion<std::vector<uint8_t>>::toCpp( handle ).size( );
}
uint8_t ArrayOf_Uint8_get( _baseRef handle, uint64_t index ) {
    return Conversion<std::vector<uint8_t>>::toCpp(handle)[ index ];
}
void ArrayOf_Uint8_append( _baseRef handle, uint8_t item )
{
    Conversion<std::vector<uint8_t>>::toCpp(handle).push_back( item );
}
_baseRef ArrayOf_Uint8_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::vector<uint8_t>>( std::vector<uint8_t>( ) ) );
}
void ArrayOf_Uint8_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::vector<uint8_t>>*>( handle );
}
_baseRef ArrayOf_Uint8_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::vector<uint8_t>>*>( handle ) );
}
_baseRef ArrayOf_ArrayOf_Uint8_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<uint8_t>>( ) );
}
_baseRef ArrayOf_ArrayOf_Uint8_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<uint8_t>>( *reinterpret_cast<std::vector<std::vector<uint8_t>>*>( handle ) ) );
}
void ArrayOf_ArrayOf_Uint8_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<std::vector<uint8_t>>*>( handle );
}
uint64_t ArrayOf_ArrayOf_Uint8_count(_baseRef handle) {
    return Conversion<std::vector<std::vector<uint8_t>>>::toCpp( handle ).size( );
}
_baseRef ArrayOf_ArrayOf_Uint8_get( _baseRef handle, uint64_t index ) { return Conversion<std::vector<uint8_t>>::referenceBaseRef(Conversion<std::vector<std::vector<uint8_t>>>::toCpp( handle )[index]);
}
void ArrayOf_ArrayOf_Uint8_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<std::vector<uint8_t>>>::toCpp(handle).push_back(Conversion<std::vector<uint8_t>>::toCpp(item));
}
_baseRef ArrayOf_ArrayOf_Uint8_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::vector<std::vector<uint8_t>>>( std::vector<std::vector<uint8_t>>( ) ) );
}
void ArrayOf_ArrayOf_Uint8_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::vector<std::vector<uint8_t>>>*>( handle );
}
_baseRef ArrayOf_ArrayOf_Uint8_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::vector<std::vector<uint8_t>>>*>( handle ) );
}
_baseRef ArrayOf_MapOf_Int32_To_String_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::ErrorCodeToMessageMap>( ) );
}
_baseRef ArrayOf_MapOf_Int32_To_String_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::ErrorCodeToMessageMap>( *reinterpret_cast<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>*>( handle ) ) );
}
void ArrayOf_MapOf_Int32_To_String_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>*>( handle );
}
uint64_t ArrayOf_MapOf_Int32_To_String_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>::toCpp( handle ).size( );
}
_baseRef ArrayOf_MapOf_Int32_To_String_get( _baseRef handle, uint64_t index ) { return Conversion<::smoke::Arrays::ErrorCodeToMessageMap>::referenceBaseRef(Conversion<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>::toCpp( handle )[index]);
}
void ArrayOf_MapOf_Int32_To_String_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>::toCpp(handle).push_back(Conversion<::smoke::Arrays::ErrorCodeToMessageMap>::toCpp(item));
}
_baseRef ArrayOf_MapOf_Int32_To_String_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>( std::vector<::smoke::Arrays::ErrorCodeToMessageMap>( ) ) );
}
void ArrayOf_MapOf_Int32_To_String_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>*>( handle );
}
_baseRef ArrayOf_MapOf_Int32_To_String_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>*>( handle ) );
}
_baseRef ArrayOf_ExternalStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooStruct>( ) );
}
_baseRef ArrayOf_ExternalStruct_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooStruct>( *reinterpret_cast<std::vector<::alien::FooStruct>*>( handle ) ) );
}
void ArrayOf_ExternalStruct_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::alien::FooStruct>*>( handle );
}
uint64_t ArrayOf_ExternalStruct_count(_baseRef handle) {
    return Conversion<std::vector<::alien::FooStruct>>::toCpp( handle ).size( );
}
_baseRef ArrayOf_ExternalStruct_get( _baseRef handle, uint64_t index ) { return Conversion<::alien::FooStruct>::referenceBaseRef(Conversion<std::vector<::alien::FooStruct>>::toCpp( handle )[index]);
}
void ArrayOf_ExternalStruct_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<::alien::FooStruct>>::toCpp(handle).push_back(Conversion<::alien::FooStruct>::toCpp(item));
}
_baseRef ArrayOf_ExternalStruct_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::vector<::alien::FooStruct>>( std::vector<::alien::FooStruct>( ) ) );
}
void ArrayOf_ExternalStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::vector<::alien::FooStruct>>*>( handle );
}
_baseRef ArrayOf_ExternalStruct_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::vector<::alien::FooStruct>>*>( handle ) );
}
_baseRef ArrayOf_FancyStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::FancyStruct>( ) );
}
_baseRef ArrayOf_FancyStruct_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::FancyStruct>( *reinterpret_cast<std::vector<::smoke::Arrays::FancyStruct>*>( handle ) ) );
}
void ArrayOf_FancyStruct_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::smoke::Arrays::FancyStruct>*>( handle );
}
uint64_t ArrayOf_FancyStruct_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toCpp( handle ).size( );
}
_baseRef ArrayOf_FancyStruct_get( _baseRef handle, uint64_t index ) { return Conversion<::smoke::Arrays::FancyStruct>::referenceBaseRef(Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toCpp( handle )[index]);
}
void ArrayOf_FancyStruct_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toCpp(handle).push_back(Conversion<::smoke::Arrays::FancyStruct>::toCpp(item));
}
_baseRef ArrayOf_FancyStruct_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::vector<::smoke::Arrays::FancyStruct>>( std::vector<::smoke::Arrays::FancyStruct>( ) ) );
}
void ArrayOf_FancyStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::vector<::smoke::Arrays::FancyStruct>>*>( handle );
}
_baseRef ArrayOf_FancyStruct_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::vector<::smoke::Arrays::FancyStruct>>*>( handle ) );
}
