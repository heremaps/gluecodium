//
//
// Automatically generated. Do not modify. Your changes will be lost.

#include "cbridge/include/smoke/Maps.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/Maps.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_map>

void smoke_Maps_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<smoke::Maps>>(handle);
}
_baseRef smoke_Maps_SomeStruct_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::Maps::SomeStruct() );
}
void smoke_Maps_SomeStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::Maps::SomeStruct>(handle);
}
_baseRef smoke_Maps_SomeStruct_value_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Maps::SomeStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->value) );
}
void smoke_Maps_SomeStruct_value_set(_baseRef handle, const char* value) {
    get_pointer<::smoke::Maps::SomeStruct>(handle)->value = value;
}
_baseRef smoke_Maps_StructWithMap_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::Maps::StructWithMap() );
}
void smoke_Maps_StructWithMap_release(_baseRef handle) {
    delete get_pointer<::smoke::Maps::StructWithMap>(handle);
}
_baseRef smoke_Maps_StructWithMap_errorMapping_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Maps::StructWithMap>(handle);
    return reinterpret_cast<_baseRef>( new std::unordered_map<int32_t, std::string>(struct_pointer->error_mapping) );
}
void smoke_Maps_StructWithMap_errorMapping_set(_baseRef handle, _baseRef errorMapping) {
    get_pointer<::smoke::Maps::StructWithMap>(handle)->error_mapping = *get_pointer<std::unordered_map<int32_t, std::string>>(errorMapping);
}

_baseRef smoke_Maps_methodWithMap(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<int32_t, std::string>(::smoke::Maps::method_with_map(*get_pointer<std::unordered_map<int32_t, std::string>>(input))) );
}
_baseRef smoke_Maps_methodWithMapToStruct(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>(::smoke::Maps::method_with_map_to_struct(*get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>>(input))) );
}
_baseRef smoke_Maps_methodWithNestedMap(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>(::smoke::Maps::method_with_nested_map(*get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>>(input))) );
}
_baseRef smoke_Maps_methodWithStructWithMap(_baseRef input) {
    return reinterpret_cast<_baseRef>( new ::smoke::Maps::StructWithMap(::smoke::Maps::method_with_struct_with_map(*get_pointer<::smoke::Maps::StructWithMap>(input))) );
}
_baseRef smoke_Maps_methodWithMapOfArrays(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, std::vector<int32_t>>(::smoke::Maps::method_with_map_of_arrays(*get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(input))) );
}

_baseRef smoke_Maps_ErrorCodeToMessageMap_create() {
    return reinterpret_cast<_baseRef>( new std::unordered_map<int32_t, std::string>() );
}
void smoke_Maps_ErrorCodeToMessageMap_release(_baseRef handle) {
    delete get_pointer<std::unordered_map<int32_t, std::string>>(handle);
}
_baseRef smoke_Maps_ErrorCodeToMessageMap_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<int32_t, std::string>::iterator( get_pointer<std::unordered_map<int32_t, std::string>>(handle)->begin() ) );
}
void smoke_Maps_ErrorCodeToMessageMap_iterator_release(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle );
}
void smoke_Maps_ErrorCodeToMessageMap_put(_baseRef handle, int32_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<int32_t, std::string>>(handle))[key] = *get_pointer<std::string>(value);
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
    return reinterpret_cast<_baseRef>(new std::string { value });
}
_baseRef smoke_Maps_NumberToStruct_create() {
    return reinterpret_cast<_baseRef>( new std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>() );
}
void smoke_Maps_NumberToStruct_release(_baseRef handle) {
    delete get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>>(handle);
}
_baseRef smoke_Maps_NumberToStruct_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>::iterator( get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>>(handle)->begin() ) );
}
void smoke_Maps_NumberToStruct_iterator_release(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>::iterator*>( iterator_handle );
}
void smoke_Maps_NumberToStruct_put(_baseRef handle, uint8_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct>>(handle))[key] = *get_pointer<::smoke::Maps::SomeStruct>(value);
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
    return reinterpret_cast<_baseRef>(new ::smoke::Maps::SomeStruct { value });
}
_baseRef smoke_Maps_NestedMap_create() {
    return reinterpret_cast<_baseRef>( new std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>() );
}
void smoke_Maps_NestedMap_release(_baseRef handle) {
    delete get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>>(handle);
}
_baseRef smoke_Maps_NestedMap_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>::iterator( get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>>(handle)->begin() ) );
}
void smoke_Maps_NestedMap_iterator_release(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>::iterator*>( iterator_handle );
}
void smoke_Maps_NestedMap_put(_baseRef handle, uint8_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<uint8_t, ::smoke::Maps::NumberToStruct>>(handle))[key] = *get_pointer<::smoke::Maps::NumberToStruct>(value);
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
    return reinterpret_cast<_baseRef>(new std::unordered_map<uint8_t, ::smoke::Maps::SomeStruct> { value });
}
_baseRef smoke_Maps_NumberToTypeDef_create() {
    return reinterpret_cast<_baseRef>( new std::unordered_map<uint8_t, std::string>() );
}
void smoke_Maps_NumberToTypeDef_release(_baseRef handle) {
    delete get_pointer<std::unordered_map<uint8_t, std::string>>(handle);
}
_baseRef smoke_Maps_NumberToTypeDef_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<uint8_t, std::string>::iterator( get_pointer<std::unordered_map<uint8_t, std::string>>(handle)->begin() ) );
}
void smoke_Maps_NumberToTypeDef_iterator_release(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<uint8_t, std::string>::iterator*>( iterator_handle );
}
void smoke_Maps_NumberToTypeDef_put(_baseRef handle, uint8_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<uint8_t, std::string>>(handle))[key] = *get_pointer<std::string>(value);
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
    return reinterpret_cast<_baseRef>(new std::string { value });
}
_baseRef smoke_Maps_TypeDefToNumber_create() {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, uint8_t>() );
}
void smoke_Maps_TypeDefToNumber_release(_baseRef handle) {
    delete get_pointer<std::unordered_map<std::string, uint8_t>>(handle);
}
_baseRef smoke_Maps_TypeDefToNumber_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, uint8_t>::iterator( get_pointer<std::unordered_map<std::string, uint8_t>>(handle)->begin() ) );
}
void smoke_Maps_TypeDefToNumber_iterator_release(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, uint8_t>::iterator*>( iterator_handle );
}
void smoke_Maps_TypeDefToNumber_put(_baseRef handle, _baseRef key, uint8_t value) {
    (*get_pointer<std::unordered_map<std::string, uint8_t>>(handle))[*get_pointer<std::string>(key)] = value;
}
bool smoke_Maps_TypeDefToNumber_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, uint8_t>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<std::string, uint8_t>>(handle)->end();
}
void smoke_Maps_TypeDefToNumber_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, uint8_t>::iterator*>( iterator_handle );
}
_baseRef smoke_Maps_TypeDefToNumber_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<std::string, uint8_t>::iterator*>( iterator_handle ))->first;
    return reinterpret_cast<_baseRef>(new std::string { key });
}
uint8_t smoke_Maps_TypeDefToNumber_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<std::string, uint8_t>::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef smoke_Maps_StringToArray_create() {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, std::vector<int32_t>>() );
}
void smoke_Maps_StringToArray_release(_baseRef handle) {
    delete get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle);
}
_baseRef smoke_Maps_StringToArray_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, std::vector<int32_t>>::iterator( get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle)->begin() ) );
}
void smoke_Maps_StringToArray_iterator_release(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle );
}
void smoke_Maps_StringToArray_put(_baseRef handle, _baseRef key, _baseRef value) {
    (*get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle))[*get_pointer<std::string>(key)] = *get_pointer<std::vector<int32_t>>(value);
}
bool smoke_Maps_StringToArray_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<std::string, std::vector<int32_t>>>(handle)->end();
}
void smoke_Maps_StringToArray_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle );
}
_baseRef smoke_Maps_StringToArray_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle ))->first;
    return reinterpret_cast<_baseRef>(new std::string { key });
}
_baseRef smoke_Maps_StringToArray_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<std::string, std::vector<int32_t>>::iterator*>( iterator_handle ))->second;
    return reinterpret_cast<_baseRef>(new std::vector<int32_t> { value });
}
