//
//
#include "cbridge/include/smoke/cbridge_ExternalTypeInTypesCollection.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "include/ExternalTypeInTypesCollection.h"
#include "smoke/ExternalTypeInTypesCollection.h"
#include <cstdint>
#include <memory>
#include <new>
#include <optional>
_baseRef
smoke_ExternalTypeInTypesCollection_IntStruct_create_handle( int32_t intField )
{
    ::external::IntStruct* _struct = new ( ::std::nothrow ) ::external::IntStruct();
    _struct->int_field = intField;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_ExternalTypeInTypesCollection_IntStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::external::IntStruct>( handle );
}
_baseRef
smoke_ExternalTypeInTypesCollection_IntStruct_create_optional_handle(int32_t intField)
{
    auto _struct = new ( ::std::nothrow ) std::optional<::external::IntStruct>( ::external::IntStruct( ) );
    (*_struct)->int_field = intField;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_ExternalTypeInTypesCollection_IntStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::external::IntStruct>*>( handle ) );
}
void smoke_ExternalTypeInTypesCollection_IntStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::external::IntStruct>*>( handle );
}
int32_t smoke_ExternalTypeInTypesCollection_IntStruct_intField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::external::IntStruct>(handle);
    return struct_pointer->int_field;
}
