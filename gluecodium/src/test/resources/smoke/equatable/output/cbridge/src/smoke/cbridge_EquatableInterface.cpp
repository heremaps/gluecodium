//
//
#include "cbridge/include/smoke/cbridge_EquatableInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/EquatableInterface.h"
#include <memory>
#include <new>
void smoke_EquatableInterface_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::EquatableInterface >>(handle);
}
_baseRef smoke_EquatableInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::EquatableInterface >>(handle)))
        : 0;
}
const void* smoke_EquatableInterface_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::EquatableInterface >>(handle)->get())
        : nullptr;
}
void smoke_EquatableInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::EquatableInterface >>(handle)->get(), swift_pointer);
}
void smoke_EquatableInterface_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::EquatableInterface >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_EquatableInterface(_baseRef handle);
}
namespace {
struct smoke_EquatableInterfaceRegisterInit {
    smoke_EquatableInterfaceRegisterInit() {
        get_init_repository().add_init("smoke_EquatableInterface", &_CBridgeInitsmoke_EquatableInterface);
    }
} s_smoke_EquatableInterface_register_init;
}
void* smoke_EquatableInterface_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository().get_id(get_pointer<::std::shared_ptr< ::smoke::EquatableInterface >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_EquatableInterface(handle);
}
bool smoke_EquatableInterface_equal(_baseRef lhs, _baseRef rhs) {
    return **get_pointer<::std::shared_ptr< ::smoke::EquatableInterface >>(lhs) == **get_pointer<::std::shared_ptr< ::smoke::EquatableInterface >>(rhs);
}
uint64_t smoke_EquatableInterface_hash(_baseRef handle) {
    return ::gluecodium::hash<::smoke::EquatableInterface>()(**get_pointer<::std::shared_ptr< ::smoke::EquatableInterface >>(handle));
}
class smoke_EquatableInterfaceProxy : public ::smoke::EquatableInterface, public CachedProxyBase<smoke_EquatableInterfaceProxy> {
public:
    smoke_EquatableInterfaceProxy(smoke_EquatableInterface_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_EquatableInterfaceProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_EquatableInterfaceProxy(const smoke_EquatableInterfaceProxy&) = delete;
    smoke_EquatableInterfaceProxy& operator=(const smoke_EquatableInterfaceProxy&) = delete;
private:
    smoke_EquatableInterface_FunctionTable mFunctions;
};
_baseRef smoke_EquatableInterface_create_proxy(smoke_EquatableInterface_FunctionTable functionTable) {
    auto proxy = smoke_EquatableInterfaceProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::EquatableInterface >(proxy)) : 0;
}
const void* smoke_EquatableInterface_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_EquatableInterfaceProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::EquatableInterface >>(handle)->get()) : nullptr;
}
