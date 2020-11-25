#include "ffi_smoke_ExternalWithNoFunctions.h"
#include "ConversionBase.h"
#include "CallbacksQueue.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "some/path/Bar.h"
#include <memory>
#include <memory>
#include <new>
class smoke_ExternalWithNoFunctions_Proxy : public ::some::path::Bar {
public:
    smoke_ExternalWithNoFunctions_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter)
        : token(token), isolate_id(isolate_id), deleter(deleter) { }
    ~smoke_ExternalWithNoFunctions_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_ExternalWithNoFunctions");
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t, FfiOpaqueHandle)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [this, token_local, deleter_local]() {
            (*deleter_local)(token_local, this);
        });
    }
    smoke_ExternalWithNoFunctions_Proxy(const smoke_ExternalWithNoFunctions_Proxy&) = delete;
    smoke_ExternalWithNoFunctions_Proxy& operator=(const smoke_ExternalWithNoFunctions_Proxy&) = delete;
private:
    const uint64_t token;
    const int32_t isolate_id;
    const FfiOpaqueHandle deleter;
};
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_ExternalWithNoFunctions_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::some::path::Bar>(
            *reinterpret_cast<std::shared_ptr<::some::path::Bar>*>(handle)
        )
    );
}
void
library_smoke_ExternalWithNoFunctions_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::some::path::Bar>*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalWithNoFunctions_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::some::path::Bar>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_ExternalWithNoFunctions_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_ExternalWithNoFunctions_Proxy>(token, isolate_id, "smoke_ExternalWithNoFunctions");
    std::shared_ptr<smoke_ExternalWithNoFunctions_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ExternalWithNoFunctions_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ExternalWithNoFunctions_Proxy>(
            new (std::nothrow) smoke_ExternalWithNoFunctions_Proxy(token, isolate_id, deleter)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_ExternalWithNoFunctions", *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_ExternalWithNoFunctions_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_repository = ::gluecodium::get_type_repository(static_cast<::some::path::Bar*>(nullptr));
    const auto& type_id = type_repository.get_id(reinterpret_cast<std::shared_ptr<::some::path::Bar>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
