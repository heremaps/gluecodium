//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "alien/FooEnum.h"
#include "alien/FooStruct.h"
#include "cbridge/include/ArrayCollection.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_Arrays.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/Arrays.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <vector>
_baseRef arrayCollection_StringArrayArray_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<std::string>>( ) );
}
_baseRef arrayCollection_StringArrayArray_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<std::string>>( *reinterpret_cast<std::vector<std::vector<std::string>>*>( handle ) ) );
}
void arrayCollection_StringArrayArray_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<std::vector<std::string>>*>( handle );
}
uint64_t arrayCollection_StringArrayArray_count(_baseRef handle) {
    return Conversion<std::vector<std::vector<std::string>>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_StringArrayArray_get( _baseRef handle, uint64_t index ) { return Conversion<std::vector<std::string>>::referenceBaseRef(Conversion<std::vector<std::vector<std::string>>>::toCpp( handle )[index]);
}
void arrayCollection_StringArrayArray_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<std::vector<std::string>>>::toCpp(handle).push_back(Conversion<std::vector<std::string>>::toCpp(item));
}
_baseRef arrayCollection_StringArrayArray_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::vector<std::vector<std::string>>>( new ( std::nothrow ) std::vector<std::vector<std::string>>( ) ) );
}
void arrayCollection_StringArrayArray_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<std::vector<std::string>>>*>( handle );
}
_baseRef arrayCollection_StringArrayArray_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::vector<std::vector<std::string>>>*>( handle )->get( ) );
}
_baseRef arrayCollection_BasicStructArray_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::BasicStruct>( ) );
}
_baseRef arrayCollection_BasicStructArray_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::BasicStruct>( *reinterpret_cast<std::vector<::smoke::Arrays::BasicStruct>*>( handle ) ) );
}
void arrayCollection_BasicStructArray_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::smoke::Arrays::BasicStruct>*>( handle );
}
uint64_t arrayCollection_BasicStructArray_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::BasicStruct>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_BasicStructArray_get( _baseRef handle, uint64_t index ) { return Conversion<::smoke::Arrays::BasicStruct>::referenceBaseRef(Conversion<std::vector<::smoke::Arrays::BasicStruct>>::toCpp( handle )[index]);
}
void arrayCollection_BasicStructArray_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<::smoke::Arrays::BasicStruct>>::toCpp(handle).push_back(Conversion<::smoke::Arrays::BasicStruct>::toCpp(item));
}
_baseRef arrayCollection_BasicStructArray_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::vector<::smoke::Arrays::BasicStruct>>( new ( std::nothrow ) std::vector<::smoke::Arrays::BasicStruct>( ) ) );
}
void arrayCollection_BasicStructArray_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<::smoke::Arrays::BasicStruct>>*>( handle );
}
_baseRef arrayCollection_BasicStructArray_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::vector<::smoke::Arrays::BasicStruct>>*>( handle )->get( ) );
}
_baseRef arrayCollection_ExternalEnumArray_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooEnum>( ) );
}
_baseRef arrayCollection_ExternalEnumArray_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooEnum>( *reinterpret_cast<std::vector<::alien::FooEnum>*>( handle ) ) );
}
void arrayCollection_ExternalEnumArray_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::alien::FooEnum>*>( handle );
}
uint64_t arrayCollection_ExternalEnumArray_count(_baseRef handle) {
    return Conversion<std::vector<::alien::FooEnum>>::toCpp( handle ).size( );
}
smoke_Arrays_ExternalEnum arrayCollection_ExternalEnumArray_get( _baseRef handle, uint64_t index ) {
    return static_cast<smoke_Arrays_ExternalEnum>(Conversion<std::vector<::alien::FooEnum>>::toCpp(handle)[ index ]);
}
void arrayCollection_ExternalEnumArray_append( _baseRef handle, smoke_Arrays_ExternalEnum item )
{
    Conversion<std::vector<::alien::FooEnum>>::toCpp(handle).push_back( static_cast<::alien::FooEnum>( item ) );
}
_baseRef arrayCollection_ExternalEnumArray_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::vector<::alien::FooEnum>>( new ( std::nothrow ) std::vector<::alien::FooEnum>( ) ) );
}
void arrayCollection_ExternalEnumArray_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<::alien::FooEnum>>*>( handle );
}
_baseRef arrayCollection_ExternalEnumArray_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::vector<::alien::FooEnum>>*>( handle )->get( ) );
}
_baseRef arrayCollection_UInt8Array_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<uint8_t>( ) );
}
_baseRef arrayCollection_UInt8Array_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<uint8_t>( *reinterpret_cast<std::vector<uint8_t>*>( handle ) ) );
}
void arrayCollection_UInt8Array_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<uint8_t>*>( handle );
}
uint64_t arrayCollection_UInt8Array_count(_baseRef handle) {
    return Conversion<std::vector<uint8_t>>::toCpp( handle ).size( );
}
uint8_t arrayCollection_UInt8Array_get( _baseRef handle, uint64_t index ) {
    return Conversion<std::vector<uint8_t>>::toCpp(handle)[ index ];
}
void arrayCollection_UInt8Array_append( _baseRef handle, uint8_t item )
{
    Conversion<std::vector<uint8_t>>::toCpp(handle).push_back( item );
}
_baseRef arrayCollection_UInt8Array_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::vector<uint8_t>>( new ( std::nothrow ) std::vector<uint8_t>( ) ) );
}
void arrayCollection_UInt8Array_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<uint8_t>>*>( handle );
}
_baseRef arrayCollection_UInt8Array_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::vector<uint8_t>>*>( handle )->get( ) );
}
_baseRef arrayCollection_Int32ToStringMapArray_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::ErrorCodeToMessageMap>( ) );
}
_baseRef arrayCollection_Int32ToStringMapArray_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::ErrorCodeToMessageMap>( *reinterpret_cast<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>*>( handle ) ) );
}
void arrayCollection_Int32ToStringMapArray_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>*>( handle );
}
uint64_t arrayCollection_Int32ToStringMapArray_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_Int32ToStringMapArray_get( _baseRef handle, uint64_t index ) { return Conversion<::smoke::Arrays::ErrorCodeToMessageMap>::referenceBaseRef(Conversion<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>::toCpp( handle )[index]);
}
void arrayCollection_Int32ToStringMapArray_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>::toCpp(handle).push_back(Conversion<::smoke::Arrays::ErrorCodeToMessageMap>::toCpp(item));
}
_baseRef arrayCollection_Int32ToStringMapArray_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>( new ( std::nothrow ) std::vector<::smoke::Arrays::ErrorCodeToMessageMap>( ) ) );
}
void arrayCollection_Int32ToStringMapArray_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>*>( handle );
}
_baseRef arrayCollection_Int32ToStringMapArray_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>*>( handle )->get( ) );
}
_baseRef arrayCollection_StringArray_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<std::string>( ) );
}
_baseRef arrayCollection_StringArray_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<std::string>( *reinterpret_cast<std::vector<std::string>*>( handle ) ) );
}
void arrayCollection_StringArray_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<std::string>*>( handle );
}
uint64_t arrayCollection_StringArray_count(_baseRef handle) {
    return Conversion<std::vector<std::string>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_StringArray_get( _baseRef handle, uint64_t index ) { return Conversion<std::string>::referenceBaseRef(Conversion<std::vector<std::string>>::toCpp( handle )[index]);
}
void arrayCollection_StringArray_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<std::string>>::toCpp(handle).push_back(Conversion<std::string>::toCpp(item));
}
_baseRef arrayCollection_StringArray_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::vector<std::string>>( new ( std::nothrow ) std::vector<std::string>( ) ) );
}
void arrayCollection_StringArray_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<std::string>>*>( handle );
}
_baseRef arrayCollection_StringArray_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::vector<std::string>>*>( handle )->get( ) );
}
_baseRef arrayCollection_ExternalStructArray_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooStruct>( ) );
}
_baseRef arrayCollection_ExternalStructArray_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooStruct>( *reinterpret_cast<std::vector<::alien::FooStruct>*>( handle ) ) );
}
void arrayCollection_ExternalStructArray_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::alien::FooStruct>*>( handle );
}
uint64_t arrayCollection_ExternalStructArray_count(_baseRef handle) {
    return Conversion<std::vector<::alien::FooStruct>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_ExternalStructArray_get( _baseRef handle, uint64_t index ) { return Conversion<::alien::FooStruct>::referenceBaseRef(Conversion<std::vector<::alien::FooStruct>>::toCpp( handle )[index]);
}
void arrayCollection_ExternalStructArray_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<::alien::FooStruct>>::toCpp(handle).push_back(Conversion<::alien::FooStruct>::toCpp(item));
}
_baseRef arrayCollection_ExternalStructArray_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::vector<::alien::FooStruct>>( new ( std::nothrow ) std::vector<::alien::FooStruct>( ) ) );
}
void arrayCollection_ExternalStructArray_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<::alien::FooStruct>>*>( handle );
}
_baseRef arrayCollection_ExternalStructArray_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::vector<::alien::FooStruct>>*>( handle )->get( ) );
}
_baseRef arrayCollection_SomeEnumArray_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::SomeEnum>( ) );
}
_baseRef arrayCollection_SomeEnumArray_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::SomeEnum>( *reinterpret_cast<std::vector<::smoke::Arrays::SomeEnum>*>( handle ) ) );
}
void arrayCollection_SomeEnumArray_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::smoke::Arrays::SomeEnum>*>( handle );
}
uint64_t arrayCollection_SomeEnumArray_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::SomeEnum>>::toCpp( handle ).size( );
}
smoke_Arrays_SomeEnum arrayCollection_SomeEnumArray_get( _baseRef handle, uint64_t index ) {
    return static_cast<smoke_Arrays_SomeEnum>(Conversion<std::vector<::smoke::Arrays::SomeEnum>>::toCpp(handle)[ index ]);
}
void arrayCollection_SomeEnumArray_append( _baseRef handle, smoke_Arrays_SomeEnum item )
{
    Conversion<std::vector<::smoke::Arrays::SomeEnum>>::toCpp(handle).push_back( static_cast<::smoke::Arrays::SomeEnum>( item ) );
}
_baseRef arrayCollection_SomeEnumArray_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::vector<::smoke::Arrays::SomeEnum>>( new ( std::nothrow ) std::vector<::smoke::Arrays::SomeEnum>( ) ) );
}
void arrayCollection_SomeEnumArray_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<::smoke::Arrays::SomeEnum>>*>( handle );
}
_baseRef arrayCollection_SomeEnumArray_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::vector<::smoke::Arrays::SomeEnum>>*>( handle )->get( ) );
}
_baseRef arrayCollection_FancyStructArray_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::FancyStruct>( ) );
}
_baseRef arrayCollection_FancyStructArray_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::FancyStruct>( *reinterpret_cast<std::vector<::smoke::Arrays::FancyStruct>*>( handle ) ) );
}
void arrayCollection_FancyStructArray_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<::smoke::Arrays::FancyStruct>*>( handle );
}
uint64_t arrayCollection_FancyStructArray_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_FancyStructArray_get( _baseRef handle, uint64_t index ) { return Conversion<::smoke::Arrays::FancyStruct>::referenceBaseRef(Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toCpp( handle )[index]);
}
void arrayCollection_FancyStructArray_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toCpp(handle).push_back(Conversion<::smoke::Arrays::FancyStruct>::toCpp(item));
}
_baseRef arrayCollection_FancyStructArray_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::vector<::smoke::Arrays::FancyStruct>>( new ( std::nothrow ) std::vector<::smoke::Arrays::FancyStruct>( ) ) );
}
void arrayCollection_FancyStructArray_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<::smoke::Arrays::FancyStruct>>*>( handle );
}
_baseRef arrayCollection_FancyStructArray_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::vector<::smoke::Arrays::FancyStruct>>*>( handle )->get( ) );
}
_baseRef arrayCollection_UInt8ArrayArray_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<uint8_t>>( ) );
}
_baseRef arrayCollection_UInt8ArrayArray_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<uint8_t>>( *reinterpret_cast<std::vector<std::vector<uint8_t>>*>( handle ) ) );
}
void arrayCollection_UInt8ArrayArray_release_handle(_baseRef handle) {
    delete reinterpret_cast<std::vector<std::vector<uint8_t>>*>( handle );
}
uint64_t arrayCollection_UInt8ArrayArray_count(_baseRef handle) {
    return Conversion<std::vector<std::vector<uint8_t>>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_UInt8ArrayArray_get( _baseRef handle, uint64_t index ) { return Conversion<std::vector<uint8_t>>::referenceBaseRef(Conversion<std::vector<std::vector<uint8_t>>>::toCpp( handle )[index]);
}
void arrayCollection_UInt8ArrayArray_append( _baseRef handle, _baseRef item )
{
Conversion<std::vector<std::vector<uint8_t>>>::toCpp(handle).push_back(Conversion<std::vector<uint8_t>>::toCpp(item));
}
_baseRef arrayCollection_UInt8ArrayArray_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::vector<std::vector<uint8_t>>>( new ( std::nothrow ) std::vector<std::vector<uint8_t>>( ) ) );
}
void arrayCollection_UInt8ArrayArray_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<std::vector<uint8_t>>>*>( handle );
}
_baseRef arrayCollection_UInt8ArrayArray_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::vector<std::vector<uint8_t>>>*>( handle )->get( ) );
}
