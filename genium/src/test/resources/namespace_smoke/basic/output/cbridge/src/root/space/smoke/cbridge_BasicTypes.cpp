//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/root/space/smoke/cbridge_BasicTypes.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "root/space/smoke/BasicTypes.h"
#include <memory>
#include <new>
#include <string>
_baseRef smoke_BasicTypes_SomeStruct_create_handle(_baseRef someField) {
    ::root::space::smoke::SomeStruct* _struct = new ::root::space::smoke::SomeStruct();
    _struct->some_field = *get_pointer<std::string>(someField);
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_BasicTypes_SomeStruct_release_handle(_baseRef handle) {
    delete get_pointer<::root::space::smoke::SomeStruct>(handle);
}
_baseRef smoke_BasicTypes_SomeStruct_someField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::root::space::smoke::SomeStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->some_field) );
}