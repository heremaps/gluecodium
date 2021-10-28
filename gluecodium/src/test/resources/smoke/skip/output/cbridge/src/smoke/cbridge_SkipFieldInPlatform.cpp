//
//
#include "cbridge/include/smoke/cbridge_SkipFieldInPlatform.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/SkipFieldInPlatform.h"
#include <cstdint>
#include <memory>
#include <new>
_baseRef
smoke_SkipFieldInPlatform_create_handle( int32_t intField, bool boolField )
{
    ::smoke::SkipFieldInPlatform* _struct = new ( ::std::nothrow ) ::smoke::SkipFieldInPlatform();
    _struct->int_field = intField;
    _struct->bool_field = boolField;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_SkipFieldInPlatform_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::SkipFieldInPlatform>( handle );
}
_baseRef
smoke_SkipFieldInPlatform_create_optional_handle(int32_t intField, bool boolField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::SkipFieldInPlatform>( ::smoke::SkipFieldInPlatform( ) );
    (*_struct)->int_field = intField;
    (*_struct)->bool_field = boolField;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_SkipFieldInPlatform_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::SkipFieldInPlatform>*>( handle ) );
}
void smoke_SkipFieldInPlatform_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::SkipFieldInPlatform>*>( handle );
}
int32_t smoke_SkipFieldInPlatform_intField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::SkipFieldInPlatform>(handle);
    return struct_pointer->int_field;
}
bool smoke_SkipFieldInPlatform_boolField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::SkipFieldInPlatform>(handle);
    return struct_pointer->bool_field;
}
