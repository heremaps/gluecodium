//
//
#include "cbridge/include/smoke/cbridge_SkipFieldInPlatformImmutable.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/DummyStruct.h"
#include "smoke/SkipFieldInPlatformImmutable.h"
#include <cstdint>
#include <memory>
#include <new>
_baseRef
smoke_SkipFieldInPlatformImmutable_create_handle( int32_t intField, bool boolField )
{
    auto _intField = intField;
    auto _boolField = boolField;
    ::smoke::SkipFieldInPlatformImmutable* _struct = new ( ::std::nothrow ) ::smoke::SkipFieldInPlatformImmutable( _intField, ::smoke::DummyStruct{}, _boolField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_SkipFieldInPlatformImmutable_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::SkipFieldInPlatformImmutable>( handle );
}
_baseRef
smoke_SkipFieldInPlatformImmutable_create_optional_handle(int32_t intField, bool boolField)
{
    auto _intField = intField;
    auto _boolField = boolField;
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::SkipFieldInPlatformImmutable>( ::smoke::SkipFieldInPlatformImmutable( _intField, ::smoke::DummyStruct{}, _boolField ) );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_SkipFieldInPlatformImmutable_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::SkipFieldInPlatformImmutable>*>( handle ) );
}
void smoke_SkipFieldInPlatformImmutable_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::SkipFieldInPlatformImmutable>*>( handle );
}
int32_t smoke_SkipFieldInPlatformImmutable_intField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::SkipFieldInPlatformImmutable>(handle);
    return struct_pointer->int_field;
}
bool smoke_SkipFieldInPlatformImmutable_boolField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::SkipFieldInPlatformImmutable>(handle);
    return struct_pointer->bool_field;
}
