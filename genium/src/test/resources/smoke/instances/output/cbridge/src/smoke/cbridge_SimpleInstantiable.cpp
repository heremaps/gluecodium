//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_SimpleInstantiable.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/SimpleInstantiable.h"
#include <memory>
#include <new>
#include <string>
void smoke_SimpleInstantiable_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::SimpleInstantiable>>(handle);
}
_baseRef smoke_SimpleInstantiable_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::SimpleInstantiable>>(handle)))
        : 0;
}
void smoke_SimpleInstantiable_setStringValue(_baseRef _instance, _baseRef stringValue) {
    return get_pointer<std::shared_ptr<::smoke::SimpleInstantiable>>(_instance)->get()->set_string_value(*get_pointer<std::string>(stringValue));
}
_baseRef smoke_SimpleInstantiable_getStringValue(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new std::string(get_pointer<std::shared_ptr<::smoke::SimpleInstantiable>>(_instance)->get()->get_string_value()) );
}