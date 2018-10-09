//
//
// Automatically generated. Do not modify. Your changes will be lost.

#include "cbridge/include/smoke/cbridge_SimpleInstantiableTwo.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/SimpleInstantiableTwo.h"
#include <memory>
#include <new>
#include <string>

void smoke_SimpleInstantiableTwo_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::SimpleInstantiableTwo>>(handle);
}
void smoke_SimpleInstantiableTwo_setStringValue(_baseRef _instance, const char* stringValue) {
    return get_pointer<std::shared_ptr<::smoke::SimpleInstantiableTwo>>(_instance)->get()->set_string_value(std::string(stringValue));
}
_baseRef smoke_SimpleInstantiableTwo_getStringValue(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new std::string(get_pointer<std::shared_ptr<::smoke::SimpleInstantiableTwo>>(_instance)->get()->get_string_value()) );
}
