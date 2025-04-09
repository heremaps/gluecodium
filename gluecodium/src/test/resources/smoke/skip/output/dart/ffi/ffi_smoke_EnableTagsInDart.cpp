
#include "ffi_smoke_EnableTagsInDart.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/EnableTagsInDart.h"
#include <memory>
#include <memory>
#include <new>
#include <thread>

class smoke_EnableTagsInDart_Proxy : public smoke::EnableTagsInDart {
public:
    smoke_EnableTagsInDart_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0, FfiOpaqueHandle f2)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), isolate_thread_id(std::this_thread::get_id()), f0(f0), f2(f2) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }

    ~smoke_EnableTagsInDart_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_EnableTagsInDart");

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

    smoke_EnableTagsInDart_Proxy(const smoke_EnableTagsInDart_Proxy&) = delete;
    smoke_EnableTagsInDart_Proxy& operator=(const smoke_EnableTagsInDart_Proxy&) = delete;

    void
    enable_tagged() override {
        
        
        dispatch([&]() { (*reinterpret_cast<void (*)()>(f0))(
        ); });
    }

    void
    dont_enable_tagged() override {

    }

    void
    enable_tagged_list() override {
        
        
        dispatch([&]() { (*reinterpret_cast<void (*)()>(f2))(
        ); });
    }



private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f_close_callbacks;
    const Dart_Isolate isolate_handle;
    const std::thread::id isolate_thread_id;
    const FfiOpaqueHandle f0;
    const FfiOpaqueHandle f2;

    inline void dispatch(std::function<void()>&& callback) const
    {
        if (isolate_thread_id != std::this_thread::get_id()) {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
        } else if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            callback();
        } else {
            Dart_EnterIsolate_DL(isolate_handle);
            callback();
            Dart_ExitIsolate_DL();
        }
    }
};


#ifdef __cplusplus
extern "C" {
#endif




void
library_smoke_EnableTagsInDart_enableTagged(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::EnableTagsInDart>>::toCpp(_self)).enable_tagged();
}



void
library_smoke_EnableTagsInDart_enableTaggedList(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::EnableTagsInDart>>::toCpp(_self)).enable_tagged_list();
}















// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_EnableTagsInDart_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::EnableTagsInDart>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_EnableTagsInDart_release_handle(handle);
}

void
library_smoke_EnableTagsInDart_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_EnableTagsInDart_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_EnableTagsInDart_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::EnableTagsInDart>(
            *reinterpret_cast<std::shared_ptr<smoke::EnableTagsInDart>*>(handle)
        )
    );
}

void
library_smoke_EnableTagsInDart_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::EnableTagsInDart>*>(handle);
}


FfiOpaqueHandle
library_smoke_EnableTagsInDart_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0, FfiOpaqueHandle f2) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_EnableTagsInDart_Proxy>(token, isolate_id, "smoke_EnableTagsInDart");
    std::shared_ptr<smoke_EnableTagsInDart_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_EnableTagsInDart_Proxy>(cached_proxy);
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_EnableTagsInDart_Proxy>(
            new (std::nothrow) smoke_EnableTagsInDart_Proxy(token, isolate_id, dart_handle, close_callbacks, f0, f2)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_EnableTagsInDart", *proxy_ptr);
    }

    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}





FfiOpaqueHandle
library_smoke_EnableTagsInDart_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::EnableTagsInDart>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}

#ifdef __cplusplus
}
#endif
