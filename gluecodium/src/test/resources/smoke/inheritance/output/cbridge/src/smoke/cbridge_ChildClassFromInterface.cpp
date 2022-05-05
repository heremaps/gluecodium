//
//
#include "cbridge/include/smoke/cbridge_ChildClassFromInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/ChildClassFromInterface.h"
#include <memory>
#include <new>
void smoke_ChildClassFromInterface_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::ChildClassFromInterface >>(handle);
}
_baseRef smoke_ChildClassFromInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::ChildClassFromInterface >>(handle)))
        : 0;
}
const void* smoke_ChildClassFromInterface_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::ChildClassFromInterface >>(handle)->get())
        : nullptr;
}
void smoke_ChildClassFromInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::ChildClassFromInterface >>(handle)->get(), swift_pointer);
}
void smoke_ChildClassFromInterface_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::ChildClassFromInterface >>(handle)->get());
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
    const auto& real_type_id = ::gluecodium::get_type_repository().get_id(get_pointer<::std::shared_ptr< ::smoke::ChildClassFromInterface >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_ChildClassFromInterface(handle);
}
void smoke_ChildClassFromInterface_childClassMethod(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::ChildClassFromInterface >>(_instance)->get()->child_class_method();
}
void smoke_ChildClassFromInterface_rootMethod(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::ChildClassFromInterface >>(_instance)->get()->root_method();
}
_baseRef smoke_ChildClassFromInterface_rootProperty_get(_baseRef _instance) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ChildClassFromInterface >>(_instance)->get()->get_root_property());
}
void smoke_ChildClassFromInterface_rootProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::ChildClassFromInterface >>(_instance)->get()->set_root_property(Conversion<::std::string>::toCpp(value));
}
