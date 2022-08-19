//
//
#include "cbridge/include/smoke/cbridge_SkipField.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/SkipField.h"
#include <memory>
#include <new>
#include <string>
_baseRef
smoke_SkipField_create_handle( _baseRef field )
{
    ::smoke::SkipField* _struct = new ( ::std::nothrow ) ::smoke::SkipField();
    _struct->field = Conversion<::std::string>::toCpp( field );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_SkipField_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::SkipField>( handle );
}
_baseRef
smoke_SkipField_create_optional_handle(_baseRef field)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::SkipField>( ::smoke::SkipField( ) );
    (*_struct)->field = Conversion<::std::string>::toCpp( field );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_SkipField_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::SkipField>*>( handle ) );
}
void smoke_SkipField_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::SkipField>*>( handle );
}
_baseRef smoke_SkipField_field_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::SkipField>(handle);
    return Conversion<::std::string>::toBaseRef(struct_pointer->field);
}
