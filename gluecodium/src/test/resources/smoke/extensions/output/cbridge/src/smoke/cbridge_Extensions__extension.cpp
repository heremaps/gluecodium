//
//
#include "cbridge/include/smoke/cbridge_Extensions__extension.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/Extensions.h"
#include <memory>
#include <new>
#include <string>
_baseRef
smoke_Extensions_FooStruct_create_handle( _baseRef fooField )
{
    ::smoke::FooStruct* _struct = new ( ::std::nothrow ) ::smoke::FooStruct();
    _struct->foo_field = Conversion<::std::string>::toCpp( fooField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Extensions_FooStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::FooStruct>( handle );
}
_baseRef
smoke_Extensions_FooStruct_create_optional_handle(_baseRef fooField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::FooStruct>( ::smoke::FooStruct( ) );
    (*_struct)->foo_field = Conversion<::std::string>::toCpp( fooField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Extensions_FooStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::FooStruct>*>( handle ) );
}
void smoke_Extensions_FooStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::FooStruct>*>( handle );
}
_baseRef smoke_Extensions_FooStruct_fooField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::FooStruct>(handle);
    return Conversion<::std::string>::toBaseRef(struct_pointer->foo_field);
}
