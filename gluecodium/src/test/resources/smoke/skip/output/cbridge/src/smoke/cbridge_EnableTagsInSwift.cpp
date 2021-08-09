//
//
#include "cbridge/include/smoke/cbridge_EnableTagsInSwift.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/EnableTagsInSwift.h"
#include <memory>
#include <new>
void smoke_EnableTagsInSwift_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::EnableTagsInSwift >>(handle);
}
_baseRef smoke_EnableTagsInSwift_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::EnableTagsInSwift >>(handle)))
        : 0;
}
const void* smoke_EnableTagsInSwift_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::EnableTagsInSwift >>(handle)->get())
        : nullptr;
}
void smoke_EnableTagsInSwift_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::EnableTagsInSwift >>(handle)->get(), swift_pointer);
}
void smoke_EnableTagsInSwift_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::EnableTagsInSwift >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_EnableTagsInSwift(_baseRef handle);
}
namespace {
struct smoke_EnableTagsInSwiftRegisterInit {
    smoke_EnableTagsInSwiftRegisterInit() {
        get_init_repository().add_init("smoke_EnableTagsInSwift", &_CBridgeInitsmoke_EnableTagsInSwift);
    }
} s_smoke_EnableTagsInSwift_register_init;
}
void* smoke_EnableTagsInSwift_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository().get_id(get_pointer<::std::shared_ptr< ::smoke::EnableTagsInSwift >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_EnableTagsInSwift(handle);
}
void smoke_EnableTagsInSwift_enableTagged(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::EnableTagsInSwift >>(_instance)->get()->enable_tagged();
}
void smoke_EnableTagsInSwift_enableTaggedList(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::EnableTagsInSwift >>(_instance)->get()->enable_tagged_list();
}
class smoke_EnableTagsInSwiftProxy : public ::smoke::EnableTagsInSwift, public CachedProxyBase<smoke_EnableTagsInSwiftProxy> {
public:
    smoke_EnableTagsInSwiftProxy(smoke_EnableTagsInSwift_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_EnableTagsInSwiftProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_EnableTagsInSwiftProxy(const smoke_EnableTagsInSwiftProxy&) = delete;
    smoke_EnableTagsInSwiftProxy& operator=(const smoke_EnableTagsInSwiftProxy&) = delete;
    void enable_tagged() override {
        mFunctions.smoke_EnableTagsInSwift_enableTagged(mFunctions.swift_pointer);
    }
    void dont_enable_tagged() override {
    }
    void enable_tagged_list() override {
        mFunctions.smoke_EnableTagsInSwift_enableTaggedList(mFunctions.swift_pointer);
    }
private:
    smoke_EnableTagsInSwift_FunctionTable mFunctions;
};
_baseRef smoke_EnableTagsInSwift_create_proxy(smoke_EnableTagsInSwift_FunctionTable functionTable) {
    auto proxy = smoke_EnableTagsInSwiftProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::EnableTagsInSwift >(proxy)) : 0;
}
const void* smoke_EnableTagsInSwift_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_EnableTagsInSwiftProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::EnableTagsInSwift >>(handle)->get()) : nullptr;
}
