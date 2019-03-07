//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/root/space/smoke/cbridge_BasicTypes.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "root/space/smoke/BasicTypes.h"
#include <memory>
#include <new>
#include <string>
_baseRef
smoke_BasicTypes_SomeStruct_create_handle( _baseRef someField )
{
    ::root::space::smoke::SomeStruct* _struct = new ( std::nothrow ) ::root::space::smoke::SomeStruct();
    _struct->some_field = Conversion<std::string>::toCpp( someField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_BasicTypes_SomeStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::root::space::smoke::SomeStruct>( handle );
}
_baseRef
smoke_BasicTypes_SomeStruct_make_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<::root::space::smoke::SomeStruct>( reinterpret_cast<::root::space::smoke::SomeStruct*>( handle ) ) );
}
_baseRef
smoke_BasicTypes_SomeStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<::root::space::smoke::SomeStruct>*>( handle )->get( ) );
}
void smoke_BasicTypes_SomeStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<::root::space::smoke::SomeStruct>*>( handle );
}
_baseRef smoke_BasicTypes_SomeStruct_someField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::root::space::smoke::SomeStruct>(handle);
return Conversion<std::string>::toBaseRef(struct_pointer->some_field);
}