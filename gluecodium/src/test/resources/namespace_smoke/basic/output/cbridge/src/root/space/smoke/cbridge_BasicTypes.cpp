//
//
#include "cbridge/include/root/space/smoke/cbridge_BasicTypes.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "root/space/smoke/BasicTypes.h"
#include <memory>
#include <new>
#include <string>
_baseRef
smoke_BasicTypes_SomeStruct_create_handle( _baseRef someField )
{
    ::root::space::smoke::SomeStruct* _struct = new ( ::std::nothrow ) ::root::space::smoke::SomeStruct();
    _struct->some_field = Conversion<::std::string>::toCpp( someField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_BasicTypes_SomeStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::root::space::smoke::SomeStruct>( handle );
}
_baseRef
smoke_BasicTypes_SomeStruct_create_optional_handle(_baseRef someField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::root::space::smoke::SomeStruct>( ::root::space::smoke::SomeStruct( ) );
    (*_struct)->some_field = Conversion<::std::string>::toCpp( someField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_BasicTypes_SomeStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::root::space::smoke::SomeStruct>*>( handle ) );
}
void smoke_BasicTypes_SomeStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::root::space::smoke::SomeStruct>*>( handle );
}
_baseRef smoke_BasicTypes_SomeStruct_someField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::root::space::smoke::SomeStruct>(handle);
    return Conversion<::std::string>::toBaseRef(struct_pointer->some_field);
}