//
//
#include "cbridge/include/smoke/cbridge_SkipTagsInSwift.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/SkipTagsInSwift.h"
#include <memory>
#include <new>
void smoke_SkipTagsInSwift_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::SkipTagsInSwift >>(handle);
}
_baseRef smoke_SkipTagsInSwift_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::SkipTagsInSwift >>(handle)))
        : 0;
}
const void* smoke_SkipTagsInSwift_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::SkipTagsInSwift >>(handle)->get())
        : nullptr;
}
void smoke_SkipTagsInSwift_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::SkipTagsInSwift >>(handle)->get(), swift_pointer);
}
void smoke_SkipTagsInSwift_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::SkipTagsInSwift >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_SkipTagsInSwift(_baseRef handle);
}
namespace {
struct smoke_SkipTagsInSwiftRegisterInit {
    smoke_SkipTagsInSwiftRegisterInit() {
        get_init_repository().add_init("smoke_SkipTagsInSwift", &_CBridgeInitsmoke_SkipTagsInSwift);
    }
} s_smoke_SkipTagsInSwift_register_init;
}
void* smoke_SkipTagsInSwift_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository().get_id(get_pointer<::std::shared_ptr< ::smoke::SkipTagsInSwift >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_SkipTagsInSwift(handle);
}
void smoke_SkipTagsInSwift_dontSkipTagged(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::SkipTagsInSwift >>(_instance)->get()->dont_skip_tagged();
}
class smoke_SkipTagsInSwiftProxy : public ::smoke::SkipTagsInSwift, public CachedProxyBase<smoke_SkipTagsInSwiftProxy> {
public:
    smoke_SkipTagsInSwiftProxy(smoke_SkipTagsInSwift_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_SkipTagsInSwiftProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_SkipTagsInSwiftProxy(const smoke_SkipTagsInSwiftProxy&) = delete;
    smoke_SkipTagsInSwiftProxy& operator=(const smoke_SkipTagsInSwiftProxy&) = delete;
    void skip_tagged() override {
    }
    void dont_skip_tagged() override {
        mFunctions.smoke_SkipTagsInSwift_dontSkipTagged(mFunctions.swift_pointer);
    }
    void skip_tagged_list() override {
    }
private:
    smoke_SkipTagsInSwift_FunctionTable mFunctions;
};
_baseRef smoke_SkipTagsInSwift_create_proxy(smoke_SkipTagsInSwift_FunctionTable functionTable) {
    auto proxy = smoke_SkipTagsInSwiftProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::SkipTagsInSwift >(proxy)) : 0;
}
const void* smoke_SkipTagsInSwift_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_SkipTagsInSwiftProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::SkipTagsInSwift >>(handle)->get()) : nullptr;
}
