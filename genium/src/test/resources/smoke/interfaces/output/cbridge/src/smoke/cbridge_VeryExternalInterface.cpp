//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_VeryExternalInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "foo/Bar.h"
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
_baseRef smoke_VeryExternalInterface_SomeStruct_create_handle(const char* someField) {
    ::fire::Baz::some_Struct* _struct = new ::fire::Baz::some_Struct();
    _struct->some_Field = someField;
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_VeryExternalInterface_SomeStruct_release_handle(_baseRef handle) {
    delete get_pointer<::fire::Baz::some_Struct>(handle);
}
_baseRef smoke_VeryExternalInterface_SomeStruct_someField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::fire::Baz::some_Struct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->some_Field) );
}
void smoke_VeryExternalInterface_someMethod(_baseRef _instance, int8_t some_Parameter) {
    return get_pointer<std::shared_ptr<::fire::Baz>>(_instance)->get()->some_Method(some_Parameter);
}
_baseRef smoke_VeryExternalInterface_someAttribute_get(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new std::string(get_pointer<std::shared_ptr<::fire::Baz>>(_instance)->get()->get_Me()) );
}
void smoke_VeryExternalInterface_someAttribute_set(_baseRef _instance, const char* newValue) {
    return get_pointer<std::shared_ptr<::fire::Baz>>(_instance)->get()->set_Me(std::string(newValue));
}
