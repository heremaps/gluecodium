//
//
#include "cbridge/include/smoke/cbridge_DurationInterface.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/DurationHash.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/DurationInterface.h"
#include <chrono>
#include <memory>
#include <new>
#include <string>
void smoke_DurationInterface_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::DurationInterface >>(handle);
}
_baseRef smoke_DurationInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::DurationInterface >>(handle)))
        : 0;
}
const void* smoke_DurationInterface_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::DurationInterface >>(handle)->get())
        : nullptr;
}
void smoke_DurationInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::DurationInterface >>(handle)->get(), swift_pointer);
}
void smoke_DurationInterface_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::DurationInterface >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_DurationInterface(_baseRef handle);
}
namespace {
struct smoke_DurationInterfaceRegisterInit {
    smoke_DurationInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_DurationInterface", &_CBridgeInitsmoke_DurationInterface);
    }
} s_smoke_DurationInterface_register_init;
}
void* smoke_DurationInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository().get_id(get_pointer<::std::shared_ptr< ::smoke::DurationInterface >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_DurationInterface(handle);
}
_baseRef smoke_DurationInterface_durationFunction(_baseRef _instance, double input) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::DurationInterface >>(_instance)->get()->duration_function(Conversion<::std::chrono::seconds>::toCpp(input)));
}
class smoke_DurationInterfaceProxy : public ::smoke::DurationInterface, public CachedProxyBase<smoke_DurationInterfaceProxy> {
public:
    smoke_DurationInterfaceProxy(smoke_DurationInterface_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_DurationInterfaceProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_DurationInterfaceProxy(const smoke_DurationInterfaceProxy&) = delete;
    smoke_DurationInterfaceProxy& operator=(const smoke_DurationInterfaceProxy&) = delete;
    ::std::string duration_function(const ::std::chrono::seconds input) override {
        auto _call_result = mFunctions.smoke_DurationInterface_durationFunction(mFunctions.swift_pointer, Conversion<::std::chrono::seconds>::toBaseRef(input));
        return Conversion<::std::string>::toCppReturn(_call_result);
    }
private:
    smoke_DurationInterface_FunctionTable mFunctions;
};
_baseRef smoke_DurationInterface_create_proxy(smoke_DurationInterface_FunctionTable functionTable) {
    auto proxy = smoke_DurationInterfaceProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::DurationInterface >(proxy)) : 0;
}
const void* smoke_DurationInterface_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_DurationInterfaceProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::DurationInterface >>(handle)->get()) : nullptr;
}
