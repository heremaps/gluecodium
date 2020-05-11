//
//
#include "cbridge/include/smoke/cbridge_ChildClassFromClass.h"
#include "cbridge/include/smoke/cbridge_ParentClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
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
const void* smoke_ChildClassFromClass_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<std::shared_ptr<::smoke::ChildClassFromClass>>(handle)->get())
        : nullptr;
}
void smoke_ChildClassFromClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<std::shared_ptr<::smoke::ChildClassFromClass>>(handle)->get(), swift_pointer);
}
void smoke_ChildClassFromClass_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<std::shared_ptr<::smoke::ChildClassFromClass>>(handle)->get());
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
    const auto& real_type_id = ::gluecodium::get_type_repository(static_cast<std::shared_ptr<::smoke::ChildClassFromClass>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::ChildClassFromClass>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_ChildClassFromClass(handle);
}
void smoke_ChildClassFromClass_childClassMethod(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::smoke::ChildClassFromClass>>(_instance)->get()->child_class_method();
}
