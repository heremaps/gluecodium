//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_Maps.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/Maps.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
void smoke_Maps_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::Maps>>(handle);
}
_baseRef smoke_Maps_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::Maps>>(handle)))
        : 0;
}
_baseRef
smoke_Maps_SomeStruct_create_handle( _baseRef value )
{
    ::smoke::Maps::SomeStruct* _struct = new ( std::nothrow ) ::smoke::Maps::SomeStruct();
    _struct->value = Conversion<std::string>::toCpp( value );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Maps_SomeStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Maps::SomeStruct>( handle );
}
_baseRef
smoke_Maps_SomeStruct_make_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<::smoke::Maps::SomeStruct>( reinterpret_cast<::smoke::Maps::SomeStruct*>( handle ) ) );
}
_baseRef
smoke_Maps_SomeStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<::smoke::Maps::SomeStruct>*>( handle )->get( ) );
}
void smoke_Maps_SomeStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::Maps::SomeStruct>*>( handle );
}
_baseRef smoke_Maps_SomeStruct_value_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Maps::SomeStruct>(handle);
return Conversion<std::string>::toBaseRef(struct_pointer->value);
}
_baseRef
smoke_Maps_StructWithMap_create_handle( _baseRef errorMapping )
{
    ::smoke::Maps::StructWithMap* _struct = new ( std::nothrow ) ::smoke::Maps::StructWithMap();
    _struct->error_mapping = Conversion<::smoke::Maps::ErrorCodeToMessageMap>::toCpp( errorMapping );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Maps_StructWithMap_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Maps::StructWithMap>( handle );
}
_baseRef
smoke_Maps_StructWithMap_make_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<::smoke::Maps::StructWithMap>( reinterpret_cast<::smoke::Maps::StructWithMap*>( handle ) ) );
}
_baseRef
smoke_Maps_StructWithMap_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<::smoke::Maps::StructWithMap>*>( handle )->get( ) );
}
void smoke_Maps_StructWithMap_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::Maps::StructWithMap>*>( handle );
}
_baseRef smoke_Maps_StructWithMap_errorMapping_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Maps::StructWithMap>(handle);
return Conversion<::smoke::Maps::ErrorCodeToMessageMap>::toBaseRef(struct_pointer->error_mapping);
}
_baseRef smoke_Maps_methodWithMap(_baseRef input) {
    return Conversion<::smoke::Maps::ErrorCodeToMessageMap>::toBaseRef(::smoke::Maps::method_with_map(Conversion<::smoke::Maps::ErrorCodeToMessageMap>::toCpp(input)))
;
}
_baseRef smoke_Maps_methodWithMapToStruct(_baseRef input) {
    return Conversion<::smoke::Maps::NumberToStruct>::toBaseRef(::smoke::Maps::method_with_map_to_struct(Conversion<::smoke::Maps::NumberToStruct>::toCpp(input)))
;
}
_baseRef smoke_Maps_methodWithNestedMap(_baseRef input) {
    return Conversion<::smoke::Maps::NestedMap>::toBaseRef(::smoke::Maps::method_with_nested_map(Conversion<::smoke::Maps::NestedMap>::toCpp(input)))
;
}
_baseRef smoke_Maps_methodWithStructWithMap(_baseRef input) {
    return Conversion<::smoke::Maps::StructWithMap>::toBaseRef(::smoke::Maps::method_with_struct_with_map(Conversion<::smoke::Maps::StructWithMap>::toCpp(input)))
;
}
_baseRef smoke_Maps_methodWithMapOfArrays(_baseRef input) {
    return Conversion<::smoke::Maps::StringToArray>::toBaseRef(::smoke::Maps::method_with_map_of_arrays(Conversion<::smoke::Maps::StringToArray>::toCpp(input)))
;
}
_baseRef smoke_Maps_methodWithMapOfInstances(_baseRef input) {
    return Conversion<::smoke::Maps::NumberToInstance>::toBaseRef(::smoke::Maps::method_with_map_of_instances(Conversion<::smoke::Maps::NumberToInstance>::toCpp(input)))
;
}
_baseRef smoke_Maps_ErrorCodeToMessageMap_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<int32_t, std::string>() );
}
void smoke_Maps_ErrorCodeToMessageMap_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<int32_t, std::string>>(handle);
}
_baseRef smoke_Maps_ErrorCodeToMessageMap_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<int32_t, std::string>::iterator( get_pointer<std::unordered_map<int32_t, std::string>>(handle)->begin() ) );
}
void smoke_Maps_ErrorCodeToMessageMap_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle );
}
void smoke_Maps_ErrorCodeToMessageMap_put(_baseRef handle, int32_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<int32_t, std::string>>(handle)).emplace(std::move(key), std::move(Conversion<std::string>::toCpp(value)));
}
bool smoke_Maps_ErrorCodeToMessageMap_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<int32_t, std::string>>(handle)->end();
}
void smoke_Maps_ErrorCodeToMessageMap_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle );
}
int32_t smoke_Maps_ErrorCodeToMessageMap_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef smoke_Maps_ErrorCodeToMessageMap_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle ))->second;
    return Conversion<std::string>::toBaseRef(value);
}
_baseRef smoke_Maps_ErrorCodeToMessageMap_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::unordered_map<int32_t, std::string>>( new ( std::nothrow ) std::unordered_map<int32_t, std::string>( ) ) );
}
void smoke_Maps_ErrorCodeToMessageMap_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::unordered_map<int32_t, std::string>>*>( handle );
}
_baseRef smoke_Maps_ErrorCodeToMessageMap_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::unordered_map<int32_t, std::string>>*>( handle )->get( ) );
}
_baseRef smoke_Maps_NumberToStruct_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>() );
}
void smoke_Maps_NumberToStruct_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>>(handle);
}
_baseRef smoke_Maps_NumberToStruct_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>::iterator( get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>>(handle)->begin() ) );
}
void smoke_Maps_NumberToStruct_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>::iterator*>( iterator_handle );
}
void smoke_Maps_NumberToStruct_put(_baseRef handle, uint8_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>>(handle)).emplace(std::move(key), std::move(Conversion<::smoke::Maps::SomeStruct>::toCpp(value)));
}
bool smoke_Maps_NumberToStruct_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>>(handle)->end();
}
void smoke_Maps_NumberToStruct_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>::iterator*>( iterator_handle );
}
uint8_t smoke_Maps_NumberToStruct_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef smoke_Maps_NumberToStruct_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>::iterator*>( iterator_handle ))->second;
    return Conversion<::smoke::Maps::SomeStruct>::toBaseRef(value);
}
_baseRef smoke_Maps_NumberToStruct_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>>( new ( std::nothrow ) std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>( ) ) );
}
void smoke_Maps_NumberToStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>>*>( handle );
}
_baseRef smoke_Maps_NumberToStruct_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>>*>( handle )->get( ) );
}
_baseRef smoke_Maps_NestedMap_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>() );
}
void smoke_Maps_NestedMap_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>>(handle);
}
_baseRef smoke_Maps_NestedMap_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>::iterator( get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>>(handle)->begin() ) );
}
void smoke_Maps_NestedMap_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>::iterator*>( iterator_handle );
}
void smoke_Maps_NestedMap_put(_baseRef handle, uint8_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>>(handle)).emplace(std::move(key), std::move(Conversion<::smoke::Maps::NumberToStruct>::toCpp(value)));
}
bool smoke_Maps_NestedMap_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>>(handle)->end();
}
void smoke_Maps_NestedMap_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>::iterator*>( iterator_handle );
}
uint8_t smoke_Maps_NestedMap_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef smoke_Maps_NestedMap_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>::iterator*>( iterator_handle ))->second;
    return Conversion<::smoke::Maps::NumberToStruct>::toBaseRef(value);
}
_baseRef smoke_Maps_NestedMap_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>>( new ( std::nothrow ) std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>( ) ) );
}
void smoke_Maps_NestedMap_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>>*>( handle );
}
_baseRef smoke_Maps_NestedMap_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>>*>( handle )->get( ) );
}
_baseRef smoke_Maps_NumberToTypeDef_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<uint8_t, std::string>() );
}
void smoke_Maps_NumberToTypeDef_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<uint8_t, std::string>>(handle);
}
_baseRef smoke_Maps_NumberToTypeDef_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<uint8_t, std::string>::iterator( get_pointer<std::unordered_map<uint8_t, std::string>>(handle)->begin() ) );
}
void smoke_Maps_NumberToTypeDef_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<uint8_t, std::string>::iterator*>( iterator_handle );
}
void smoke_Maps_NumberToTypeDef_put(_baseRef handle, uint8_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<uint8_t, std::string>>(handle)).emplace(std::move(key), std::move(Conversion<std::string>::toCpp(value)));
}
bool smoke_Maps_NumberToTypeDef_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<uint8_t, std::string>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<uint8_t, std::string>>(handle)->end();
}
void smoke_Maps_NumberToTypeDef_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<uint8_t, std::string>::iterator*>( iterator_handle );
}
uint8_t smoke_Maps_NumberToTypeDef_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<uint8_t, std::string>::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef smoke_Maps_NumberToTypeDef_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<uint8_t, std::string>::iterator*>( iterator_handle ))->second;
    return Conversion<std::string>::toBaseRef(value);
}
_baseRef smoke_Maps_NumberToTypeDef_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::unordered_map<uint8_t, std::string>>( new ( std::nothrow ) std::unordered_map<uint8_t, std::string>( ) ) );
}
void smoke_Maps_NumberToTypeDef_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::unordered_map<uint8_t, std::string>>*>( handle );
}
_baseRef smoke_Maps_NumberToTypeDef_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::unordered_map<uint8_t, std::string>>*>( handle )->get( ) );
}
_baseRef smoke_Maps_TypeDefToNumber_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, uint8_t>() );
}
void smoke_Maps_TypeDefToNumber_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<std::string, uint8_t>>(handle);
}
_baseRef smoke_Maps_TypeDefToNumber_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, uint8_t>::iterator( get_pointer<std::unordered_map<std::string, uint8_t>>(handle)->begin() ) );
}
void smoke_Maps_TypeDefToNumber_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, uint8_t>::iterator*>( iterator_handle );
}
void smoke_Maps_TypeDefToNumber_put(_baseRef handle, _baseRef key, uint8_t value) {
    (*get_pointer<std::unordered_map<std::string, uint8_t>>(handle)).emplace(std::move(Conversion<std::string>::toCpp(key)), std::move(value));
}
bool smoke_Maps_TypeDefToNumber_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, uint8_t>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<std::string, uint8_t>>(handle)->end();
}
void smoke_Maps_TypeDefToNumber_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, uint8_t>::iterator*>( iterator_handle );
}
_baseRef smoke_Maps_TypeDefToNumber_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<std::string, uint8_t>::iterator*>( iterator_handle ))->first;
    return Conversion<std::string>::toBaseRef(key);
}
uint8_t smoke_Maps_TypeDefToNumber_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<std::string, uint8_t>::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef smoke_Maps_TypeDefToNumber_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::unordered_map<std::string, uint8_t>>( new ( std::nothrow ) std::unordered_map<std::string, uint8_t>( ) ) );
}
void smoke_Maps_TypeDefToNumber_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::unordered_map<std::string, uint8_t>>*>( handle );
}
_baseRef smoke_Maps_TypeDefToNumber_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::unordered_map<std::string, uint8_t>>*>( handle )->get( ) );
}
_baseRef smoke_Maps_StringToArray_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, std::vector<int32_t>>() );
}
void smoke_Maps_StringToArray_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle);
}
_baseRef smoke_Maps_StringToArray_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, std::vector<int32_t>>::iterator( get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle)->begin() ) );
}
void smoke_Maps_StringToArray_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle );
}
void smoke_Maps_StringToArray_put(_baseRef handle, _baseRef key, _baseRef value) {
    (*get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle)).emplace(std::move(Conversion<std::string>::toCpp(key)), std::move(Conversion<std::vector<int32_t>>::toCpp(value)));
}
bool smoke_Maps_StringToArray_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle)->end();
}
void smoke_Maps_StringToArray_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle );
}
_baseRef smoke_Maps_StringToArray_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle ))->first;
    return Conversion<std::string>::toBaseRef(key);
}
_baseRef smoke_Maps_StringToArray_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle ))->second;
    return Conversion<std::vector<int32_t>>::toBaseRef(value);
}
_baseRef smoke_Maps_StringToArray_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::unordered_map<std::string, std::vector<int32_t>>>( new ( std::nothrow ) std::unordered_map<std::string, std::vector<int32_t>>( ) ) );
}
void smoke_Maps_StringToArray_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::unordered_map<std::string, std::vector<int32_t>>>*>( handle );
}
_baseRef smoke_Maps_StringToArray_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::unordered_map<std::string, std::vector<int32_t>>>*>( handle )->get( ) );
}
_baseRef smoke_Maps_StringToArrayOfTypeDefs_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, std::vector<int32_t>>() );
}
void smoke_Maps_StringToArrayOfTypeDefs_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle);
}
_baseRef smoke_Maps_StringToArrayOfTypeDefs_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, std::vector<int32_t>>::iterator( get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle)->begin() ) );
}
void smoke_Maps_StringToArrayOfTypeDefs_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle );
}
void smoke_Maps_StringToArrayOfTypeDefs_put(_baseRef handle, _baseRef key, _baseRef value) {
    (*get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle)).emplace(std::move(Conversion<std::string>::toCpp(key)), std::move(Conversion<std::vector<int32_t>>::toCpp(value)));
}
bool smoke_Maps_StringToArrayOfTypeDefs_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle)->end();
}
void smoke_Maps_StringToArrayOfTypeDefs_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle );
}
_baseRef smoke_Maps_StringToArrayOfTypeDefs_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle ))->first;
    return Conversion<std::string>::toBaseRef(key);
}
_baseRef smoke_Maps_StringToArrayOfTypeDefs_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle ))->second;
    return Conversion<std::vector<int32_t>>::toBaseRef(value);
}
_baseRef smoke_Maps_StringToArrayOfTypeDefs_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::unordered_map<std::string, std::vector<int32_t>>>( new ( std::nothrow ) std::unordered_map<std::string, std::vector<int32_t>>( ) ) );
}
void smoke_Maps_StringToArrayOfTypeDefs_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::unordered_map<std::string, std::vector<int32_t>>>*>( handle );
}
_baseRef smoke_Maps_StringToArrayOfTypeDefs_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::unordered_map<std::string, std::vector<int32_t>>>*>( handle )->get( ) );
}
_baseRef smoke_Maps_NumberToInstance_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>() );
}
void smoke_Maps_NumberToInstance_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>>(handle);
}
_baseRef smoke_Maps_NumberToInstance_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>::iterator( get_pointer<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>>(handle)->begin() ) );
}
void smoke_Maps_NumberToInstance_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>::iterator*>( iterator_handle );
}
void smoke_Maps_NumberToInstance_put(_baseRef handle, uint8_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>>(handle)).emplace(std::move(key), std::move(Conversion<std::shared_ptr<::smoke::MapsInstance>>::toCpp(value)));
}
bool smoke_Maps_NumberToInstance_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>>(handle)->end();
}
void smoke_Maps_NumberToInstance_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>::iterator*>( iterator_handle );
}
uint8_t smoke_Maps_NumberToInstance_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>::iterator*>( iterator_handle ))->first;
    return key;
}
_baseRef smoke_Maps_NumberToInstance_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>::iterator*>( iterator_handle ))->second;
    return Conversion<std::shared_ptr<::smoke::MapsInstance>>::toBaseRef(value);
}
_baseRef smoke_Maps_NumberToInstance_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>>( new ( std::nothrow ) std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>( ) ) );
}
void smoke_Maps_NumberToInstance_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>>*>( handle );
}
_baseRef smoke_Maps_NumberToInstance_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::unordered_map<uint8_t, std::shared_ptr<::smoke::MapsInstance>>>*>( handle )->get( ) );
}
