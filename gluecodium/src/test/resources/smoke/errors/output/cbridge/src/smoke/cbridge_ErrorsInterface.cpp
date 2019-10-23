//
//
#include "cbridge/include/smoke/cbridge_ErrorsInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/ErrorsInterface.h"
#include "smoke/Payload.h"
#include <memory>
#include <new>
#include <string>
void smoke_ErrorsInterface_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::ErrorsInterface>>(handle);
}
_baseRef smoke_ErrorsInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::ErrorsInterface>>(handle)))
        : 0;
}
extern "C" {
extern void* _CBridgeInitsmoke_ErrorsInterface(_baseRef handle);
}
namespace {
struct smoke_ErrorsInterfaceRegisterInit {
    smoke_ErrorsInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_ErrorsInterface", &_CBridgeInitsmoke_ErrorsInterface);
    }
} s_smoke_ErrorsInterface_register_init;
}
void* smoke_ErrorsInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository(static_cast<std::shared_ptr<::smoke::ErrorsInterface>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::ErrorsInterface>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_ErrorsInterface(handle);
}
smoke_ErrorsInterface_methodWithErrors_result smoke_ErrorsInterface_methodWithErrors(_baseRef _instance) {
    auto&& ERROR_VALUE = get_pointer<std::shared_ptr<::smoke::ErrorsInterface>>(_instance)->get()->method_with_errors().value();
    return {ERROR_VALUE == 0, static_cast< smoke_ErrorsInterface_InternalError >(ERROR_VALUE)};
}
smoke_ErrorsInterface_methodWithExternalErrors_result smoke_ErrorsInterface_methodWithExternalErrors(_baseRef _instance) {
    auto&& ERROR_VALUE = get_pointer<std::shared_ptr<::smoke::ErrorsInterface>>(_instance)->get()->method_with_external_errors().value();
    return {ERROR_VALUE == 0, static_cast< smoke_ErrorsInterface_ExternalErrors >(ERROR_VALUE)};
}
smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result smoke_ErrorsInterface_methodWithErrorsAndReturnValue(_baseRef _instance) {
    auto&& RESULT = get_pointer<std::shared_ptr<::smoke::ErrorsInterface>>(_instance)->get()->method_with_errors_and_return_value();
    if (RESULT.has_value()) {
        return {true, .returned_value = Conversion<std::string>::toBaseRef(RESULT.unsafe_value())};
    } else {
        return {false, .error_value = static_cast< smoke_ErrorsInterface_InternalError >(RESULT.error().value())};
    }
}
smoke_ErrorsInterface_methodWithPayloadError_result smoke_ErrorsInterface_methodWithPayloadError() {
    auto&& RESULT = ::smoke::ErrorsInterface::method_with_payload_error();
    if (RESULT.has_value()) {
        return {true, 0};
    } else {
        return {false, .error_value = Conversion<::smoke::Payload>::toBaseRef(RESULT.error())};
    }
}
smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_result smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue() {
    auto&& RESULT = ::smoke::ErrorsInterface::method_with_payload_error_and_return_value();
    if (RESULT.has_value()) {
        return {true, .returned_value = Conversion<std::string>::toBaseRef(RESULT.unsafe_value())};
    } else {
        return {false, .error_value = Conversion<::smoke::Payload>::toBaseRef(RESULT.error())};
    }
}
class smoke_ErrorsInterfaceProxy : public std::shared_ptr<::smoke::ErrorsInterface>::element_type, public CachedProxyBase<smoke_ErrorsInterfaceProxy> {
public:
    smoke_ErrorsInterfaceProxy(smoke_ErrorsInterface_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_ErrorsInterfaceProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    ::std::error_code method_with_errors() override {
        auto _result_with_error = mFunctions.smoke_ErrorsInterface_methodWithErrors(mFunctions.swift_pointer);
        if (!_result_with_error.has_value)
        {
            return std::error_code{static_cast<::smoke::ErrorsInterface::InternalError>(_result_with_error.error_value)};
        }
        return {};
    }
    ::std::error_code method_with_external_errors() override {
        auto _result_with_error = mFunctions.smoke_ErrorsInterface_methodWithExternalErrors(mFunctions.swift_pointer);
        if (!_result_with_error.has_value)
        {
            return std::error_code{static_cast<::smoke::ErrorsInterface::ExternalErrors>(_result_with_error.error_value)};
        }
        return {};
    }
    ::gluecodium::Return< ::std::string, ::std::error_code > method_with_errors_and_return_value() override {
        auto _result_with_error = mFunctions.smoke_ErrorsInterface_methodWithErrorsAndReturnValue(mFunctions.swift_pointer);
        if (!_result_with_error.has_value)
        {
            return std::error_code{static_cast<::smoke::ErrorsInterface::InternalError>(_result_with_error.error_value)};
        }
        auto _call_result = _result_with_error.returned_value;
        return Conversion<std::string>::toCppReturn(_call_result);
    }
private:
    smoke_ErrorsInterface_FunctionTable mFunctions;
};
_baseRef smoke_ErrorsInterface_create_proxy(smoke_ErrorsInterface_FunctionTable functionTable) {
    auto proxy = smoke_ErrorsInterfaceProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new std::shared_ptr<::smoke::ErrorsInterface>(proxy)) : 0;
}
const void* smoke_ErrorsInterface_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_ErrorsInterfaceProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::ErrorsInterface>>(handle)->get()) : nullptr;
}
