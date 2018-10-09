//
//
// Automatically generated. Do not modify. Your changes will be lost.

#include "cbridge/include/smoke/cbridge_NestedInstantiableTwo.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/NestedInstantiableOne.h"
#include "smoke/NestedInstantiableTwo.h"
#include "smoke/SimpleInstantiableOne.h"
#include "smoke/SimpleInstantiableTwo.h"
#include <memory>
#include <new>

void smoke_NestedInstantiableTwo_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::NestedInstantiableTwo>>(handle);
}
void smoke_NestedInstantiableTwo_setMultipleTypeInstances(_baseRef _instance, _baseRef instanceOne, _baseRef instanceTwo, _baseRef nestedInstantiable) {
    return get_pointer<std::shared_ptr<::smoke::NestedInstantiableTwo>>(_instance)->get()->set_multiple_type_instances(*get_pointer<std::shared_ptr<::smoke::SimpleInstantiableOne>>(instanceOne), *get_pointer<std::shared_ptr<::smoke::SimpleInstantiableTwo>>(instanceTwo), *get_pointer<std::shared_ptr<::smoke::NestedInstantiableOne>>(nestedInstantiable));
}
_baseRef smoke_NestedInstantiableTwo_getInstantiableOne(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( checked_pointer_copy(get_pointer<std::shared_ptr<::smoke::NestedInstantiableTwo>>(_instance)->get()->get_instantiable_one()) );
}
_baseRef smoke_NestedInstantiableTwo_getInstantiableTwo(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( checked_pointer_copy(get_pointer<std::shared_ptr<::smoke::NestedInstantiableTwo>>(_instance)->get()->get_instantiable_two()) );
}
_baseRef smoke_NestedInstantiableTwo_getNestedInstantiable(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( checked_pointer_copy(get_pointer<std::shared_ptr<::smoke::NestedInstantiableTwo>>(_instance)->get()->get_nested_instantiable()) );
}
void smoke_NestedInstantiableTwo_setSelfInstantiable(_baseRef _instance, _baseRef selfInstance) {
    return get_pointer<std::shared_ptr<::smoke::NestedInstantiableTwo>>(_instance)->get()->set_self_instantiable(*get_pointer<std::shared_ptr<::smoke::NestedInstantiableTwo>>(selfInstance));
}
_baseRef smoke_NestedInstantiableTwo_getSelfInstantiable(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( checked_pointer_copy(get_pointer<std::shared_ptr<::smoke::NestedInstantiableTwo>>(_instance)->get()->get_self_instantiable()) );
}
