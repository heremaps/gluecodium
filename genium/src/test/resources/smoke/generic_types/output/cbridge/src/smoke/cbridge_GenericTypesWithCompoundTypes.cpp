//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "alien/FooEnum.h"
#include "alien/FooStruct.h"
#include "cbridge/include/smoke/cbridge_GenericTypesWithCompoundTypes.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "genium/Optional.h"
#include "genium/TypeRepository.h"
#include "smoke/GenericTypesWithCompoundTypes.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
void smoke_GenericTypesWithCompoundTypes_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>>(handle);
}
_baseRef smoke_GenericTypesWithCompoundTypes_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>>(handle)))
        : 0;
}
extern "C" {
extern void* _CBridgeInitsmoke_GenericTypesWithCompoundTypes(_baseRef handle);
}
namespace {
struct smoke_GenericTypesWithCompoundTypesRegisterInit {
    smoke_GenericTypesWithCompoundTypesRegisterInit() {
        get_init_repository().add_init("smoke_GenericTypesWithCompoundTypes", &_CBridgeInitsmoke_GenericTypesWithCompoundTypes);
    }
} s_smoke_GenericTypesWithCompoundTypes_register_init;
}
void* smoke_GenericTypesWithCompoundTypes_get_typed(_baseRef handle) {
    const auto& real_type_id = ::genium::get_type_repository(static_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_GenericTypesWithCompoundTypes(handle);
}
_baseRef
smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle( double value )
{
    ::smoke::GenericTypesWithCompoundTypes::BasicStruct* _struct = new ( std::nothrow ) ::smoke::GenericTypesWithCompoundTypes::BasicStruct();
    _struct->value = value;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::GenericTypesWithCompoundTypes::BasicStruct>( handle );
}
_baseRef
smoke_GenericTypesWithCompoundTypes_BasicStruct_create_optional_handle(double value)
{
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::GenericTypesWithCompoundTypes::BasicStruct>( ::smoke::GenericTypesWithCompoundTypes::BasicStruct( ) );
    (*_struct)->value = value;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::GenericTypesWithCompoundTypes::BasicStruct>*>( handle ) );
}
void smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::GenericTypesWithCompoundTypes::BasicStruct>*>( handle );
}
double smoke_GenericTypesWithCompoundTypes_BasicStruct_value_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::GenericTypesWithCompoundTypes::BasicStruct>(handle);
return struct_pointer->value;
}
_baseRef
smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle( _baseRef string )
{
    ::alien::FooStruct* _struct = new ( std::nothrow ) ::alien::FooStruct();
    _struct->string = Conversion<std::string>::toCpp( string );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::alien::FooStruct>( handle );
}
_baseRef
smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_optional_handle(_baseRef string)
{
    auto _struct = new ( std::nothrow ) ::genium::optional<::alien::FooStruct>( ::alien::FooStruct( ) );
    (*_struct)->string = Conversion<std::string>::toCpp( string );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::alien::FooStruct>*>( handle ) );
}
void smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::alien::FooStruct>*>( handle );
}
_baseRef smoke_GenericTypesWithCompoundTypes_ExternalStruct_string_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::alien::FooStruct>(handle);
return Conversion<std::string>::toBaseRef(struct_pointer->string);
}
_baseRef smoke_GenericTypesWithCompoundTypes_methodWithStructList(_baseRef _instance, _baseRef input) {
    return Conversion<std::vector<::alien::FooStruct>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>>(_instance)->get()->method_with_struct_list(Conversion<std::vector<::smoke::GenericTypesWithCompoundTypes::BasicStruct>>::toCpp(input)))
;
}
_baseRef smoke_GenericTypesWithCompoundTypes_methodWithStructMap(_baseRef _instance, _baseRef input) {
    return Conversion<std::unordered_map<std::string, ::alien::FooStruct>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>>(_instance)->get()->method_with_struct_map(Conversion<std::unordered_map<std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct>>::toCpp(input)))
;
}
_baseRef smoke_GenericTypesWithCompoundTypes_methodWithEnumList(_baseRef _instance, _baseRef input) {
    return Conversion<std::vector<::alien::FooEnum>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>>(_instance)->get()->method_with_enum_list(Conversion<std::vector<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::toCpp(input)))
;
}
_baseRef smoke_GenericTypesWithCompoundTypes_methodWithEnumMapKey(_baseRef _instance, _baseRef input) {
    return Conversion<std::unordered_map<::alien::FooEnum, bool, genium::hash<::alien::FooEnum>>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>>(_instance)->get()->method_with_enum_map_key(Conversion<std::unordered_map<::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, genium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>::toCpp(input)))
;
}
_baseRef smoke_GenericTypesWithCompoundTypes_methodWithEnumMapValue(_baseRef _instance, _baseRef input) {
    return Conversion<std::unordered_map<int32_t, ::alien::FooEnum>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>>(_instance)->get()->method_with_enum_map_value(Conversion<std::unordered_map<int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum>>::toCpp(input)))
;
}
_baseRef smoke_GenericTypesWithCompoundTypes_methodWithEnumSet(_baseRef _instance, _baseRef input) {
    return Conversion<std::unordered_set<::alien::FooEnum, genium::hash<::alien::FooEnum>>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>>(_instance)->get()->method_with_enum_set(Conversion<std::unordered_set<::smoke::GenericTypesWithCompoundTypes::SomeEnum, genium::hash<::smoke::GenericTypesWithCompoundTypes::SomeEnum>>>::toCpp(input)))
;
}
_baseRef smoke_GenericTypesWithCompoundTypes_methodWithInstancesList(_baseRef _instance, _baseRef input) {
    return Conversion<std::vector<std::shared_ptr<::smoke::DummyInterface>>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>>(_instance)->get()->method_with_instances_list(Conversion<std::vector<std::shared_ptr<::smoke::DummyClass>>>::toCpp(input)))
;
}
_baseRef smoke_GenericTypesWithCompoundTypes_methodWithInstancesMap(_baseRef _instance, _baseRef input) {
    return Conversion<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyInterface>>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>>(_instance)->get()->method_with_instances_map(Conversion<std::unordered_map<int32_t, std::shared_ptr<::smoke::DummyClass>>>::toCpp(input)))
;
}