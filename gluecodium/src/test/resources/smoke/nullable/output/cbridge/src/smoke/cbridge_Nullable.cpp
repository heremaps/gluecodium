//
//
#include "cbridge/include/smoke/cbridge_Nullable.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Nullable.h"
#include "smoke/SomeInterface.h"
#include <cstdint>
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <vector>
void smoke_Nullable_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::Nullable >>(handle);
}
_baseRef smoke_Nullable_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::Nullable >>(handle)))
        : 0;
}
const void* smoke_Nullable_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(handle)->get())
        : nullptr;
}
void smoke_Nullable_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(handle)->get(), swift_pointer);
}
void smoke_Nullable_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(handle)->get());
}
_baseRef smoke_Nullable_methodWithString(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< ::std::string >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->method_with_string(Conversion<::gluecodium::optional< ::std::string >>::toCpp(input)));
}
_baseRef smoke_Nullable_methodWithBoolean(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< bool >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->method_with_boolean(Conversion<::gluecodium::optional< bool >>::toCpp(input)));
}
_baseRef smoke_Nullable_methodWithDouble(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< double >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->method_with_double(Conversion<::gluecodium::optional< double >>::toCpp(input)));
}
_baseRef smoke_Nullable_methodWithInt(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< int64_t >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->method_with_int(Conversion<::gluecodium::optional< int64_t >>::toCpp(input)));
}
_baseRef smoke_Nullable_methodWithSomeStruct(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< ::smoke::Nullable::SomeStruct >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->method_with_some_struct(Conversion<::gluecodium::optional< ::smoke::Nullable::SomeStruct >>::toCpp(input)));
}
_baseRef smoke_Nullable_methodWithSomeEnum(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< ::smoke::Nullable::SomeEnum >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->method_with_some_enum(Conversion<::gluecodium::optional< ::smoke::Nullable::SomeEnum >>::toCpp(input)));
}
_baseRef smoke_Nullable_methodWithSomeArray(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->method_with_some_array(Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toCpp(input)));
}
_baseRef smoke_Nullable_methodWithInlineArray(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->method_with_inline_array(Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toCpp(input)));
}
_baseRef smoke_Nullable_methodWithSomeMap(_baseRef _instance, _baseRef input) {
    return Conversion<::gluecodium::optional< ::std::unordered_map< int64_t, ::std::string > >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->method_with_some_map(Conversion<::gluecodium::optional< ::std::unordered_map< int64_t, ::std::string > >>::toCpp(input)));
}
_baseRef smoke_Nullable_methodWithInstance(_baseRef _instance, _baseRef input) {
    return Conversion<::std::shared_ptr< ::smoke::SomeInterface >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->method_with_instance(Conversion<::std::shared_ptr< ::smoke::SomeInterface >>::toCpp(input)));
}
_baseRef smoke_Nullable_stringProperty_get(_baseRef _instance) {
    return Conversion<::gluecodium::optional< ::std::string >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->get_string_property());
}
void smoke_Nullable_stringProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->set_string_property(Conversion<::gluecodium::optional< ::std::string >>::toCpp(value));
}
_baseRef smoke_Nullable_isBoolProperty_get(_baseRef _instance) {
    return Conversion<::gluecodium::optional< bool >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->is_bool_property());
}
void smoke_Nullable_isBoolProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->set_bool_property(Conversion<::gluecodium::optional< bool >>::toCpp(value));
}
_baseRef smoke_Nullable_doubleProperty_get(_baseRef _instance) {
    return Conversion<::gluecodium::optional< double >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->get_double_property());
}
void smoke_Nullable_doubleProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->set_double_property(Conversion<::gluecodium::optional< double >>::toCpp(value));
}
_baseRef smoke_Nullable_intProperty_get(_baseRef _instance) {
    return Conversion<::gluecodium::optional< int64_t >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->get_int_property());
}
void smoke_Nullable_intProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->set_int_property(Conversion<::gluecodium::optional< int64_t >>::toCpp(value));
}
_baseRef smoke_Nullable_structProperty_get(_baseRef _instance) {
    return Conversion<::gluecodium::optional< ::smoke::Nullable::SomeStruct >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->get_struct_property());
}
void smoke_Nullable_structProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->set_struct_property(Conversion<::gluecodium::optional< ::smoke::Nullable::SomeStruct >>::toCpp(value));
}
_baseRef smoke_Nullable_enumProperty_get(_baseRef _instance) {
    return Conversion<::gluecodium::optional< ::smoke::Nullable::SomeEnum >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->get_enum_property());
}
void smoke_Nullable_enumProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->set_enum_property(Conversion<::gluecodium::optional< ::smoke::Nullable::SomeEnum >>::toCpp(value));
}
_baseRef smoke_Nullable_arrayProperty_get(_baseRef _instance) {
    return Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->get_array_property());
}
void smoke_Nullable_arrayProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->set_array_property(Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toCpp(value));
}
_baseRef smoke_Nullable_inlineArrayProperty_get(_baseRef _instance) {
    return Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->get_inline_array_property());
}
void smoke_Nullable_inlineArrayProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->set_inline_array_property(Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toCpp(value));
}
_baseRef smoke_Nullable_mapProperty_get(_baseRef _instance) {
    return Conversion<::gluecodium::optional< ::std::unordered_map< int64_t, ::std::string > >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->get_map_property());
}
void smoke_Nullable_mapProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->set_map_property(Conversion<::gluecodium::optional< ::std::unordered_map< int64_t, ::std::string > >>::toCpp(value));
}
_baseRef smoke_Nullable_instanceProperty_get(_baseRef _instance) {
    return Conversion<::std::shared_ptr< ::smoke::SomeInterface >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->get_instance_property());
}
void smoke_Nullable_instanceProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::Nullable >>(_instance)->get()->set_instance_property(Conversion<::std::shared_ptr< ::smoke::SomeInterface >>::toCpp(value));
}
_baseRef
smoke_Nullable_SomeStruct_create_handle( _baseRef stringField )
{
    ::smoke::Nullable::SomeStruct* _struct = new ( ::std::nothrow ) ::smoke::Nullable::SomeStruct();
    _struct->string_field = Conversion<::std::string>::toCpp( stringField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Nullable_SomeStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Nullable::SomeStruct>( handle );
}
_baseRef
smoke_Nullable_SomeStruct_create_optional_handle(_baseRef stringField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::Nullable::SomeStruct>( ::smoke::Nullable::SomeStruct( ) );
    (*_struct)->string_field = Conversion<::std::string>::toCpp( stringField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Nullable_SomeStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::Nullable::SomeStruct>*>( handle ) );
}
void smoke_Nullable_SomeStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::Nullable::SomeStruct>*>( handle );
}
_baseRef smoke_Nullable_SomeStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::SomeStruct>(handle);
    return Conversion<::std::string>::toBaseRef(struct_pointer->string_field);
}
_baseRef
smoke_Nullable_NullableStruct_create_handle( _baseRef stringField, _baseRef boolField, _baseRef doubleField, _baseRef structField, _baseRef enumField, _baseRef arrayField, _baseRef inlineArrayField, _baseRef mapField, _baseRef instanceField )
{
    ::smoke::Nullable::NullableStruct* _struct = new ( ::std::nothrow ) ::smoke::Nullable::NullableStruct();
    _struct->string_field = Conversion<::gluecodium::optional< ::std::string >>::toCpp( stringField );
    _struct->bool_field = Conversion<::gluecodium::optional< bool >>::toCpp( boolField );
    _struct->double_field = Conversion<::gluecodium::optional< double >>::toCpp( doubleField );
    _struct->struct_field = Conversion<::gluecodium::optional< ::smoke::Nullable::SomeStruct >>::toCpp( structField );
    _struct->enum_field = Conversion<::gluecodium::optional< ::smoke::Nullable::SomeEnum >>::toCpp( enumField );
    _struct->array_field = Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toCpp( arrayField );
    _struct->inline_array_field = Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toCpp( inlineArrayField );
    _struct->map_field = Conversion<::gluecodium::optional< ::std::unordered_map< int64_t, ::std::string > >>::toCpp( mapField );
    _struct->instance_field = Conversion<::std::shared_ptr< ::smoke::SomeInterface >>::toCpp( instanceField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Nullable_NullableStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Nullable::NullableStruct>( handle );
}
_baseRef
smoke_Nullable_NullableStruct_create_optional_handle(_baseRef stringField, _baseRef boolField, _baseRef doubleField, _baseRef structField, _baseRef enumField, _baseRef arrayField, _baseRef inlineArrayField, _baseRef mapField, _baseRef instanceField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::Nullable::NullableStruct>( ::smoke::Nullable::NullableStruct( ) );
    (*_struct)->string_field = Conversion<::gluecodium::optional< ::std::string >>::toCpp( stringField );
    (*_struct)->bool_field = Conversion<::gluecodium::optional< bool >>::toCpp( boolField );
    (*_struct)->double_field = Conversion<::gluecodium::optional< double >>::toCpp( doubleField );
    (*_struct)->struct_field = Conversion<::gluecodium::optional< ::smoke::Nullable::SomeStruct >>::toCpp( structField );
    (*_struct)->enum_field = Conversion<::gluecodium::optional< ::smoke::Nullable::SomeEnum >>::toCpp( enumField );
    (*_struct)->array_field = Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toCpp( arrayField );
    (*_struct)->inline_array_field = Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toCpp( inlineArrayField );
    (*_struct)->map_field = Conversion<::gluecodium::optional< ::std::unordered_map< int64_t, ::std::string > >>::toCpp( mapField );
    (*_struct)->instance_field = Conversion<::std::shared_ptr< ::smoke::SomeInterface >>::toCpp( instanceField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Nullable_NullableStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::Nullable::NullableStruct>*>( handle ) );
}
void smoke_Nullable_NullableStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::Nullable::NullableStruct>*>( handle );
}
_baseRef smoke_Nullable_NullableStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableStruct>(handle);
    return Conversion<::gluecodium::optional< ::std::string >>::toBaseRef(struct_pointer->string_field);
}
_baseRef smoke_Nullable_NullableStruct_boolField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableStruct>(handle);
    return Conversion<::gluecodium::optional< bool >>::toBaseRef(struct_pointer->bool_field);
}
_baseRef smoke_Nullable_NullableStruct_doubleField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableStruct>(handle);
    return Conversion<::gluecodium::optional< double >>::toBaseRef(struct_pointer->double_field);
}
_baseRef smoke_Nullable_NullableStruct_structField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableStruct>(handle);
    return Conversion<::gluecodium::optional< ::smoke::Nullable::SomeStruct >>::toBaseRef(struct_pointer->struct_field);
}
_baseRef smoke_Nullable_NullableStruct_enumField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableStruct>(handle);
    return Conversion<::gluecodium::optional< ::smoke::Nullable::SomeEnum >>::toBaseRef(struct_pointer->enum_field);
}
_baseRef smoke_Nullable_NullableStruct_arrayField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableStruct>(handle);
    return Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toBaseRef(struct_pointer->array_field);
}
_baseRef smoke_Nullable_NullableStruct_inlineArrayField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableStruct>(handle);
    return Conversion<::gluecodium::optional< ::std::vector< ::std::string > >>::toBaseRef(struct_pointer->inline_array_field);
}
_baseRef smoke_Nullable_NullableStruct_mapField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableStruct>(handle);
    return Conversion<::gluecodium::optional< ::std::unordered_map< int64_t, ::std::string > >>::toBaseRef(struct_pointer->map_field);
}
_baseRef smoke_Nullable_NullableStruct_instanceField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableStruct>(handle);
    return Conversion<::std::shared_ptr< ::smoke::SomeInterface >>::toBaseRef(struct_pointer->instance_field);
}
_baseRef
smoke_Nullable_NullableIntsStruct_create_handle( _baseRef int8Field, _baseRef int16Field, _baseRef int32Field, _baseRef int64Field, _baseRef uint8Field, _baseRef uint16Field, _baseRef uint32Field, _baseRef uint64Field )
{
    ::smoke::Nullable::NullableIntsStruct* _struct = new ( ::std::nothrow ) ::smoke::Nullable::NullableIntsStruct();
    _struct->int8_field = Conversion<::gluecodium::optional< int8_t >>::toCpp( int8Field );
    _struct->int16_field = Conversion<::gluecodium::optional< int16_t >>::toCpp( int16Field );
    _struct->int32_field = Conversion<::gluecodium::optional< int32_t >>::toCpp( int32Field );
    _struct->int64_field = Conversion<::gluecodium::optional< int64_t >>::toCpp( int64Field );
    _struct->uint8_field = Conversion<::gluecodium::optional< uint8_t >>::toCpp( uint8Field );
    _struct->uint16_field = Conversion<::gluecodium::optional< uint16_t >>::toCpp( uint16Field );
    _struct->uint32_field = Conversion<::gluecodium::optional< uint32_t >>::toCpp( uint32Field );
    _struct->uint64_field = Conversion<::gluecodium::optional< uint64_t >>::toCpp( uint64Field );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Nullable_NullableIntsStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Nullable::NullableIntsStruct>( handle );
}
_baseRef
smoke_Nullable_NullableIntsStruct_create_optional_handle(_baseRef int8Field, _baseRef int16Field, _baseRef int32Field, _baseRef int64Field, _baseRef uint8Field, _baseRef uint16Field, _baseRef uint32Field, _baseRef uint64Field)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::Nullable::NullableIntsStruct>( ::smoke::Nullable::NullableIntsStruct( ) );
    (*_struct)->int8_field = Conversion<::gluecodium::optional< int8_t >>::toCpp( int8Field );
    (*_struct)->int16_field = Conversion<::gluecodium::optional< int16_t >>::toCpp( int16Field );
    (*_struct)->int32_field = Conversion<::gluecodium::optional< int32_t >>::toCpp( int32Field );
    (*_struct)->int64_field = Conversion<::gluecodium::optional< int64_t >>::toCpp( int64Field );
    (*_struct)->uint8_field = Conversion<::gluecodium::optional< uint8_t >>::toCpp( uint8Field );
    (*_struct)->uint16_field = Conversion<::gluecodium::optional< uint16_t >>::toCpp( uint16Field );
    (*_struct)->uint32_field = Conversion<::gluecodium::optional< uint32_t >>::toCpp( uint32Field );
    (*_struct)->uint64_field = Conversion<::gluecodium::optional< uint64_t >>::toCpp( uint64Field );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Nullable_NullableIntsStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::Nullable::NullableIntsStruct>*>( handle ) );
}
void smoke_Nullable_NullableIntsStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::Nullable::NullableIntsStruct>*>( handle );
}
_baseRef smoke_Nullable_NullableIntsStruct_int8Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableIntsStruct>(handle);
    return Conversion<::gluecodium::optional< int8_t >>::toBaseRef(struct_pointer->int8_field);
}
_baseRef smoke_Nullable_NullableIntsStruct_int16Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableIntsStruct>(handle);
    return Conversion<::gluecodium::optional< int16_t >>::toBaseRef(struct_pointer->int16_field);
}
_baseRef smoke_Nullable_NullableIntsStruct_int32Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableIntsStruct>(handle);
    return Conversion<::gluecodium::optional< int32_t >>::toBaseRef(struct_pointer->int32_field);
}
_baseRef smoke_Nullable_NullableIntsStruct_int64Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableIntsStruct>(handle);
    return Conversion<::gluecodium::optional< int64_t >>::toBaseRef(struct_pointer->int64_field);
}
_baseRef smoke_Nullable_NullableIntsStruct_uint8Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableIntsStruct>(handle);
    return Conversion<::gluecodium::optional< uint8_t >>::toBaseRef(struct_pointer->uint8_field);
}
_baseRef smoke_Nullable_NullableIntsStruct_uint16Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableIntsStruct>(handle);
    return Conversion<::gluecodium::optional< uint16_t >>::toBaseRef(struct_pointer->uint16_field);
}
_baseRef smoke_Nullable_NullableIntsStruct_uint32Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableIntsStruct>(handle);
    return Conversion<::gluecodium::optional< uint32_t >>::toBaseRef(struct_pointer->uint32_field);
}
_baseRef smoke_Nullable_NullableIntsStruct_uint64Field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Nullable::NullableIntsStruct>(handle);
    return Conversion<::gluecodium::optional< uint64_t >>::toBaseRef(struct_pointer->uint64_field);
}
