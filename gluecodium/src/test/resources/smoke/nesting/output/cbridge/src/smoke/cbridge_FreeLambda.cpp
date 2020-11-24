//
//
#include "cbridge/include/smoke/cbridge_FreeLambda.h"
#include "cbridge/include/DateHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TimePointHash.h"
#include "smoke/FreeEnum.h"
#include "smoke/FreeLambda.h"
#include <chrono>
#include <functional>
#include <new>
void smoke_FreeLambda_release_handle(_baseRef handle) {
    delete get_pointer<::smoke::FreeLambda>(handle);
}
_baseRef smoke_FreeLambda_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::smoke::FreeLambda>(handle)))
        : 0;
}
smoke_FreeEnum smoke_FreeLambda_call(_baseRef _instance, double p0) {
    return static_cast<smoke_FreeEnum>(get_pointer<::smoke::FreeLambda>(_instance)->operator()(Conversion<::std::chrono::system_clock::time_point>::toCpp(p0)));
}
class smoke_FreeLambdaProxy : public CachedProxyBase<smoke_FreeLambdaProxy> {
public:
    smoke_FreeLambdaProxy(smoke_FreeLambda_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_FreeLambdaProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_FreeLambdaProxy(const smoke_FreeLambdaProxy&) = delete;
    smoke_FreeLambdaProxy& operator=(const smoke_FreeLambdaProxy&) = delete;
    ::smoke::FreeEnum operator()(const ::std::chrono::system_clock::time_point& p0) {
        auto _call_result = mFunctions.smoke_FreeLambda_call(mFunctions.swift_pointer, Conversion<::std::chrono::system_clock::time_point>::toBaseRef(p0));
        return static_cast<::smoke::FreeEnum>(_call_result);
    }
private:
    smoke_FreeLambda_FunctionTable mFunctions;
};
_baseRef smoke_FreeLambda_create_proxy(smoke_FreeLambda_FunctionTable functionTable) {
    auto proxy = smoke_FreeLambdaProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::smoke::FreeLambda(::std::bind(&smoke_FreeLambdaProxy::operator(), proxy, ::std::placeholders::_1))) : 0;
}
_baseRef smoke_FreeLambda_create_optional_proxy(smoke_FreeLambda_FunctionTable functionTable) {
    auto proxy = smoke_FreeLambdaProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new (::std::nothrow) ::gluecodium::optional<::smoke::FreeLambda>(::std::bind(&smoke_FreeLambdaProxy::operator(), proxy, ::std::placeholders::_1))) : 0;
}
const void* smoke_FreeLambda_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_FreeLambdaProxy::get_swift_object(get_pointer<::smoke::FreeLambda>(handle)) : nullptr;
}
