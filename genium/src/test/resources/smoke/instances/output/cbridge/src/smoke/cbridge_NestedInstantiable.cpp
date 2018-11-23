//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_NestedInstantiable.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/NestedInstantiable.h"
#include "smoke/SimpleInstantiable.h"
#include <memory>
#include <new>
void smoke_NestedInstantiable_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::NestedInstantiable>>(handle);
}
_baseRef smoke_NestedInstantiable_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::NestedInstantiable>>(handle)))
        : 0;
}
void smoke_NestedInstantiable_setSameTypeInstances(_baseRef _instance, _baseRef instanceOne, _baseRef instanceTwo) {
    return get_pointer<std::shared_ptr<::smoke::NestedInstantiable>>(_instance)->get()->set_same_type_instances(instanceOne ? *get_pointer<std::shared_ptr<::smoke::SimpleInstantiable>>(instanceOne) : nullptr, instanceTwo ? *get_pointer<std::shared_ptr<::smoke::SimpleInstantiable>>(instanceTwo) : nullptr);
}
_baseRef smoke_NestedInstantiable_getInstanceOne(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( checked_pointer_copy(get_pointer<std::shared_ptr<::smoke::NestedInstantiable>>(_instance)->get()->get_instance_one()) );
}
_baseRef smoke_NestedInstantiable_instanceNotNullMethod(_baseRef _instance, _baseRef input) {
    return reinterpret_cast<_baseRef>( checked_pointer_copy(get_pointer<std::shared_ptr<::smoke::NestedInstantiable>>(_instance)->get()->instance_not_null_method(input ? *get_pointer<std::shared_ptr<::smoke::SimpleInstantiable>>(input) : nullptr)) );
}
