//
//
#include "cbridge\include\smoke\cbridge_ListenerInterface.h"
#include "cbridge\include\smoke\cbridge_Weakling.h"
#include "cbridge_internal\include\BaseHandleImpl.h"
#include "cbridge_internal\include\CachedProxyBase.h"
#include "cbridge_internal\include\TypeInitRepository.h"
#include "cbridge_internal\include\WrapperCache.h"
#include "gluecodium\Optional.h"
#include "gluecodium\TypeRepository.h"
#include "smoke\ListenerInterface.h"
#include "smoke\Weakling.h"
#include <memory>
#include <new>
void smoke_Weakling_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::Weakling>>(handle);
}
_baseRef smoke_Weakling_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::Weakling>>(handle)))
        : 0;
}
const void* smoke_Weakling_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<std::shared_ptr<::smoke::Weakling>>(handle)->get())
        : nullptr;
}
void smoke_Weakling_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<std::shared_ptr<::smoke::Weakling>>(handle)->get(), swift_pointer);
}
void smoke_Weakling_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<std::shared_ptr<::smoke::Weakling>>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_Weakling(_baseRef handle);
}
namespace {
struct smoke_WeaklingRegisterInit {
    smoke_WeaklingRegisterInit() {
        get_init_repository().add_init("smoke_Weakling", &_CBridgeInitsmoke_Weakling);
    }
} s_smoke_Weakling_register_init;
}
void* smoke_Weakling_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository(static_cast<std::shared_ptr<::smoke::Weakling>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::smoke::Weakling>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_Weakling(handle);
}
_baseRef smoke_Weakling_listener_get(_baseRef _instance) {
    return Conversion<::std::shared_ptr< ::smoke::ListenerInterface >>::toBaseRef(get_pointer<std::shared_ptr<::smoke::Weakling>>(_instance)->get()->get_listener());
}
void smoke_Weakling_listener_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::Weakling>>(_instance)->get()->set_listener(Conversion<::std::shared_ptr< ::smoke::ListenerInterface >>::toCpp(newValue));
}
class smoke_WeaklingProxy : public std::shared_ptr<::smoke::Weakling>::element_type, public CachedProxyBase<smoke_WeaklingProxy> {
public:
    smoke_WeaklingProxy(smoke_Weakling_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_WeaklingProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_WeaklingProxy(const smoke_WeaklingProxy&) = delete;
    smoke_WeaklingProxy& operator=(const smoke_WeaklingProxy&) = delete;
    ::std::shared_ptr< ::smoke::ListenerInterface > get_listener() const override {
        auto _call_result = mFunctions.smoke_Weakling_listener_get(mFunctions.swift_pointer);
        return Conversion<::std::shared_ptr< ::smoke::ListenerInterface >>::toCppReturn(_call_result);
    }
    void set_listener(const ::std::shared_ptr< ::smoke::ListenerInterface >& newValue) override {
        mFunctions.smoke_Weakling_listener_set(mFunctions.swift_pointer, Conversion<::std::shared_ptr< ::smoke::ListenerInterface >>::toBaseRef(newValue));
    }
private:
    smoke_Weakling_FunctionTable mFunctions;
};
_baseRef smoke_Weakling_create_proxy(smoke_Weakling_FunctionTable functionTable) {
    auto proxy = smoke_WeaklingProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new std::shared_ptr<::smoke::Weakling>(proxy)) : 0;
}
const void* smoke_Weakling_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_WeaklingProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::Weakling>>(handle)->get()) : nullptr;
}
