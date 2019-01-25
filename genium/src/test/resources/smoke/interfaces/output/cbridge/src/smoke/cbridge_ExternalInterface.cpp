//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_ExternalInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "foo/Bar.h"
#include <memory>
#include <new>
#include <string>
void smoke_ExternalInterface_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(handle);
}
_baseRef smoke_ExternalInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(handle)))
        : 0;
}
_baseRef smoke_ExternalInterface_SomeStruct_create_handle(_baseRef someField) {
    ::smoke::ExternalInterface::some_Struct* _struct = new ::smoke::ExternalInterface::some_Struct();
    _struct->some_Field = Conversion<std::string>::toCpp(someField);
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_ExternalInterface_SomeStruct_release_handle(_baseRef handle) {
    delete get_pointer<::smoke::ExternalInterface::some_Struct>(handle);
}
_baseRef smoke_ExternalInterface_SomeStruct_someField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::ExternalInterface::some_Struct>(handle);
return Conversion<std::string>::toBaseRef(struct_pointer->some_Field);
}
void smoke_ExternalInterface_someMethod(_baseRef _instance, int8_t some_Parameter) {
    return get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(_instance)->get()->some_Method(some_Parameter)
;
}
_baseRef smoke_ExternalInterface_someAttribute_get(_baseRef _instance) {
    return Conversion<std::string>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(_instance)->get()->get_Me())
;
}