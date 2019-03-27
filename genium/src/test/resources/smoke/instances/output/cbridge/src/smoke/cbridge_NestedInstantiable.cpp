//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "Optional.h"
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
    return get_pointer<std::shared_ptr<::smoke::NestedInstantiable>>(_instance)->get()->set_same_type_instances(Conversion<std::shared_ptr<::smoke::SimpleInstantiable>>::toCpp(instanceOne), Conversion<std::shared_ptr<::smoke::SimpleInstantiable>>::toCpp(instanceTwo))
;
}
_baseRef smoke_NestedInstantiable_getInstanceOne(_baseRef _instance) {
    return Conversion<std::shared_ptr<::smoke::SimpleInstantiable>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::NestedInstantiable>>(_instance)->get()->get_instance_one())
;
}