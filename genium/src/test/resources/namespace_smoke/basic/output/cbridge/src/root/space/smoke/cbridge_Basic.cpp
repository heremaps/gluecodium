//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/root/space/smoke/cbridge_Basic.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "genium/Optional.h"
#include "genium/TypeRepository.h"
#include "root/space/smoke/Basic.h"
#include <memory>
#include <new>
#include <string>
void smoke_Basic_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::root::space::smoke::Basic>>(handle);
}
_baseRef smoke_Basic_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::root::space::smoke::Basic>>(handle)))
        : 0;
}
extern "C" {
extern void* _CBridgeInitsmoke_Basic(_baseRef handle);
}
namespace {
struct smoke_BasicRegisterInit {
    smoke_BasicRegisterInit() {
        get_init_repository().add_init("smoke_Basic", &_CBridgeInitsmoke_Basic);
    }
} s_smoke_Basic_register_init;
}
void* smoke_Basic_get_typed(_baseRef handle) {
    const auto& real_type_id = ::genium::get_type_repository(static_cast<std::shared_ptr<::root::space::smoke::Basic>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::root::space::smoke::Basic>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_Basic(handle);
}
_baseRef smoke_Basic_basicMethod(_baseRef inputString) {
    return Conversion<std::string>::toBaseRef(::root::space::smoke::Basic::basic_method(Conversion<std::string>::toCpp(inputString)))
;
}