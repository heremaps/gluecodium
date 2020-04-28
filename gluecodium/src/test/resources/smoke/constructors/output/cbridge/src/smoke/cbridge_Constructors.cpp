//
//
#include "cbridge/include/smoke/cbridge_Constructors.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/Constructors.h"
#include <memory>
#include <new>
#include <string>
#include <vector>
void smoke_Constructors_release_handle(_baseRef handle) {
    auto ptr_ptr = get_pointer<std::shared_ptr<::smoke::Constructors>>(handle);
    auto& wrapper_cache = get_wrapper_cache();
    if (wrapper_cache_is_alive) {
        wrapper_cache.remove_cached_wrapper(ptr_ptr->get());
    }
    delete ptr_ptr;
}
_baseRef smoke_Constructors_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::Constructors>>(handle)))
        : 0;
}
const void* smoke_Constructors_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? get_wrapper_cache().get_cached_wrapper(get_pointer<std::shared_ptr<::smoke::Constructors>>(handle)->get())
        : nullptr;
}
void smoke_Constructors_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    get_wrapper_cache().cache_wrapper(get_pointer<std::shared_ptr<::smoke::Constructors>>(handle)->get(), swift_pointer);
}
extern "C" {
extern void* _CBridgeInitsmoke_Constructors(_baseRef handle);
}
namespace {
struct smoke_ConstructorsRegisterInit {
    smoke_ConstructorsRegisterInit() {
        get_init_repository().add_init("smoke_Constructors", &_CBridgeInitsmoke_Constructors);
    }
} s_smoke_Constructors_register_init;
}
void* smoke_Constructors_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository(static_cast<std::shared_ptr<::smoke::Constructors>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::Constructors>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_Constructors(handle);
}
_baseRef smoke_Constructors_create_() {
    return Conversion<std::shared_ptr<::smoke::Constructors>>::toBaseRef(::smoke::Constructors::create());
}
_baseRef smoke_Constructors_create_Constructors(_baseRef other) {
    return Conversion<std::shared_ptr<::smoke::Constructors>>::toBaseRef(::smoke::Constructors::create(Conversion<std::shared_ptr<::smoke::Constructors>>::toCpp(other)));
}
_baseRef smoke_Constructors_create_String_ULong(_baseRef foo, uint64_t bar) {
    return Conversion<std::shared_ptr<::smoke::Constructors>>::toBaseRef(::smoke::Constructors::create(Conversion<std::string>::toCpp(foo), bar));
}
smoke_Constructors_create_String_result smoke_Constructors_create_String(_baseRef input) {
    auto&& RESULT = ::smoke::Constructors::create(Conversion<std::string>::toCpp(input));
    if (RESULT.has_value()) {
        return {true, .returned_value = Conversion<std::shared_ptr<::smoke::Constructors>>::toBaseRef(RESULT.unsafe_value())};
    } else {
        return {false, .error_value = static_cast< smoke_Constructors_ErrorEnum >(RESULT.error().value())};
    }
}
_baseRef smoke_Constructors_create__3Double_4(_baseRef input) {
    return Conversion<std::shared_ptr<::smoke::Constructors>>::toBaseRef(::smoke::Constructors::create(Conversion<std::vector<double>>::toCpp(input)));
}
