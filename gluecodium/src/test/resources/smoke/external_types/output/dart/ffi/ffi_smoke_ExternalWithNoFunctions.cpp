#include "ffi_smoke_ExternalWithNoFunctions.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "some/path/Bar.h"
#include <memory>
#include <memory>
#include <new>
class smoke_ExternalWithNoFunctions_Proxy : public some::path::Bar {
public:
    smoke_ExternalWithNoFunctions_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }
    ~smoke_ExternalWithNoFunctions_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_ExternalWithNoFunctions");
        auto raw_pointer_local = this;
        auto isolate_id_local = isolate_id;
        auto dart_persistent_handle_local = dart_persistent_handle;
        auto deleter = [raw_pointer_local, isolate_id_local, dart_persistent_handle_local]() {
            library_uncache_dart_handle_by_raw_pointer(raw_pointer_local, isolate_id_local);
            Dart_DeletePersistentHandle_DL(dart_persistent_handle_local);
        };
        if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            deleter();
        } else {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, deleter);
        }
    }
    smoke_ExternalWithNoFunctions_Proxy(const smoke_ExternalWithNoFunctions_Proxy&) = delete;
    smoke_ExternalWithNoFunctions_Proxy& operator=(const smoke_ExternalWithNoFunctions_Proxy&) = delete;
private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
};
#ifdef __cplusplus
extern "C" {
#endif
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_ExternalWithNoFunctions_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<some::path::Bar>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_ExternalWithNoFunctions_release_handle(handle);
}
void
library_smoke_ExternalWithNoFunctions_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_ExternalWithNoFunctions_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_ExternalWithNoFunctions_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<some::path::Bar>(
            *reinterpret_cast<std::shared_ptr<some::path::Bar>*>(handle)
        )
    );
}
void
library_smoke_ExternalWithNoFunctions_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<some::path::Bar>*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalWithNoFunctions_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_ExternalWithNoFunctions_Proxy>(token, isolate_id, "smoke_ExternalWithNoFunctions");
    std::shared_ptr<smoke_ExternalWithNoFunctions_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ExternalWithNoFunctions_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ExternalWithNoFunctions_Proxy>(
            new (std::nothrow) smoke_ExternalWithNoFunctions_Proxy(token, isolate_id, dart_handle)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_ExternalWithNoFunctions", *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_ExternalWithNoFunctions_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<some::path::Bar>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
