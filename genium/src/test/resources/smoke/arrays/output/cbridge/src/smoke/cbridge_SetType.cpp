//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_SetType.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "genium/Optional.h"
#include "smoke/SetType.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_set>
void smoke_SetType_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::SetType>>(handle);
}
_baseRef smoke_SetType_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::SetType>>(handle)))
        : 0;
}
_baseRef
smoke_SetType_EquatableStruct_create_handle( _baseRef id )
{
    ::smoke::SetType::EquatableStruct* _struct = new ( std::nothrow ) ::smoke::SetType::EquatableStruct();
    _struct->id = Conversion<std::string>::toCpp( id );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_SetType_EquatableStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::SetType::EquatableStruct>( handle );
}
_baseRef
smoke_SetType_EquatableStruct_create_optional_handle(_baseRef id)
{
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::SetType::EquatableStruct>( ::smoke::SetType::EquatableStruct( ) );
    (*_struct)->id = Conversion<std::string>::toCpp( id );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_SetType_EquatableStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::SetType::EquatableStruct>*>( handle ) );
}
void smoke_SetType_EquatableStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::SetType::EquatableStruct>*>( handle );
}
_baseRef smoke_SetType_EquatableStruct_id_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::SetType::EquatableStruct>(handle);
return Conversion<std::string>::toBaseRef(struct_pointer->id);
}
_baseRef smoke_SetType_stringSetRoundTrip(_baseRef input) {
    return Conversion<::smoke::SetType::StringSet>::toBaseRef(::smoke::SetType::string_set_round_trip(Conversion<::smoke::SetType::StringSet>::toCpp(input)))
;
}
_baseRef smoke_SetType_enumSetRoundTrip(_baseRef input) {
    return Conversion<::smoke::SetType::EnumSet>::toBaseRef(::smoke::SetType::enum_set_round_trip(Conversion<::smoke::SetType::EnumSet>::toCpp(input)))
;
}
_baseRef smoke_SetType_nullableIntSetRoundTrip(_baseRef input) {
    return Conversion<::genium::optional< ::smoke::SetType::IntSet >>::toBaseRef(::smoke::SetType::nullable_int_set_round_trip(Conversion<::genium::optional< ::smoke::SetType::IntSet >>::toCpp(input)))
;
}
_baseRef smoke_SetType_IntSet_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_set<int32_t>() );
}
void smoke_SetType_IntSet_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_set<int32_t>>(handle);
}
void smoke_SetType_IntSet_insert(_baseRef handle, int32_t value) {
    (*get_pointer<std::unordered_set<int32_t>>(handle)).insert(std::move(value));
}
_baseRef smoke_SetType_IntSet_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_set<int32_t>::iterator( get_pointer<std::unordered_set<int32_t>>(handle)->begin() ) );
}
void smoke_SetType_IntSet_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_set<int32_t>::iterator*>( iterator_handle );
}
bool smoke_SetType_IntSet_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_set<int32_t>::iterator*>( iterator_handle ) != get_pointer<std::unordered_set<int32_t>>(handle)->end();
}
void smoke_SetType_IntSet_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<int32_t>::iterator*>( iterator_handle );
}
int32_t smoke_SetType_IntSet_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<std::unordered_set<int32_t>::iterator*>( iterator_handle );
    return value;
}
_baseRef smoke_SetType_IntSet_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::unordered_set<int32_t>>( std::unordered_set<int32_t>( ) ) );
}
void smoke_SetType_IntSet_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::unordered_set<int32_t>>*>( handle );
}
_baseRef smoke_SetType_IntSet_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::unordered_set<int32_t>>*>( handle ) );
}
_baseRef smoke_SetType_StringSet_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_set<std::string>() );
}
void smoke_SetType_StringSet_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_set<std::string>>(handle);
}
void smoke_SetType_StringSet_insert(_baseRef handle, _baseRef value) {
    (*get_pointer<std::unordered_set<std::string>>(handle)).insert(std::move(Conversion<std::string>::toCpp(value)));
}
_baseRef smoke_SetType_StringSet_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_set<std::string>::iterator( get_pointer<std::unordered_set<std::string>>(handle)->begin() ) );
}
void smoke_SetType_StringSet_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_set<std::string>::iterator*>( iterator_handle );
}
bool smoke_SetType_StringSet_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_set<std::string>::iterator*>( iterator_handle ) != get_pointer<std::unordered_set<std::string>>(handle)->end();
}
void smoke_SetType_StringSet_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<std::string>::iterator*>( iterator_handle );
}
_baseRef smoke_SetType_StringSet_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<std::unordered_set<std::string>::iterator*>( iterator_handle );
    return Conversion<std::string>::referenceBaseRef(value);
}
_baseRef smoke_SetType_StringSet_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::unordered_set<std::string>>( std::unordered_set<std::string>( ) ) );
}
void smoke_SetType_StringSet_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::unordered_set<std::string>>*>( handle );
}
_baseRef smoke_SetType_StringSet_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::unordered_set<std::string>>*>( handle ) );
}
_baseRef smoke_SetType_EnumSet_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >() );
}
void smoke_SetType_EnumSet_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >>(handle);
}
void smoke_SetType_EnumSet_insert(_baseRef handle, smoke_SetType_SomeEnum value) {
    (*get_pointer<std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >>(handle)).insert(std::move(static_cast<::smoke::SetType::SomeEnum>(value)));
}
_baseRef smoke_SetType_EnumSet_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >::iterator( get_pointer<std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >>(handle)->begin() ) );
}
void smoke_SetType_EnumSet_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >::iterator*>( iterator_handle );
}
bool smoke_SetType_EnumSet_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >::iterator*>( iterator_handle ) != get_pointer<std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >>(handle)->end();
}
void smoke_SetType_EnumSet_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >::iterator*>( iterator_handle );
}
smoke_SetType_SomeEnum smoke_SetType_EnumSet_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >::iterator*>( iterator_handle );
    return static_cast<smoke_SetType_SomeEnum>(value);
}
_baseRef smoke_SetType_EnumSet_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >>( std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >( ) ) );
}
void smoke_SetType_EnumSet_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >>*>( handle );
}
_baseRef smoke_SetType_EnumSet_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::unordered_set<::smoke::SetType::SomeEnum, ::genium::hash<::smoke::SetType::SomeEnum> >>*>( handle ) );
}
_baseRef smoke_SetType_StructSet_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >() );
}
void smoke_SetType_StructSet_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >>(handle);
}
void smoke_SetType_StructSet_insert(_baseRef handle, _baseRef value) {
    (*get_pointer<std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >>(handle)).insert(std::move(Conversion<::smoke::SetType::EquatableStruct>::toCpp(value)));
}
_baseRef smoke_SetType_StructSet_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >::iterator( get_pointer<std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >>(handle)->begin() ) );
}
void smoke_SetType_StructSet_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >::iterator*>( iterator_handle );
}
bool smoke_SetType_StructSet_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >::iterator*>( iterator_handle ) != get_pointer<std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >>(handle)->end();
}
void smoke_SetType_StructSet_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >::iterator*>( iterator_handle );
}
_baseRef smoke_SetType_StructSet_iterator_get(_baseRef iterator_handle) {
    auto& value = **reinterpret_cast<std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >::iterator*>( iterator_handle );
    return Conversion<::smoke::SetType::EquatableStruct>::referenceBaseRef(value);
}
_baseRef smoke_SetType_StructSet_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >>( std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >( ) ) );
}
void smoke_SetType_StructSet_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >>*>( handle );
}
_baseRef smoke_SetType_StructSet_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::unordered_set<::smoke::SetType::EquatableStruct, ::genium::hash<::smoke::SetType::EquatableStruct> >>*>( handle ) );
}