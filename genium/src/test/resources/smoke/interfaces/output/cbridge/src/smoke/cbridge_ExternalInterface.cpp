//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_ExternalInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "foo/Bar.h"
#include <memory>
#include <new>
#include <string>
void smoke_ExternalInterface_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(handle);
}
_baseRef smoke_ExternalInterface_SomeStruct_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::ExternalInterface::some_Struct() );
}
void smoke_ExternalInterface_SomeStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::ExternalInterface::some_Struct>(handle);
}
_baseRef smoke_ExternalInterface_SomeStruct_someField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::ExternalInterface::some_Struct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->some_Field) );
}
void smoke_ExternalInterface_SomeStruct_someField_set(_baseRef handle, const char* someField) {
    get_pointer<::smoke::ExternalInterface::some_Struct>(handle)->some_Field = someField;
}
void smoke_ExternalInterface_someMethod(_baseRef _instance, int8_t some_Parameter) {
    return get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(_instance)->get()->some_Method(some_Parameter);
}
_baseRef smoke_ExternalInterface_someAttribute_get(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new std::string(get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(_instance)->get()->get_Me()) );
}
