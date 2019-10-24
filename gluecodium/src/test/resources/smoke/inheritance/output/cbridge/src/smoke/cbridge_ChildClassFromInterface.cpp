//
//
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_ChildClassFromInterface.h"
#include "cbridge/include/smoke/cbridge_ParentInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
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
extern "C" {
extern void* _CBridgeInitsmoke_ChildClassFromInterface(_baseRef handle);
}
namespace {
struct smoke_ChildClassFromInterfaceRegisterInit {
    smoke_ChildClassFromInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_ChildClassFromInterface", &_CBridgeInitsmoke_ChildClassFromInterface);
    }
} s_smoke_ChildClassFromInterface_register_init;
}
void* smoke_ChildClassFromInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository(static_cast<std::shared_ptr<::smoke::ChildClassFromInterface>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::ChildClassFromInterface>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_ChildClassFromInterface(handle);
}
void smoke_ChildClassFromInterface_childClassMethod(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::smoke::ChildClassFromInterface>>(_instance)->get()->child_class_method();
}
