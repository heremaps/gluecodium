//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_Errors.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "foo/Bar.h"
#include "genium/Optional.h"
#include "genium/TypeRepository.h"
#include "smoke/Errors.h"
#include <memory>
#include <new>
#include <string>
void smoke_Errors_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::Errors>>(handle);
}
_baseRef smoke_Errors_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::Errors>>(handle)))
        : 0;
}
extern "C" {
extern void* _CBridgeInitsmoke_Errors(_baseRef handle);
}
namespace {
struct smoke_ErrorsRegisterInit {
    smoke_ErrorsRegisterInit() {
        get_init_repository().add_init("smoke_Errors", &_CBridgeInitsmoke_Errors);
    }
} s_smoke_Errors_register_init;
}
void* smoke_Errors_get_typed(_baseRef handle) {
    const auto& real_type_id = ::genium::get_type_repository(static_cast<std::shared_ptr<::smoke::Errors>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::Errors>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_Errors(handle);
}
smoke_Errors_InternalError smoke_Errors_methodWithErrors() {
    return ::smoke::Errors::method_with_errors().value();
}
smoke_Errors_ExternalErrors smoke_Errors_methodWithExternalErrors() {
    return ::smoke::Errors::method_with_external_errors().value();
}
smoke_Errors_methodWithErrorsAndReturnValue_result smoke_Errors_methodWithErrorsAndReturnValue() {
    auto&& RESULT = ::smoke::Errors::method_with_errors_and_return_value();
    if (RESULT.has_value()) {
        return {true, .returned_value = Conversion<std::string>::toBaseRef(RESULT.unsafe_value())
};
    } else {
        return {false, .error_code = static_cast< smoke_Errors_InternalError >(RESULT.error().value())};
    }
}
smoke_Errors_InternalError smoke_Errors_methodWithAliasedError() {
    return ::smoke::Errors::method_with_aliased_error().value();
}