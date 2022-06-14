//
//
#include "cbridge/include/smoke/cbridge_SkipSetter.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/SkipSetter.h"
#include <memory>
#include <new>
#include <string>
void smoke_SkipSetter_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::SkipSetter >>(handle);
}
_baseRef smoke_SkipSetter_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::SkipSetter >>(handle)))
        : 0;
}
const void* smoke_SkipSetter_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::SkipSetter >>(handle)->get())
        : nullptr;
}
void smoke_SkipSetter_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::SkipSetter >>(handle)->get(), swift_pointer);
}
void smoke_SkipSetter_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::SkipSetter >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_SkipSetter(_baseRef handle);
}
namespace {
struct smoke_SkipSetterRegisterInit {
    smoke_SkipSetterRegisterInit() {
        get_init_repository().add_init("smoke_SkipSetter", &_CBridgeInitsmoke_SkipSetter);
    }
} s_smoke_SkipSetter_register_init;
}
void* smoke_SkipSetter_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository().get_id(get_pointer<::std::shared_ptr< ::smoke::SkipSetter >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_SkipSetter(handle);
}
_baseRef smoke_SkipSetter_foo_get(_baseRef _instance) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::SkipSetter >>(_instance)->get()->get_foo());
}
class smoke_SkipSetterProxy : public ::smoke::SkipSetter, public CachedProxyBase<smoke_SkipSetterProxy> {
public:
    smoke_SkipSetterProxy(smoke_SkipSetter_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_SkipSetterProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_SkipSetterProxy(const smoke_SkipSetterProxy&) = delete;
    smoke_SkipSetterProxy& operator=(const smoke_SkipSetterProxy&) = delete;
    ::std::string get_foo() const override {
        auto _call_result = mFunctions.smoke_SkipSetter_foo_get(mFunctions.swift_pointer);
        return Conversion<::std::string>::toCppReturn(_call_result);
    }
    void set_foo(const ::std::string& value) override {
    }
private:
    smoke_SkipSetter_FunctionTable mFunctions;
};
_baseRef smoke_SkipSetter_create_proxy(smoke_SkipSetter_FunctionTable functionTable) {
    auto proxy = smoke_SkipSetterProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::SkipSetter >(proxy)) : 0;
}
const void* smoke_SkipSetter_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_SkipSetterProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::SkipSetter >>(handle)->get()) : nullptr;
}
