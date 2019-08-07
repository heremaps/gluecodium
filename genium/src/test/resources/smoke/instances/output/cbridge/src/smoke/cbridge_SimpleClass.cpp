//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_SimpleClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "genium/Optional.h"
#include "smoke/SimpleClass.h"
#include <memory>
#include <new>
#include <string>
void smoke_SimpleClass_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::SimpleClass>>(handle);
}
_baseRef smoke_SimpleClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::SimpleClass>>(handle)))
        : 0;
}
_baseRef smoke_SimpleClass_getStringValue(_baseRef _instance) {
    return Conversion<std::string>::toBaseRef(get_pointer<std::shared_ptr<::smoke::SimpleClass>>(_instance)->get()->get_string_value())
;
}
