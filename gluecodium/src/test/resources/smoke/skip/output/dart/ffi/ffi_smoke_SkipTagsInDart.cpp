
#include "ffi_smoke_SkipTagsInDart.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/SkipTagsInDart.h"
#include <memory>
#include <memory>
#include <new>

class smoke_SkipTagsInDart_Proxy : public smoke::SkipTagsInDart {
public:
    smoke_SkipTagsInDart_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f1)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), f1(f1) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }

    ~smoke_SkipTagsInDart_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_SkipTagsInDart");

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

    smoke_SkipTagsInDart_Proxy(const smoke_SkipTagsInDart_Proxy&) = delete;
    smoke_SkipTagsInDart_Proxy& operator=(const smoke_SkipTagsInDart_Proxy&) = delete;

    void
    skip_tagged() override {

    }

    void
    dont_skip_tagged() override {
        
        
        dispatch([&]() { (*reinterpret_cast<void (*)()>(f1))(
        ); });
    }

    void
    skip_tagged_list() override {

    }



private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f_close_callbacks;
    const FfiOpaqueHandle f1;

    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};


#ifdef __cplusplus
extern "C" {
#endif




void
library_smoke_SkipTagsInDart_dontSkipTagged(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SkipTagsInDart>>::toCpp(_self)).dont_skip_tagged();
}















// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_SkipTagsInDart_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::SkipTagsInDart>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_SkipTagsInDart_release_handle(handle);
}

void
library_smoke_SkipTagsInDart_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_SkipTagsInDart_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_SkipTagsInDart_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::SkipTagsInDart>(
            *reinterpret_cast<std::shared_ptr<smoke::SkipTagsInDart>*>(handle)
        )
    );
}

void
library_smoke_SkipTagsInDart_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::SkipTagsInDart>*>(handle);
}


FfiOpaqueHandle
library_smoke_SkipTagsInDart_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f1) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_SkipTagsInDart_Proxy>(token, isolate_id, "smoke_SkipTagsInDart");
    std::shared_ptr<smoke_SkipTagsInDart_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SkipTagsInDart_Proxy>(cached_proxy);
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SkipTagsInDart_Proxy>(
            new (std::nothrow) smoke_SkipTagsInDart_Proxy(token, isolate_id, dart_handle, close_callbacks, f1)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_SkipTagsInDart", *proxy_ptr);
    }

    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}





FfiOpaqueHandle
library_smoke_SkipTagsInDart_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::SkipTagsInDart>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}

#ifdef __cplusplus
}
#endif
