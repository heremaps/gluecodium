
#include "ffi_smoke_EquatableInterface.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/EquatableInterface.h"
#include <memory>
#include <memory>
#include <new>

class smoke_EquatableInterface_Proxy : public smoke::EquatableInterface {
public:
    smoke_EquatableInterface_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }

    ~smoke_EquatableInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_EquatableInterface");

        auto raw_pointer_local = this;
        auto isolate_id_local = isolate_id;
        auto dart_persistent_handle_local = dart_persistent_handle;
        auto f_close_callbacks_local = f_close_callbacks;
        auto deleter = [raw_pointer_local, isolate_id_local, dart_persistent_handle_local, f_close_callbacks_local]() {
            library_uncache_dart_handle_by_raw_pointer(raw_pointer_local, isolate_id_local);
            Dart_DeletePersistentHandle_DL(dart_persistent_handle_local);
            (*reinterpret_cast<void (*)()>(f_close_callbacks_local))();
        };

        if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            deleter();
        } else {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, deleter);
        }
    }

    smoke_EquatableInterface_Proxy(const smoke_EquatableInterface_Proxy&) = delete;
    smoke_EquatableInterface_Proxy& operator=(const smoke_EquatableInterface_Proxy&) = delete;



private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f_close_callbacks;
};


#ifdef __cplusplus
extern "C" {
#endif
















// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_EquatableInterface_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::EquatableInterface>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_EquatableInterface_release_handle(handle);
}

void
library_smoke_EquatableInterface_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_EquatableInterface_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_EquatableInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::EquatableInterface>(
            *reinterpret_cast<std::shared_ptr<smoke::EquatableInterface>*>(handle)
        )
    );
}

void
library_smoke_EquatableInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::EquatableInterface>*>(handle);
}



bool
library_smoke_EquatableInterface_are_equal(FfiOpaqueHandle handle1, FfiOpaqueHandle handle2) {
    bool isNull1 = handle1 == 0;
    bool isNull2 = handle2 == 0;
    if (isNull1 && isNull2) return true;
    if (isNull1 || isNull2) return false;
    return **reinterpret_cast<std::shared_ptr<smoke::EquatableInterface>*>(handle1) ==
        **reinterpret_cast<std::shared_ptr<smoke::EquatableInterface>*>(handle2);
}

FfiOpaqueHandle
library_smoke_EquatableInterface_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_EquatableInterface_Proxy>(token, isolate_id, "smoke_EquatableInterface");
    std::shared_ptr<smoke_EquatableInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_EquatableInterface_Proxy>(cached_proxy);
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_EquatableInterface_Proxy>(
            new (std::nothrow) smoke_EquatableInterface_Proxy(token, isolate_id, dart_handle, close_callbacks)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_EquatableInterface", *proxy_ptr);
    }

    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}





FfiOpaqueHandle
library_smoke_EquatableInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::EquatableInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}

#ifdef __cplusplus
}
#endif
