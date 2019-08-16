//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_PointerEquatableInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "genium/Optional.h"
#include "genium/TypeRepository.h"
#include "smoke/PointerEquatableInterface.h"
#include <memory>
#include <new>
void smoke_PointerEquatableInterface_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::PointerEquatableInterface>>(handle);
}
_baseRef smoke_PointerEquatableInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::PointerEquatableInterface>>(handle)))
        : 0;
}
extern "C" {
extern void* _CBridgeInitsmoke_PointerEquatableInterface(_baseRef handle);
}
namespace {
struct smoke_PointerEquatableInterfaceRegisterInit {
    smoke_PointerEquatableInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_PointerEquatableInterface", &_CBridgeInitsmoke_PointerEquatableInterface);
    }
} s_smoke_PointerEquatableInterface_register_init;
}
void* smoke_PointerEquatableInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::genium::get_type_repository(static_cast<std::shared_ptr<::smoke::PointerEquatableInterface>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::PointerEquatableInterface>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_PointerEquatableInterface(handle);
}
bool smoke_PointerEquatableInterface_equal(_baseRef lhs, _baseRef rhs) {
    return *get_pointer<std::shared_ptr<::smoke::PointerEquatableInterface>>(lhs) == *get_pointer<std::shared_ptr<::smoke::PointerEquatableInterface>>(rhs);
}
uint64_t smoke_PointerEquatableInterface_hash(_baseRef handle) {
    return ::genium::hash<std::shared_ptr<::smoke::PointerEquatableInterface>>()(*get_pointer<std::shared_ptr<::smoke::PointerEquatableInterface>>(handle));
}