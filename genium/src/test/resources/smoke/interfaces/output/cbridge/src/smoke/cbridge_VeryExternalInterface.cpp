//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_VeryExternalInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "foo/Bar.h"
#include "genium/Optional.h"
#include <memory>
#include <new>
#include <string>
void smoke_VeryExternalInterface_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::fire::Baz>>(handle);
}
_baseRef smoke_VeryExternalInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::fire::Baz>>(handle)))
        : 0;
}
_baseRef
smoke_VeryExternalInterface_SomeStruct_create_handle( _baseRef someField )
{
    ::fire::Baz::some_Struct* _struct = new ( std::nothrow ) ::fire::Baz::some_Struct();
    _struct->some_Field = Conversion<std::string>::toCpp( someField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_VeryExternalInterface_SomeStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::fire::Baz::some_Struct>( handle );
}
_baseRef
smoke_VeryExternalInterface_SomeStruct_create_optional_handle(_baseRef someField)
{
    auto _struct = new ( std::nothrow ) ::genium::optional<::fire::Baz::some_Struct>( ::fire::Baz::some_Struct( ) );
    (*_struct)->some_Field = Conversion<std::string>::toCpp( someField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_VeryExternalInterface_SomeStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::fire::Baz::some_Struct>*>( handle ) );
}
void smoke_VeryExternalInterface_SomeStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::fire::Baz::some_Struct>*>( handle );
}
_baseRef smoke_VeryExternalInterface_SomeStruct_someField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::fire::Baz::some_Struct>(handle);
return Conversion<std::string>::toBaseRef(struct_pointer->some_Field);
}
void smoke_VeryExternalInterface_someMethod(_baseRef _instance, int8_t someParameter) {
    return get_pointer<std::shared_ptr<::fire::Baz>>(_instance)->get()->some_Method(someParameter)
;
}
_baseRef smoke_VeryExternalInterface_someAttribute_get(_baseRef _instance) {
    return Conversion<std::string>::toBaseRef(get_pointer<std::shared_ptr<::fire::Baz>>(_instance)->get()->get_Me())
;
}
void smoke_VeryExternalInterface_someAttribute_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::fire::Baz>>(_instance)->get()->set_Me(Conversion<std::string>::toCpp(newValue))
;
}
