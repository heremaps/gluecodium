//
//
#include "cbridge/include/smoke/cbridge_Errors.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "foo/Bar.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/Errors.h"
#include "smoke/Payload.h"
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
smoke_Errors_methodWithErrors_result smoke_Errors_methodWithErrors() {
    auto&& ERROR_VALUE = ::smoke::Errors::method_with_errors().value();
    return {ERROR_VALUE == 0, static_cast< smoke_Errors_InternalErrorCode >(ERROR_VALUE)};
}
smoke_Errors_methodWithExternalErrors_result smoke_Errors_methodWithExternalErrors() {
    auto&& ERROR_VALUE = ::smoke::Errors::method_with_external_errors().value();
    return {ERROR_VALUE == 0, static_cast< smoke_Errors_ExternalErrors >(ERROR_VALUE)};
}
smoke_Errors_methodWithErrorsAndReturnValue_result smoke_Errors_methodWithErrorsAndReturnValue() {
    auto&& RESULT = ::smoke::Errors::method_with_errors_and_return_value();
    if (RESULT.has_value()) {
        return {true, .returned_value = Conversion<std::string>::toBaseRef(RESULT.unsafe_value())};
    } else {
        return {false, .error_value = static_cast< smoke_Errors_InternalErrorCode >(RESULT.error().value())};
    }
}
smoke_Errors_methodWithPayloadError_result smoke_Errors_methodWithPayloadError() {
    auto&& RESULT = ::smoke::Errors::method_with_payload_error();
    if (RESULT.has_value()) {
        return {true, 0};
    } else {
        return {false, .error_value = Conversion<::smoke::Payload>::toBaseRef(RESULT.error())};
    }
}
smoke_Errors_methodWithPayloadErrorAndReturnValue_result smoke_Errors_methodWithPayloadErrorAndReturnValue() {
    auto&& RESULT = ::smoke::Errors::method_with_payload_error_and_return_value();
    if (RESULT.has_value()) {
        return {true, .returned_value = Conversion<std::string>::toBaseRef(RESULT.unsafe_value())};
    } else {
        return {false, .error_value = Conversion<::smoke::Payload>::toBaseRef(RESULT.error())};
    }
}
