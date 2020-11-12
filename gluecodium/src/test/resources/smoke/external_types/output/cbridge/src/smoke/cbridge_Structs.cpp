//
//
#include "cbridge/include/smoke/cbridge_Structs.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "non/Sense.h"
#include "smoke/Structs.h"
#include <memory>
#include <new>
#include <string>
#include <vector>
void smoke_Structs_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::Structs >>(handle);
}
_baseRef smoke_Structs_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::Structs >>(handle)))
        : 0;
}
const void* smoke_Structs_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::Structs >>(handle)->get())
        : nullptr;
}
void smoke_Structs_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::Structs >>(handle)->get(), swift_pointer);
}
void smoke_Structs_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::Structs >>(handle)->get());
}
_baseRef
smoke_Structs_ExternalStruct_create_handle( _baseRef stringField, _baseRef externalStringField, _baseRef externalArrayField, _baseRef externalStructField )
{
    ::smoke::Structs::ExternalStruct* _struct = new ( ::std::nothrow ) ::smoke::Structs::ExternalStruct();
    _struct->stringField = Conversion<::std::string>::toCpp( stringField );
    _struct->set_some_string( Conversion<::std::string>::toCpp( externalStringField ) );
    _struct->set_some_array( Conversion<::std::vector< int8_t >>::toCpp( externalArrayField ) );
    _struct->set_some_struct( Conversion<::fire::SomeVeryExternalStruct>::toCpp( externalStructField ) );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Structs_ExternalStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Structs::ExternalStruct>( handle );
}
_baseRef
smoke_Structs_ExternalStruct_create_optional_handle(_baseRef stringField, _baseRef externalStringField, _baseRef externalArrayField, _baseRef externalStructField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::Structs::ExternalStruct>( ::smoke::Structs::ExternalStruct( ) );
    (*_struct)->stringField = Conversion<::std::string>::toCpp( stringField );
    (*_struct)->set_some_string( Conversion<::std::string>::toCpp( externalStringField ) );
    (*_struct)->set_some_array( Conversion<::std::vector< int8_t >>::toCpp( externalArrayField ) );
    (*_struct)->set_some_struct( Conversion<::fire::SomeVeryExternalStruct>::toCpp( externalStructField ) );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Structs_ExternalStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::Structs::ExternalStruct>*>( handle ) );
}
void smoke_Structs_ExternalStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::Structs::ExternalStruct>*>( handle );
}
_baseRef smoke_Structs_ExternalStruct_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Structs::ExternalStruct>(handle);
    return Conversion<::std::string>::toBaseRef(struct_pointer->stringField);
}
_baseRef smoke_Structs_ExternalStruct_externalStringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Structs::ExternalStruct>(handle);
    return Conversion<::std::string>::toBaseRef(struct_pointer->get_some_string());
}
_baseRef smoke_Structs_ExternalStruct_externalArrayField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Structs::ExternalStruct>(handle);
    return Conversion<::std::vector< int8_t >>::toBaseRef(struct_pointer->get_some_array());
}
_baseRef smoke_Structs_ExternalStruct_externalStructField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Structs::ExternalStruct>(handle);
    return Conversion<::fire::SomeVeryExternalStruct>::toBaseRef(struct_pointer->get_some_struct());
}
_baseRef
smoke_Structs_AnotherExternalStruct_create_handle( int8_t intField )
{
    ::fire::SomeVeryExternalStruct* _struct = new ( ::std::nothrow ) ::fire::SomeVeryExternalStruct();
    _struct->intField = intField;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Structs_AnotherExternalStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::fire::SomeVeryExternalStruct>( handle );
}
_baseRef
smoke_Structs_AnotherExternalStruct_create_optional_handle(int8_t intField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::fire::SomeVeryExternalStruct>( ::fire::SomeVeryExternalStruct( ) );
    (*_struct)->intField = intField;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Structs_AnotherExternalStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::fire::SomeVeryExternalStruct>*>( handle ) );
}
void smoke_Structs_AnotherExternalStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::fire::SomeVeryExternalStruct>*>( handle );
}
int8_t smoke_Structs_AnotherExternalStruct_intField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::fire::SomeVeryExternalStruct>(handle);
    return struct_pointer->intField;
}
_baseRef smoke_Structs_getExternalStruct() {
    return Conversion<::smoke::Structs::ExternalStruct>::toBaseRef(::smoke::Structs::get_external_struct());
}
_baseRef smoke_Structs_getAnotherExternalStruct() {
    return Conversion<::fire::SomeVeryExternalStruct>::toBaseRef(::smoke::Structs::get_another_external_struct());
}
