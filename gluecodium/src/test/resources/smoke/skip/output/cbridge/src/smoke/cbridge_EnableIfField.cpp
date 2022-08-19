//
//
#include "cbridge/include/smoke/cbridge_EnableIfField.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/EnableIfField.h"
#include <cstdint>
#include <memory>
#include <new>
_baseRef
smoke_EnableIfField_create_handle( int32_t intField, bool boolField )
{
    ::smoke::EnableIfField* _struct = new ( ::std::nothrow ) ::smoke::EnableIfField();
    _struct->int_field = intField;
    _struct->bool_field = boolField;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_EnableIfField_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::EnableIfField>( handle );
}
_baseRef
smoke_EnableIfField_create_optional_handle(int32_t intField, bool boolField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::EnableIfField>( ::smoke::EnableIfField( ) );
    (*_struct)->int_field = intField;
    (*_struct)->bool_field = boolField;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_EnableIfField_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::EnableIfField>*>( handle ) );
}
void smoke_EnableIfField_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::EnableIfField>*>( handle );
}
int32_t smoke_EnableIfField_intField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::EnableIfField>(handle);
    return struct_pointer->int_field;
}
bool smoke_EnableIfField_boolField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::EnableIfField>(handle);
    return struct_pointer->bool_field;
}
