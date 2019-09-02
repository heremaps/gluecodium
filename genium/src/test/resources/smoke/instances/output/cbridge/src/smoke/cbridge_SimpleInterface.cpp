//
//

#include "cbridge/include/smoke/cbridge_SimpleInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "genium/Optional.h"
#include "genium/TypeRepository.h"
#include "smoke/SimpleInterface.h"
#include <memory>
#include <new>
#include <string>
void smoke_SimpleInterface_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::SimpleInterface>>(handle);
}
_baseRef smoke_SimpleInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::SimpleInterface>>(handle)))
        : 0;
}
extern "C" {
extern void* _CBridgeInitsmoke_SimpleInterface(_baseRef handle);
}
namespace {
struct smoke_SimpleInterfaceRegisterInit {
    smoke_SimpleInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_SimpleInterface", &_CBridgeInitsmoke_SimpleInterface);
    }
} s_smoke_SimpleInterface_register_init;
}
void* smoke_SimpleInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::genium::get_type_repository(static_cast<std::shared_ptr<::smoke::SimpleInterface>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::SimpleInterface>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_SimpleInterface(handle);
}
_baseRef smoke_SimpleInterface_getStringValue(_baseRef _instance) {
    return Conversion<std::string>::toBaseRef(get_pointer<std::shared_ptr<::smoke::SimpleInterface>>(_instance)->get()->get_string_value())
;
}
class smoke_SimpleInterfaceProxy : public std::shared_ptr<::smoke::SimpleInterface>::element_type, public CachedProxyBase<smoke_SimpleInterfaceProxy> {
public:
    smoke_SimpleInterfaceProxy(smoke_SimpleInterface_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_SimpleInterfaceProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    ::std::string get_string_value() override {
        auto _call_result = mFunctions.smoke_SimpleInterface_getStringValue(mFunctions.swift_pointer);
        return Conversion<std::string>::toCppReturn(_call_result);
    }
private:
    smoke_SimpleInterface_FunctionTable mFunctions;
};
_baseRef smoke_SimpleInterface_create_proxy(smoke_SimpleInterface_FunctionTable functionTable) {
    auto proxy = smoke_SimpleInterfaceProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new std::shared_ptr<::smoke::SimpleInterface>(std::move(proxy))) : 0;
}
const void* smoke_SimpleInterface_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_SimpleInterfaceProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::SimpleInterface>>(handle)->get()) : nullptr;
}