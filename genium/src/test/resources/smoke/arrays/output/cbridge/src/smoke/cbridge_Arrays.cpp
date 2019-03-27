//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "Optional.h"
#include "alien/FooEnum.h"
#include "alien/FooStruct.h"
#include "cbridge/include/smoke/cbridge_Arrays.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/Arrays.h"
#include <memory>
#include <new>
#include <string>
#include <vector>
void smoke_Arrays_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::Arrays>>(handle);
}
_baseRef smoke_Arrays_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::Arrays>>(handle)))
        : 0;
}
_baseRef
smoke_Arrays_BasicStruct_create_handle( double value )
{
    ::smoke::Arrays::BasicStruct* _struct = new ( std::nothrow ) ::smoke::Arrays::BasicStruct();
    _struct->value = value;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Arrays_BasicStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Arrays::BasicStruct>( handle );
}
_baseRef
smoke_Arrays_BasicStruct_create_optional_handle(double value)
{
    auto _struct = new ( std::nothrow ) genium::optional<::smoke::Arrays::BasicStruct>( ::smoke::Arrays::BasicStruct( ) );
    (*_struct)->value = value;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Arrays_BasicStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<genium::optional<::smoke::Arrays::BasicStruct>*>( handle ) );
}
void smoke_Arrays_BasicStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<genium::optional<::smoke::Arrays::BasicStruct>*>( handle );
}
double smoke_Arrays_BasicStruct_value_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Arrays::BasicStruct>(handle);
return struct_pointer->value;
}
_baseRef
smoke_Arrays_ExternalStruct_create_handle( _baseRef string )
{
    ::alien::FooStruct* _struct = new ( std::nothrow ) ::alien::FooStruct();
    _struct->string = Conversion<std::string>::toCpp( string );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Arrays_ExternalStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::alien::FooStruct>( handle );
}
_baseRef
smoke_Arrays_ExternalStruct_create_optional_handle(_baseRef string)
{
    auto _struct = new ( std::nothrow ) genium::optional<::alien::FooStruct>( ::alien::FooStruct( ) );
    (*_struct)->string = Conversion<std::string>::toCpp( string );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Arrays_ExternalStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<genium::optional<::alien::FooStruct>*>( handle ) );
}
void smoke_Arrays_ExternalStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<genium::optional<::alien::FooStruct>*>( handle );
}
_baseRef smoke_Arrays_ExternalStruct_string_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::alien::FooStruct>(handle);
return Conversion<std::string>::toBaseRef(struct_pointer->string);
}
_baseRef
smoke_Arrays_FancyStruct_create_handle( _baseRef messages, _baseRef numbers, _baseRef image )
{
    ::smoke::Arrays::FancyStruct* _struct = new ( std::nothrow ) ::smoke::Arrays::FancyStruct();
    _struct->messages = Conversion<std::vector<std::string>>::toCpp( messages );
    _struct->numbers = Conversion<std::vector<uint8_t>>::toCpp( numbers );
    _struct->image = Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toCpp( image );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Arrays_FancyStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Arrays::FancyStruct>( handle );
}
_baseRef
smoke_Arrays_FancyStruct_create_optional_handle(_baseRef messages, _baseRef numbers, _baseRef image)
{
    auto _struct = new ( std::nothrow ) genium::optional<::smoke::Arrays::FancyStruct>( ::smoke::Arrays::FancyStruct( ) );
    (*_struct)->messages = Conversion<std::vector<std::string>>::toCpp( messages );
    (*_struct)->numbers = Conversion<std::vector<uint8_t>>::toCpp( numbers );
    (*_struct)->image = Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toCpp( image );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Arrays_FancyStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<genium::optional<::smoke::Arrays::FancyStruct>*>( handle ) );
}
void smoke_Arrays_FancyStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<genium::optional<::smoke::Arrays::FancyStruct>*>( handle );
}
_baseRef smoke_Arrays_FancyStruct_messages_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Arrays::FancyStruct>(handle);
return Conversion<std::vector<std::string>>::toBaseRef(struct_pointer->messages);
}
_baseRef smoke_Arrays_FancyStruct_numbers_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Arrays::FancyStruct>(handle);
return Conversion<std::vector<uint8_t>>::toBaseRef(struct_pointer->numbers);
}
_baseRef smoke_Arrays_FancyStruct_image_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Arrays::FancyStruct>(handle);
return Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toBaseRef(struct_pointer->image);
}
_baseRef smoke_Arrays_methodWithArray(_baseRef input) {
    return Conversion<std::vector<std::string>>::toBaseRef(::smoke::Arrays::method_with_array(Conversion<std::vector<std::string>>::toCpp(input)))
;
}
_baseRef smoke_Arrays_methodWithArrayInline(_baseRef input) {
    return Conversion<std::vector<uint8_t>>::toBaseRef(::smoke::Arrays::method_with_array_inline(Conversion<std::vector<uint8_t>>::toCpp(input)))
;
}
_baseRef smoke_Arrays_methodWithStructArray(_baseRef input) {
    return Conversion<std::vector<::smoke::Arrays::BasicStruct>>::toBaseRef(::smoke::Arrays::method_with_struct_array(Conversion<std::vector<::smoke::Arrays::BasicStruct>>::toCpp(input)))
;
}
_baseRef smoke_Arrays_methodWithExternalStructArray(_baseRef input) {
    return Conversion<std::vector<::alien::FooStruct>>::toBaseRef(::smoke::Arrays::method_with_external_struct_array(Conversion<std::vector<::alien::FooStruct>>::toCpp(input)))
;
}
_baseRef smoke_Arrays_methodWithArrayOfArrays(_baseRef input) {
    return Conversion<std::vector<std::vector<uint8_t>>>::toBaseRef(::smoke::Arrays::method_with_array_of_arrays(Conversion<std::vector<std::vector<uint8_t>>>::toCpp(input)))
;
}
_baseRef smoke_Arrays_mergeArraysOfStructsWithArrays(_baseRef inlineFancyArray, _baseRef fancyArray) {
    return Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toBaseRef(::smoke::Arrays::merge_arrays_of_structs_with_arrays(Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toCpp(inlineFancyArray), Conversion<std::vector<::smoke::Arrays::FancyStruct>>::toCpp(fancyArray)))
;
}
_baseRef smoke_Arrays_methodWithArrayOfAliases(_baseRef input) {
    return Conversion<std::vector<std::string>>::toBaseRef(::smoke::Arrays::method_with_array_of_aliases(Conversion<std::vector<std::string>>::toCpp(input)))
;
}
_baseRef smoke_Arrays_methodWithArrayOfMaps(_baseRef input) {
    return Conversion<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>::toBaseRef(::smoke::Arrays::method_with_array_of_maps(Conversion<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>::toCpp(input)))
;
}
_baseRef smoke_Arrays_methodWithByteBuffer(_baseRef input) {
    return Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toBaseRef(::smoke::Arrays::method_with_byte_buffer(Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toCpp(input)))
;
}
_baseRef smoke_Arrays_methodWithEnumArray(_baseRef input) {
    return Conversion<std::vector<::smoke::Arrays::SomeEnum>>::toBaseRef(::smoke::Arrays::method_with_enum_array(Conversion<std::vector<::smoke::Arrays::SomeEnum>>::toCpp(input)))
;
}
_baseRef smoke_Arrays_methodWithExternalEnumArray(_baseRef input) {
    return Conversion<std::vector<::alien::FooEnum>>::toBaseRef(::smoke::Arrays::method_with_external_enum_array(Conversion<std::vector<::alien::FooEnum>>::toCpp(input)))
;
}
_baseRef smoke_Arrays_ErrorCodeToMessageMap_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<int32_t, std::string>() );
}
void smoke_Arrays_ErrorCodeToMessageMap_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<int32_t, std::string>>(handle);
}
_baseRef smoke_Arrays_ErrorCodeToMessageMap_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<int32_t, std::string>::iterator( get_pointer<std::unordered_map<int32_t, std::string>>(handle)->begin() ) );
}
void smoke_Arrays_ErrorCodeToMessageMap_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle );
}
void smoke_Arrays_ErrorCodeToMessageMap_put(_baseRef handle, int32_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<int32_t, std::string>>(handle)).emplace(std::move(key), std::move(Conversion<std::string>::toCpp(value)));
}
bool smoke_Arrays_ErrorCodeToMessageMap_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<int32_t, std::string>>(handle)->end();
}
void smoke_Arrays_ErrorCodeToMessageMap_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle );
}
int32_t smoke_Arrays_ErrorCodeToMessageMap_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef smoke_Arrays_ErrorCodeToMessageMap_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle ))->second;
    return Conversion<std::string>::toBaseRef(value);
}
_baseRef smoke_Arrays_ErrorCodeToMessageMap_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) genium::optional<std::unordered_map<int32_t, std::string>>( std::unordered_map<int32_t, std::string>( ) ) );
}
void smoke_Arrays_ErrorCodeToMessageMap_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<genium::optional<std::unordered_map<int32_t, std::string>>*>( handle );
}
_baseRef smoke_Arrays_ErrorCodeToMessageMap_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<genium::optional<std::unordered_map<int32_t, std::string>>*>( handle ) );
}
_baseRef smoke_Arrays_ErrorCodeToProfileIdMap_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<int32_t, std::string>() );
}
void smoke_Arrays_ErrorCodeToProfileIdMap_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<int32_t, std::string>>(handle);
}
_baseRef smoke_Arrays_ErrorCodeToProfileIdMap_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<int32_t, std::string>::iterator( get_pointer<std::unordered_map<int32_t, std::string>>(handle)->begin() ) );
}
void smoke_Arrays_ErrorCodeToProfileIdMap_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle );
}
void smoke_Arrays_ErrorCodeToProfileIdMap_put(_baseRef handle, int32_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<int32_t, std::string>>(handle)).emplace(std::move(key), std::move(Conversion<std::string>::toCpp(value)));
}
bool smoke_Arrays_ErrorCodeToProfileIdMap_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<int32_t, std::string>>(handle)->end();
}
void smoke_Arrays_ErrorCodeToProfileIdMap_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle );
}
int32_t smoke_Arrays_ErrorCodeToProfileIdMap_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef smoke_Arrays_ErrorCodeToProfileIdMap_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle ))->second;
    return Conversion<std::string>::toBaseRef(value);
}
_baseRef smoke_Arrays_ErrorCodeToProfileIdMap_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) genium::optional<std::unordered_map<int32_t, std::string>>( std::unordered_map<int32_t, std::string>( ) ) );
}
void smoke_Arrays_ErrorCodeToProfileIdMap_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<genium::optional<std::unordered_map<int32_t, std::string>>*>( handle );
}
_baseRef smoke_Arrays_ErrorCodeToProfileIdMap_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<genium::optional<std::unordered_map<int32_t, std::string>>*>( handle ) );
}