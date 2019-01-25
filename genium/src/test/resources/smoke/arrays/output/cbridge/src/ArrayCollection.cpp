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
_baseRef arrayCollection_SomeEnum_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::SomeEnum>( ) );
}
_baseRef arrayCollection_SomeEnum_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::SomeEnum>( *reinterpret_cast<std::vector<::smoke::Arrays::SomeEnum>*>( handle ) ) );
}
void arrayCollection_SomeEnum_release_handle(_baseRef handle) {
    delete reinterpret_cast< std::vector<::smoke::Arrays::SomeEnum>* >( handle );
}
uint64_t arrayCollection_SomeEnum_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::SomeEnum>>::toCpp( handle ).size( );
}
smoke_Arrays_SomeEnum arrayCollection_SomeEnum_get( _baseRef handle, uint64_t index ) {
    return static_cast<smoke_Arrays_SomeEnum>(Conversion<std::vector<::smoke::Arrays::SomeEnum>>::toCpp(handle)[ index ]);
}
void arrayCollection_SomeEnum_append( _baseRef handle, smoke_Arrays_SomeEnum item ) {
    Conversion<std::vector<::smoke::Arrays::SomeEnum>>::toCpp(handle).push_back( static_cast<::smoke::Arrays::SomeEnum>( item ) );
}
_baseRef arrayCollection_FancyStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::FancyStruct>( ) );
}
_baseRef arrayCollection_FancyStruct_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::FancyStruct>( *reinterpret_cast<std::vector<::smoke::Arrays::FancyStruct>*>( handle ) ) );
}
void arrayCollection_FancyStruct_release_handle(_baseRef handle) {
    delete reinterpret_cast< std::vector<::smoke::Arrays::FancyStruct>* >( handle );
}
uint64_t arrayCollection_FancyStruct_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_FancyStruct_get( _baseRef handle, uint64_t index ) { return Conversion<::smoke::Arrays::FancyStruct>::referenceBaseRef(Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toCpp( handle )[index]);
}
void arrayCollection_FancyStruct_append( _baseRef handle, _baseRef item ) { Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toCpp(handle).push_back(Conversion<::smoke::Arrays::FancyStruct>::toCpp(item));
}
_baseRef arrayCollection_ExternalStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooStruct>( ) );
}
_baseRef arrayCollection_ExternalStruct_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooStruct>( *reinterpret_cast<std::vector<::alien::FooStruct>*>( handle ) ) );
}
void arrayCollection_ExternalStruct_release_handle(_baseRef handle) {
    delete reinterpret_cast< std::vector<::alien::FooStruct>* >( handle );
}
uint64_t arrayCollection_ExternalStruct_count(_baseRef handle) {
    return Conversion<std::vector<::alien::FooStruct>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_ExternalStruct_get( _baseRef handle, uint64_t index ) { return Conversion<::alien::FooStruct>::referenceBaseRef(Conversion<std::vector<::alien::FooStruct>>::toCpp( handle )[index]);
}
void arrayCollection_ExternalStruct_append( _baseRef handle, _baseRef item ) { Conversion<std::vector<::alien::FooStruct>>::toCpp(handle).push_back(Conversion<::alien::FooStruct>::toCpp(item));
}
_baseRef arrayCollection_UInt8Array_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<uint8_t>>( ) );
}
_baseRef arrayCollection_UInt8Array_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<uint8_t>>( *reinterpret_cast<std::vector<std::vector<uint8_t>>*>( handle ) ) );
}
void arrayCollection_UInt8Array_release_handle(_baseRef handle) {
    delete reinterpret_cast< std::vector<std::vector<uint8_t>>* >( handle );
}
uint64_t arrayCollection_UInt8Array_count(_baseRef handle) {
    return Conversion<std::vector<std::vector<uint8_t>>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_UInt8Array_get( _baseRef handle, uint64_t index ) { return Conversion<std::vector<uint8_t>>::referenceBaseRef(Conversion<std::vector<std::vector<uint8_t>>>::toCpp( handle )[index]);
}
void arrayCollection_UInt8Array_append( _baseRef handle, _baseRef item ) { Conversion<std::vector<std::vector<uint8_t>>>::toCpp(handle).push_back(Conversion<std::vector<uint8_t>>::toCpp(item));
}
_baseRef arrayCollection_Int32StringMap_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::ErrorCodeToMessageMap>( ) );
}
_baseRef arrayCollection_Int32StringMap_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::ErrorCodeToMessageMap>( *reinterpret_cast<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>*>( handle ) ) );
}
void arrayCollection_Int32StringMap_release_handle(_baseRef handle) {
    delete reinterpret_cast< std::vector<::smoke::Arrays::ErrorCodeToMessageMap>* >( handle );
}
uint64_t arrayCollection_Int32StringMap_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_Int32StringMap_get( _baseRef handle, uint64_t index ) { return Conversion<::smoke::Arrays::ErrorCodeToMessageMap>::referenceBaseRef(Conversion<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>::toCpp( handle )[index]);
}
void arrayCollection_Int32StringMap_append( _baseRef handle, _baseRef item ) { Conversion<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>::toCpp(handle).push_back(Conversion<::smoke::Arrays::ErrorCodeToMessageMap>::toCpp(item));
}
_baseRef arrayCollection_BasicStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::BasicStruct>( ) );
}
_baseRef arrayCollection_BasicStruct_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::BasicStruct>( *reinterpret_cast<std::vector<::smoke::Arrays::BasicStruct>*>( handle ) ) );
}
void arrayCollection_BasicStruct_release_handle(_baseRef handle) {
    delete reinterpret_cast< std::vector<::smoke::Arrays::BasicStruct>* >( handle );
}
uint64_t arrayCollection_BasicStruct_count(_baseRef handle) {
    return Conversion<std::vector<::smoke::Arrays::BasicStruct>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_BasicStruct_get( _baseRef handle, uint64_t index ) { return Conversion<::smoke::Arrays::BasicStruct>::referenceBaseRef(Conversion<std::vector<::smoke::Arrays::BasicStruct>>::toCpp( handle )[index]);
}
void arrayCollection_BasicStruct_append( _baseRef handle, _baseRef item ) { Conversion<std::vector<::smoke::Arrays::BasicStruct>>::toCpp(handle).push_back(Conversion<::smoke::Arrays::BasicStruct>::toCpp(item));
}
_baseRef arrayCollection_String_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<std::string>( ) );
}
_baseRef arrayCollection_String_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<std::string>( *reinterpret_cast<std::vector<std::string>*>( handle ) ) );
}
void arrayCollection_String_release_handle(_baseRef handle) {
    delete reinterpret_cast< std::vector<std::string>* >( handle );
}
uint64_t arrayCollection_String_count(_baseRef handle) {
    return Conversion<std::vector<std::string>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_String_get( _baseRef handle, uint64_t index ) { return Conversion<std::string>::referenceBaseRef(Conversion<std::vector<std::string>>::toCpp( handle )[index]);
}
void arrayCollection_String_append( _baseRef handle, _baseRef item ) { Conversion<std::vector<std::string>>::toCpp(handle).push_back(Conversion<std::string>::toCpp(item));
}
_baseRef arrayCollection_StringArray_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<std::string>>( ) );
}
_baseRef arrayCollection_StringArray_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<std::string>>( *reinterpret_cast<std::vector<std::vector<std::string>>*>( handle ) ) );
}
void arrayCollection_StringArray_release_handle(_baseRef handle) {
    delete reinterpret_cast< std::vector<std::vector<std::string>>* >( handle );
}
uint64_t arrayCollection_StringArray_count(_baseRef handle) {
    return Conversion<std::vector<std::vector<std::string>>>::toCpp( handle ).size( );
}
_baseRef arrayCollection_StringArray_get( _baseRef handle, uint64_t index ) { return Conversion<std::vector<std::string>>::referenceBaseRef(Conversion<std::vector<std::vector<std::string>>>::toCpp( handle )[index]);
}
void arrayCollection_StringArray_append( _baseRef handle, _baseRef item ) { Conversion<std::vector<std::vector<std::string>>>::toCpp(handle).push_back(Conversion<std::vector<std::string>>::toCpp(item));
}
_baseRef arrayCollection_UInt8_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<uint8_t>( ) );
}
_baseRef arrayCollection_UInt8_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<uint8_t>( *reinterpret_cast<std::vector<uint8_t>*>( handle ) ) );
}
void arrayCollection_UInt8_release_handle(_baseRef handle) {
    delete reinterpret_cast< std::vector<uint8_t>* >( handle );
}
uint64_t arrayCollection_UInt8_count(_baseRef handle) {
    return Conversion<std::vector<uint8_t>>::toCpp( handle ).size( );
}
uint8_t arrayCollection_UInt8_get( _baseRef handle, uint64_t index ) {
    return Conversion<std::vector<uint8_t>>::toCpp(handle)[ index ];
}
void arrayCollection_UInt8_append( _baseRef handle, uint8_t item ) {
    Conversion<std::vector<uint8_t>>::toCpp(handle).push_back( item );
}
_baseRef arrayCollection_ExternalEnum_create_handle() {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooEnum>( ) );
}
_baseRef arrayCollection_ExternalEnum_copy_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooEnum>( *reinterpret_cast<std::vector<::alien::FooEnum>*>( handle ) ) );
}
void arrayCollection_ExternalEnum_release_handle(_baseRef handle) {
    delete reinterpret_cast< std::vector<::alien::FooEnum>* >( handle );
}
uint64_t arrayCollection_ExternalEnum_count(_baseRef handle) {
    return Conversion<std::vector<::alien::FooEnum>>::toCpp( handle ).size( );
}
smoke_Arrays_ExternalEnum arrayCollection_ExternalEnum_get( _baseRef handle, uint64_t index ) {
    return static_cast<smoke_Arrays_ExternalEnum>(Conversion<std::vector<::alien::FooEnum>>::toCpp(handle)[ index ]);
}
void arrayCollection_ExternalEnum_append( _baseRef handle, smoke_Arrays_ExternalEnum item ) {
    Conversion<std::vector<::alien::FooEnum>>::toCpp(handle).push_back( static_cast<::alien::FooEnum>( item ) );
}