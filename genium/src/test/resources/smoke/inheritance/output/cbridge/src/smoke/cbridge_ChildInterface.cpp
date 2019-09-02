//
//

#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_ChildInterface.h"
#include "cbridge/include/smoke/cbridge_ParentInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "genium/Optional.h"
#include "genium/TypeRepository.h"
#include "smoke/ChildInterface.h"
#include "smoke/ParentInterface.h"
#include <memory>
#include <new>
#include <string>
void smoke_ChildInterface_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::ChildInterface>>(handle);
}
_baseRef smoke_ChildInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::ChildInterface>>(handle)))
        : 0;
}
extern "C" {
extern void* _CBridgeInitsmoke_ChildInterface(_baseRef handle);
}
namespace {
struct smoke_ChildInterfaceRegisterInit {
    smoke_ChildInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_ChildInterface", &_CBridgeInitsmoke_ChildInterface);
    }
} s_smoke_ChildInterface_register_init;
}
void* smoke_ChildInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::genium::get_type_repository(static_cast<std::shared_ptr<::smoke::ChildInterface>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::ChildInterface>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_ChildInterface(handle);
}
void smoke_ChildInterface_childMethod(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::smoke::ChildInterface>>(_instance)->get()->child_method()
;
}
class smoke_ChildInterfaceProxy : public std::shared_ptr<::smoke::ChildInterface>::element_type, public CachedProxyBase<smoke_ChildInterfaceProxy> {
public:
    smoke_ChildInterfaceProxy(smoke_ChildInterface_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_ChildInterfaceProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    void root_method() override {
        mFunctions.smoke_ParentInterface_rootMethod(mFunctions.swift_pointer);    }
    ::std::string get_root_property() const override {
        auto _call_result = mFunctions.smoke_ParentInterface_rootProperty_get(mFunctions.swift_pointer);
        return Conversion<std::string>::toCppReturn(_call_result);
    }
    void set_root_property(const std::string& newValue) override {
        mFunctions.smoke_ParentInterface_rootProperty_set(mFunctions.swift_pointer, Conversion<std::string>::toBaseRef(newValue));    }
    void child_method() override {
        mFunctions.smoke_ChildInterface_childMethod(mFunctions.swift_pointer);    }
private:
    smoke_ChildInterface_FunctionTable mFunctions;
};
_baseRef smoke_ChildInterface_create_proxy(smoke_ChildInterface_FunctionTable functionTable) {
    auto proxy = smoke_ChildInterfaceProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new std::shared_ptr<::smoke::ChildInterface>(std::move(proxy))) : 0;
}
const void* smoke_ChildInterface_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_ChildInterfaceProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::ChildInterface>>(handle)->get()) : nullptr;
}