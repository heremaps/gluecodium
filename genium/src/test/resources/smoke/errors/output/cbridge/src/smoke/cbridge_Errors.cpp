//
//
// Automatically generated. Do not modify. Your changes will be lost.

#include "cbridge/include/smoke/cbridge_Errors.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
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

smoke_Errors_InternalError smoke_Errors_methodWithErrors() {
    return ::smoke::Errors::method_with_errors().value();
}

smoke_Errors_ExternalErrors smoke_Errors_methodWithExternalErrors() {
    return ::smoke::Errors::method_with_external_errors().value();
}

smoke_Errors_methodWithErrorsAndReturnValue_result smoke_Errors_methodWithErrorsAndReturnValue() {
    auto&& RESULT = ::smoke::Errors::method_with_errors_and_return_value();
    if (RESULT.has_value()) {
        return {true, .returned_value = reinterpret_cast<_baseRef>( new std::string(RESULT.safe_value()) )};
    } else {
        return {false, .error_code = static_cast< smoke_Errors_InternalError >(RESULT.error().value())};
    }
}
