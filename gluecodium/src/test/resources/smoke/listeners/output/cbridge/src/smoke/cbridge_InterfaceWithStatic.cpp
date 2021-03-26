//
//
#include "cbridge/include/smoke/cbridge_InterfaceWithStatic.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/InterfaceWithStatic.h"
#include <memory>
#include <new>
#include <string>
void smoke_InterfaceWithStatic_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::InterfaceWithStatic >>(handle);
}
_baseRef smoke_InterfaceWithStatic_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::InterfaceWithStatic >>(handle)))
        : 0;
}
const void* smoke_InterfaceWithStatic_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::InterfaceWithStatic >>(handle)->get())
        : nullptr;
}
void smoke_InterfaceWithStatic_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::InterfaceWithStatic >>(handle)->get(), swift_pointer);
}
void smoke_InterfaceWithStatic_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::InterfaceWithStatic >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_InterfaceWithStatic(_baseRef handle);
}
namespace {
struct smoke_InterfaceWithStaticRegisterInit {
    smoke_InterfaceWithStaticRegisterInit() {
        get_init_repository().add_init("smoke_InterfaceWithStatic", &_CBridgeInitsmoke_InterfaceWithStatic);
    }
} s_smoke_InterfaceWithStatic_register_init;
}
void* smoke_InterfaceWithStatic_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository().get_id(get_pointer<::std::shared_ptr< ::smoke::InterfaceWithStatic >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_InterfaceWithStatic(handle);
}
_baseRef smoke_InterfaceWithStatic_regularFunction(_baseRef _instance) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::InterfaceWithStatic >>(_instance)->get()->regular_function());
}
_baseRef smoke_InterfaceWithStatic_staticFunction() {
    return Conversion<::std::string>::toBaseRef(::smoke::InterfaceWithStatic::static_function());
}
_baseRef smoke_InterfaceWithStatic_regularProperty_get(_baseRef _instance) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::InterfaceWithStatic >>(_instance)->get()->get_regular_property());
}
void smoke_InterfaceWithStatic_regularProperty_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::InterfaceWithStatic >>(_instance)->get()->set_regular_property(Conversion<::std::string>::toCpp(value));
}
_baseRef smoke_InterfaceWithStatic_staticProperty_get() {
    return Conversion<::std::string>::toBaseRef(::smoke::InterfaceWithStatic::get_static_property());
}
void smoke_InterfaceWithStatic_staticProperty_set(_baseRef value) {
    return ::smoke::InterfaceWithStatic::set_static_property(Conversion<::std::string>::toCpp(value));
}
class smoke_InterfaceWithStaticProxy : public ::smoke::InterfaceWithStatic, public CachedProxyBase<smoke_InterfaceWithStaticProxy> {
public:
    smoke_InterfaceWithStaticProxy(smoke_InterfaceWithStatic_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_InterfaceWithStaticProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_InterfaceWithStaticProxy(const smoke_InterfaceWithStaticProxy&) = delete;
    smoke_InterfaceWithStaticProxy& operator=(const smoke_InterfaceWithStaticProxy&) = delete;
    ::std::string regular_function() override {
        auto _call_result = mFunctions.smoke_InterfaceWithStatic_regularFunction(mFunctions.swift_pointer);
        return Conversion<::std::string>::toCppReturn(_call_result);
    }
    ::std::string get_regular_property() const override {
        auto _call_result = mFunctions.smoke_InterfaceWithStatic_regularProperty_get(mFunctions.swift_pointer);
        return Conversion<::std::string>::toCppReturn(_call_result);
    }
    void set_regular_property(const ::std::string& value) override {
        mFunctions.smoke_InterfaceWithStatic_regularProperty_set(mFunctions.swift_pointer, Conversion<::std::string>::toBaseRef(value));
    }
private:
    smoke_InterfaceWithStatic_FunctionTable mFunctions;
};
_baseRef smoke_InterfaceWithStatic_create_proxy(smoke_InterfaceWithStatic_FunctionTable functionTable) {
    auto proxy = smoke_InterfaceWithStaticProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::InterfaceWithStatic >(proxy)) : 0;
}
const void* smoke_InterfaceWithStatic_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_InterfaceWithStaticProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::InterfaceWithStatic >>(handle)->get()) : nullptr;
}
