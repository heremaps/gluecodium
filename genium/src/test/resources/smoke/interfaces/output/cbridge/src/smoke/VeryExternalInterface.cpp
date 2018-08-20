//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/VeryExternalInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "foo/Bar.h"
#include <memory>
#include <new>
#include <string>
void smoke_VeryExternalInterface_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::fire::Baz>>(handle);
}
_baseRef smoke_VeryExternalInterface_SomeStruct_create() {
    return reinterpret_cast<_baseRef>( new ::fire::Baz::some_Struct() );
}
void smoke_VeryExternalInterface_SomeStruct_release(_baseRef handle) {
    delete get_pointer<::fire::Baz::some_Struct>(handle);
}
_baseRef smoke_VeryExternalInterface_SomeStruct_someField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::fire::Baz::some_Struct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->some_Field) );
}
void smoke_VeryExternalInterface_SomeStruct_someField_set(_baseRef handle, const char* someField) {
    get_pointer<::fire::Baz::some_Struct>(handle)->some_Field = someField;
}
void smoke_VeryExternalInterface_someMethod(_baseRef _instance, int8_t some_Parameter) {
    return get_pointer<std::shared_ptr<::fire::Baz>>(_instance)->get()->some_Method(some_Parameter);
}
