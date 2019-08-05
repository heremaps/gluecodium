//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_ChildClassFromClass.h"
#include "cbridge/include/smoke/cbridge_ParentClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "genium/Optional.h"
#include "smoke/ChildClassFromClass.h"
#include "smoke/ParentClass.h"
#include <memory>
#include <new>
void smoke_ChildClassFromClass_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::ChildClassFromClass>>(handle);
}
_baseRef smoke_ChildClassFromClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::ChildClassFromClass>>(handle)))
        : 0;
}
void smoke_ChildClassFromClass_childClassMethod(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::smoke::ChildClassFromClass>>(_instance)->get()->child_class_method()
;
}
