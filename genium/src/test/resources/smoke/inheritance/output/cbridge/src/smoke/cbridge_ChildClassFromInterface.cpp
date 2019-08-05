//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_ChildClassFromInterface.h"
#include "cbridge/include/smoke/cbridge_ParentInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "genium/Optional.h"
#include "smoke/ChildClassFromInterface.h"
#include "smoke/ParentInterface.h"
#include <memory>
#include <new>
#include <string>
void smoke_ChildClassFromInterface_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::ChildClassFromInterface>>(handle);
}
_baseRef smoke_ChildClassFromInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::ChildClassFromInterface>>(handle)))
        : 0;
}
void smoke_ChildClassFromInterface_childClassMethod(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::smoke::ChildClassFromInterface>>(_instance)->get()->child_class_method()
;
}
