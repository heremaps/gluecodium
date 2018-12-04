//
//
// Automatically generated. Do not modify. Your changes will be lost.
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
_baseRef smoke_Arrays_BasicStruct_create_handle(double value) {
    ::smoke::Arrays::BasicStruct* _struct = new ::smoke::Arrays::BasicStruct();
    _struct->value = value;
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_Arrays_BasicStruct_release_handle(_baseRef handle) {
    delete get_pointer<::smoke::Arrays::BasicStruct>(handle);
}
double smoke_Arrays_BasicStruct_value_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Arrays::BasicStruct>(handle);
    return struct_pointer->value;
}
_baseRef smoke_Arrays_ExternalStruct_create_handle(const char* string) {
    ::alien::FooStruct* _struct = new ::alien::FooStruct();
    _struct->string = string;
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_Arrays_ExternalStruct_release_handle(_baseRef handle) {
    delete get_pointer<::alien::FooStruct>(handle);
}
_baseRef smoke_Arrays_ExternalStruct_string_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::alien::FooStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->string) );
}
_baseRef smoke_Arrays_FancyStruct_create_handle(_baseRef messages, _baseRef numbers, _baseRef image) {
    ::smoke::Arrays::FancyStruct* _struct = new ::smoke::Arrays::FancyStruct();
    _struct->messages = *get_pointer<std::vector<std::string>>(messages);
    _struct->numbers = *get_pointer<std::vector<uint8_t>>(numbers);
    _struct->image = *get_pointer<::std::shared_ptr< ::std::vector< uint8_t > >>(image);
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_Arrays_FancyStruct_release_handle(_baseRef handle) {
    delete get_pointer<::smoke::Arrays::FancyStruct>(handle);
}
_baseRef smoke_Arrays_FancyStruct_messages_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Arrays::FancyStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::vector<std::string>(struct_pointer->messages) );
}
_baseRef smoke_Arrays_FancyStruct_numbers_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Arrays::FancyStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::vector<uint8_t>(struct_pointer->numbers) );
}
_baseRef smoke_Arrays_FancyStruct_image_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::Arrays::FancyStruct>(handle);
    return reinterpret_cast<_baseRef>( checked_pointer_copy(struct_pointer->image) );
}
_baseRef smoke_Arrays_methodWithArray(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::vector<std::string>(::smoke::Arrays::method_with_array(*get_pointer<std::vector<std::string>>(input))) );
}
_baseRef smoke_Arrays_methodWithArrayInline(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::vector<uint8_t>(::smoke::Arrays::method_with_array_inline(*get_pointer<std::vector<uint8_t>>(input))) );
}
_baseRef smoke_Arrays_methodWithStructArray(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::BasicStruct>(::smoke::Arrays::method_with_struct_array(*get_pointer<std::vector<::smoke::Arrays::BasicStruct>>(input))) );
}
_baseRef smoke_Arrays_methodWithExternalStructArray(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooStruct>(::smoke::Arrays::method_with_external_struct_array(*get_pointer<std::vector<::alien::FooStruct>>(input))) );
}
_baseRef smoke_Arrays_methodWithArrayOfArrays(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<uint8_t>>(::smoke::Arrays::method_with_array_of_arrays(*get_pointer<std::vector<std::vector<uint8_t>>>(input))) );
}
_baseRef smoke_Arrays_mergeArraysOfStructsWithArrays(_baseRef inlineFancyArray, _baseRef fancyArray) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::FancyStruct>(::smoke::Arrays::merge_arrays_of_structs_with_arrays(*get_pointer<std::vector<::smoke::Arrays::FancyStruct>>(inlineFancyArray), *get_pointer<std::vector<::smoke::Arrays::FancyStruct>>(fancyArray))) );
}
_baseRef smoke_Arrays_methodWithArrayOfAliases(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::vector<std::string>(::smoke::Arrays::method_with_array_of_aliases(*get_pointer<std::vector<std::string>>(input))) );
}
_baseRef smoke_Arrays_methodWithArrayOfMaps(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::ErrorCodeToMessageMap>(::smoke::Arrays::method_with_array_of_maps(*get_pointer<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>(input))) );
}
_baseRef smoke_Arrays_methodWithByteBuffer(_baseRef input) {
    return reinterpret_cast<_baseRef>( new ::std::shared_ptr< ::std::vector< uint8_t > >(::smoke::Arrays::method_with_byte_buffer(*get_pointer<::std::shared_ptr< ::std::vector< uint8_t > >>(input))) );
}
_baseRef smoke_Arrays_methodWithEnumArray(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::SomeEnum>(::smoke::Arrays::method_with_enum_array(*get_pointer<std::vector<::smoke::Arrays::SomeEnum>>(input))) );
}
_baseRef smoke_Arrays_methodWithExternalEnumArray(_baseRef input) {
    return reinterpret_cast<_baseRef>( new std::vector<::alien::FooEnum>(::smoke::Arrays::method_with_external_enum_array(*get_pointer<std::vector<::alien::FooEnum>>(input))) );
}
_baseRef smoke_Arrays_ErrorCodeToMessageMap_create_handle() {
    return reinterpret_cast<_baseRef>( new std::unordered_map<int32_t, std::string>() );
}
void smoke_Arrays_ErrorCodeToMessageMap_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<int32_t, std::string>>(handle);
}
_baseRef smoke_Arrays_ErrorCodeToMessageMap_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<int32_t, std::string>::iterator( get_pointer<std::unordered_map<int32_t, std::string>>(handle)->begin() ) );
}
void smoke_Arrays_ErrorCodeToMessageMap_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<int32_t, std::string>::iterator*>( iterator_handle );
}
void smoke_Arrays_ErrorCodeToMessageMap_put(_baseRef handle, int32_t key, _baseRef value) {
    (*get_pointer<std::unordered_map<int32_t, std::string>>(handle))[key] = *get_pointer<std::string>(value);
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
    return reinterpret_cast<_baseRef>(new std::string { value });
}
