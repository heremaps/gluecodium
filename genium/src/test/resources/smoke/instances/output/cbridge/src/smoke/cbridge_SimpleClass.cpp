//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_SimpleClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "genium/Optional.h"
#include "genium/TypeRepository.h"
#include "smoke/SimpleClass.h"
#include <memory>
#include <new>
#include <string>
void smoke_SimpleClass_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::SimpleClass>>(handle);
}
_baseRef smoke_SimpleClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::SimpleClass>>(handle)))
        : 0;
}
extern "C" {
extern void* _CBridgeInitsmoke_SimpleClass(_baseRef handle);
}
namespace {
struct smoke_SimpleClassRegisterInit {
    smoke_SimpleClassRegisterInit() {
        get_init_repository().add_init("smoke_SimpleClass", &_CBridgeInitsmoke_SimpleClass);
    }
} s_smoke_SimpleClass_register_init;
}
void* smoke_SimpleClass_get_typed(_baseRef handle) {
    const auto& real_type_id = ::genium::get_type_repository(static_cast<std::shared_ptr<::smoke::SimpleClass>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::SimpleClass>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_SimpleClass(handle);
}
_baseRef smoke_SimpleClass_getStringValue(_baseRef _instance) {
    return Conversion<std::string>::toBaseRef(get_pointer<std::shared_ptr<::smoke::SimpleClass>>(_instance)->get()->get_string_value())
;
}