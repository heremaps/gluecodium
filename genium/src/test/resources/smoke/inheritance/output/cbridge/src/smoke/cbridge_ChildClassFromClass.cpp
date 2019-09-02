//
//

#include "cbridge/include/smoke/cbridge_ChildClassFromClass.h"
#include "cbridge/include/smoke/cbridge_ParentClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "genium/Optional.h"
#include "genium/TypeRepository.h"
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
extern "C" {
extern void* _CBridgeInitsmoke_ChildClassFromClass(_baseRef handle);
}
namespace {
struct smoke_ChildClassFromClassRegisterInit {
    smoke_ChildClassFromClassRegisterInit() {
        get_init_repository().add_init("smoke_ChildClassFromClass", &_CBridgeInitsmoke_ChildClassFromClass);
    }
} s_smoke_ChildClassFromClass_register_init;
}
void* smoke_ChildClassFromClass_get_typed(_baseRef handle) {
    const auto& real_type_id = ::genium::get_type_repository(static_cast<std::shared_ptr<::smoke::ChildClassFromClass>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::ChildClassFromClass>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_ChildClassFromClass(handle);
}
void smoke_ChildClassFromClass_childClassMethod(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::smoke::ChildClassFromClass>>(_instance)->get()->child_class_method()
;
}