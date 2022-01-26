//
//
#include "cbridge/include/smoke/cbridge_NoCacheInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/NoCacheInterface.h"
#include <memory>
#include <new>
void smoke_NoCacheInterface_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::NoCacheInterface >>(handle);
}
_baseRef smoke_NoCacheInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::NoCacheInterface >>(handle)))
        : 0;
}
extern "C" {
extern void* _CBridgeInitsmoke_NoCacheInterface(_baseRef handle);
}
namespace {
struct smoke_NoCacheInterfaceRegisterInit {
    smoke_NoCacheInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_NoCacheInterface", &_CBridgeInitsmoke_NoCacheInterface);
    }
} s_smoke_NoCacheInterface_register_init;
}
void* smoke_NoCacheInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository().get_id(get_pointer<::std::shared_ptr< ::smoke::NoCacheInterface >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_NoCacheInterface(handle);
}
void smoke_NoCacheInterface_foo(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::NoCacheInterface >>(_instance)->get()->foo();
}
class smoke_NoCacheInterfaceProxy : public ::smoke::NoCacheInterface, public CachedProxyBase<smoke_NoCacheInterfaceProxy> {
public:
    smoke_NoCacheInterfaceProxy(smoke_NoCacheInterface_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_NoCacheInterfaceProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_NoCacheInterfaceProxy(const smoke_NoCacheInterfaceProxy&) = delete;
    smoke_NoCacheInterfaceProxy& operator=(const smoke_NoCacheInterfaceProxy&) = delete;
    void foo() override {
        mFunctions.smoke_NoCacheInterface_foo(mFunctions.swift_pointer);
    }
private:
    smoke_NoCacheInterface_FunctionTable mFunctions;
};
_baseRef smoke_NoCacheInterface_create_proxy(smoke_NoCacheInterface_FunctionTable functionTable) {
    auto proxy = smoke_NoCacheInterfaceProxy::get_proxy_no_cache(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::NoCacheInterface >(proxy)) : 0;
}
