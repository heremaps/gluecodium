#include "ffi_smoke_EquatableInterface.h"
#include "ConversionBase.h"
#include "CallbacksQueue.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/EquatableInterface.h"
#include <memory>
#include <memory>
#include <new>
class smoke_EquatableInterface_Proxy : public ::smoke::EquatableInterface {
public:
    smoke_EquatableInterface_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter)
        : token(token), isolate_id(isolate_id), deleter(deleter) { }
    ~smoke_EquatableInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_EquatableInterface");
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t, FfiOpaqueHandle)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [this, token_local, deleter_local]() {
            (*deleter_local)(token_local, this);
        });
    }
    smoke_EquatableInterface_Proxy(const smoke_EquatableInterface_Proxy&) = delete;
    smoke_EquatableInterface_Proxy& operator=(const smoke_EquatableInterface_Proxy&) = delete;
private:
    const uint64_t token;
    const int32_t isolate_id;
    const FfiOpaqueHandle deleter;
};
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_EquatableInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::EquatableInterface>(
            *reinterpret_cast<std::shared_ptr<::smoke::EquatableInterface>*>(handle)
        )
    );
}
void
library_smoke_EquatableInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::EquatableInterface>*>(handle);
}
FfiOpaqueHandle
library_smoke_EquatableInterface_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::EquatableInterface>*>(handle)->get()
    );
}
bool
library_smoke_EquatableInterface_are_equal(FfiOpaqueHandle handle1, FfiOpaqueHandle handle2) {
    bool isNull1 = handle1 == 0;
    bool isNull2 = handle2 == 0;
    if (isNull1 && isNull2) return true;
    if (isNull1 || isNull2) return false;
    return **reinterpret_cast<std::shared_ptr<::smoke::EquatableInterface>*>(handle1) ==
        **reinterpret_cast<std::shared_ptr<::smoke::EquatableInterface>*>(handle2);
}
FfiOpaqueHandle
library_smoke_EquatableInterface_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_EquatableInterface_Proxy>(token, isolate_id, "smoke_EquatableInterface");
    std::shared_ptr<smoke_EquatableInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_EquatableInterface_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_EquatableInterface_Proxy>(
            new (std::nothrow) smoke_EquatableInterface_Proxy(token, isolate_id, deleter)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_EquatableInterface", *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_EquatableInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_repository = ::gluecodium::get_type_repository(static_cast<::smoke::EquatableInterface*>(nullptr));
    const auto& type_id = type_repository.get_id(reinterpret_cast<std::shared_ptr<::smoke::EquatableInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
