//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/root/space/smoke/cbridge_BasicTypes.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "root/space/smoke/BasicTypes.h"
#include <memory>
#include <new>
#include <string>
_baseRef smoke_BasicTypes_SomeStruct_create() {
    return reinterpret_cast<_baseRef>( new ::root::space::smoke::SomeStruct() );
}
void smoke_BasicTypes_SomeStruct_release(_baseRef handle) {
    delete get_pointer<::root::space::smoke::SomeStruct>(handle);
}
_baseRef smoke_BasicTypes_SomeStruct_someField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::root::space::smoke::SomeStruct>(handle);
    return reinterpret_cast<_baseRef>( new std::string(struct_pointer->some_field) );
}
void smoke_BasicTypes_SomeStruct_someField_set(_baseRef handle, const char* someField) {
    get_pointer<::root::space::smoke::SomeStruct>(handle)->some_field = someField;
}
