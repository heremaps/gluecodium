//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_ErrorsInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "smoke/ErrorsInterface.h"
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
smoke_ErrorsInterface_InternalError smoke_ErrorsInterface_methodWithErrors(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::smoke::ErrorsInterface>>(_instance)->get()->method_with_errors().value();
}
smoke_ErrorsInterface_ExternalErrors smoke_ErrorsInterface_methodWithExternalErrors(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::smoke::ErrorsInterface>>(_instance)->get()->method_with_external_errors().value();
}
smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result smoke_ErrorsInterface_methodWithErrorsAndReturnValue(_baseRef _instance) {
    auto&& RESULT = get_pointer<std::shared_ptr<::smoke::ErrorsInterface>>(_instance)->get()->method_with_errors_and_return_value();
    if (RESULT.has_value()) {
        return {true, .returned_value = reinterpret_cast<_baseRef>( new std::string(RESULT.safe_value()) )};
    } else {
        return {false, .error_code = static_cast< smoke_ErrorsInterface_InternalError >(RESULT.error().value())};
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
        return static_cast<::smoke::ErrorsInterface::InternalError>(mFunctions.smoke_ErrorsInterface_methodWithErrors(mFunctions.swift_pointer));
    }
    ::std::error_code method_with_external_errors() override {
        return static_cast<::smoke::ErrorsInterface::ExternalErrors>(mFunctions.smoke_ErrorsInterface_methodWithExternalErrors(mFunctions.swift_pointer));
    }
    ::genium::Return< ::std::string, ::std::error_code > method_with_errors_and_return_value() override {
        auto _result_with_error = mFunctions.smoke_ErrorsInterface_methodWithErrorsAndReturnValue(mFunctions.swift_pointer);
        if (!_result_with_error.has_value)
        {
            return std::error_code{static_cast<::smoke::ErrorsInterface::InternalError>(_result_with_error.error_code)};
        }
        auto _call_result = _result_with_error.returned_value;
        auto _return_value_ptr = get_pointer<std::string>(_call_result);
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
private:
    smoke_ErrorsInterface_FunctionTable mFunctions;
};
_baseRef smoke_ErrorsInterface_create_proxy(smoke_ErrorsInterface_FunctionTable functionTable) {
    auto proxy = smoke_ErrorsInterfaceProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new std::shared_ptr<::smoke::ErrorsInterface>(std::move(proxy))) : 0;
}
const void* smoke_ErrorsInterface_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_ErrorsInterfaceProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::ErrorsInterface>>(handle)->get()) : nullptr;
}