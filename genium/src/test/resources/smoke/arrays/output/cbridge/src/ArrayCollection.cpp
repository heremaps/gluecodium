//
//
// Automatically generated. Do not modify. Your changes will be lost.

#include "cbridge/include/ArrayCollection.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/Arrays.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/Arrays.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <vector>

_baseRef arrayCollection_Enums_create() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::SomeEnum>() );
}
void arrayCollection_Enums_release(_baseRef handle) {
    delete get_pointer<std::vector<::smoke::Arrays::SomeEnum>>(handle);
}
uint64_t arrayCollection_Enums_count(_baseRef handle) {
    return get_pointer<std::vector<::smoke::Arrays::SomeEnum>>(handle)->size();
}
smoke_Arrays_SomeEnum arrayCollection_Enums_get(_baseRef handle, uint64_t index) {
    return static_cast<smoke_Arrays_SomeEnum>((*get_pointer<std::vector<::smoke::Arrays::SomeEnum>>(handle))[index]);
}
void arrayCollection_Enums_append(_baseRef handle, smoke_Arrays_SomeEnum item) {
    get_pointer<std::vector<::smoke::Arrays::SomeEnum>>(handle)->push_back(static_cast<::smoke::Arrays::SomeEnum>(item));
}
_baseRef arrayCollection_FancyStruct_create() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::FancyStruct>() );
}
void arrayCollection_FancyStruct_release(_baseRef handle) {
    delete get_pointer<std::vector<::smoke::Arrays::FancyStruct>>(handle);
}
uint64_t arrayCollection_FancyStruct_count(_baseRef handle) {
    return get_pointer<std::vector<::smoke::Arrays::FancyStruct>>(handle)->size();
}
_baseRef arrayCollection_FancyStruct_get(_baseRef handle, uint64_t index) {
    return reinterpret_cast<_baseRef>(
        new ::smoke::Arrays::FancyStruct {
            (*get_pointer<std::vector<::smoke::Arrays::FancyStruct>>(handle))[index]
        }
    );
}
void arrayCollection_FancyStruct_append(_baseRef handle, _baseRef item) {
    get_pointer<std::vector<::smoke::Arrays::FancyStruct>>(handle)->push_back(*get_pointer<::smoke::Arrays::FancyStruct>(item));
}
_baseRef arrayCollection_UInt8Array_create() {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<uint8_t>>() );
}
void arrayCollection_UInt8Array_release(_baseRef handle) {
    delete get_pointer<std::vector<std::vector<uint8_t>>>(handle);
}
uint64_t arrayCollection_UInt8Array_count(_baseRef handle) {
    return get_pointer<std::vector<std::vector<uint8_t>>>(handle)->size();
}
_baseRef arrayCollection_UInt8Array_get(_baseRef handle, uint64_t index) {
    return reinterpret_cast<_baseRef>(
        new std::vector<uint8_t> {
            (*get_pointer<std::vector<std::vector<uint8_t>>>(handle))[index]
        }
    );
}
void arrayCollection_UInt8Array_append(_baseRef handle, _baseRef item) {
    get_pointer<std::vector<std::vector<uint8_t>>>(handle)->push_back(*get_pointer<std::vector<uint8_t>>(item));
}
_baseRef arrayCollection_Int32StringMap_create() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::ErrorCodeToMessageMap>() );
}
void arrayCollection_Int32StringMap_release(_baseRef handle) {
    delete get_pointer<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>(handle);
}
uint64_t arrayCollection_Int32StringMap_count(_baseRef handle) {
    return get_pointer<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>(handle)->size();
}
_baseRef arrayCollection_Int32StringMap_get(_baseRef handle, uint64_t index) {
    return reinterpret_cast<_baseRef>( &(*get_pointer<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>(handle))[index] );
}
void arrayCollection_Int32StringMap_append(_baseRef handle, _baseRef item) {
    get_pointer<std::vector<::smoke::Arrays::ErrorCodeToMessageMap>>(handle)->push_back(*get_pointer<::smoke::Arrays::ErrorCodeToMessageMap>(item));
}
_baseRef arrayCollection_BasicStruct_create() {
    return reinterpret_cast<_baseRef>( new std::vector<::smoke::Arrays::BasicStruct>() );
}
void arrayCollection_BasicStruct_release(_baseRef handle) {
    delete get_pointer<std::vector<::smoke::Arrays::BasicStruct>>(handle);
}
uint64_t arrayCollection_BasicStruct_count(_baseRef handle) {
    return get_pointer<std::vector<::smoke::Arrays::BasicStruct>>(handle)->size();
}
_baseRef arrayCollection_BasicStruct_get(_baseRef handle, uint64_t index) {
    return reinterpret_cast<_baseRef>(
        new ::smoke::Arrays::BasicStruct {
            (*get_pointer<std::vector<::smoke::Arrays::BasicStruct>>(handle))[index]
        }
    );
}
void arrayCollection_BasicStruct_append(_baseRef handle, _baseRef item) {
    get_pointer<std::vector<::smoke::Arrays::BasicStruct>>(handle)->push_back(*get_pointer<::smoke::Arrays::BasicStruct>(item));
}
_baseRef arrayCollection_String_create() {
    return reinterpret_cast<_baseRef>( new std::vector<std::string>() );
}
void arrayCollection_String_release(_baseRef handle) {
    delete get_pointer<std::vector<std::string>>(handle);
}
uint64_t arrayCollection_String_count(_baseRef handle) {
    return get_pointer<std::vector<std::string>>(handle)->size();
}
_baseRef arrayCollection_String_get(_baseRef handle, uint64_t index) {
    return reinterpret_cast<_baseRef>(
        new std::string {
            (*get_pointer<std::vector<std::string>>(handle))[index]
        }
    );
}
void arrayCollection_String_append(_baseRef handle, const char* item) {
    get_pointer<std::vector<std::string>>(handle)->push_back(std::string(item));
}
_baseRef arrayCollection_StringArray_create() {
    return reinterpret_cast<_baseRef>( new std::vector<std::vector<std::string>>() );
}
void arrayCollection_StringArray_release(_baseRef handle) {
    delete get_pointer<std::vector<std::vector<std::string>>>(handle);
}
uint64_t arrayCollection_StringArray_count(_baseRef handle) {
    return get_pointer<std::vector<std::vector<std::string>>>(handle)->size();
}
_baseRef arrayCollection_StringArray_get(_baseRef handle, uint64_t index) {
    return reinterpret_cast<_baseRef>(
        new std::vector<std::string> {
            (*get_pointer<std::vector<std::vector<std::string>>>(handle))[index]
        }
    );
}
void arrayCollection_StringArray_append(_baseRef handle, _baseRef item) {
    get_pointer<std::vector<std::vector<std::string>>>(handle)->push_back(*get_pointer<std::vector<std::string>>(item));
}
_baseRef arrayCollection_UInt8_create() {
    return reinterpret_cast<_baseRef>( new std::vector<uint8_t>() );
}
void arrayCollection_UInt8_release(_baseRef handle) {
    delete get_pointer<std::vector<uint8_t>>(handle);
}
uint64_t arrayCollection_UInt8_count(_baseRef handle) {
    return get_pointer<std::vector<uint8_t>>(handle)->size();
}
uint8_t arrayCollection_UInt8_get(_baseRef handle, uint64_t index) {
    return (*get_pointer<std::vector<uint8_t>>(handle))[index];
}
void arrayCollection_UInt8_append(_baseRef handle, uint8_t item) {
    get_pointer<std::vector<uint8_t>>(handle)->push_back(item);
}
