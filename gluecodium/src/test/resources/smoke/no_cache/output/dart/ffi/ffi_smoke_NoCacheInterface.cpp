
#include "ffi_smoke_NoCacheInterface.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/NoCacheInterface.h"
#include <memory>
#include <memory>
#include <new>
#include <thread>

class smoke_NoCacheInterface_Proxy : public smoke::NoCacheInterface {
public:
    smoke_NoCacheInterface_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), isolate_thread_id(std::this_thread::get_id()), f0(f0) {
    }

    ~smoke_NoCacheInterface_Proxy() {

        auto raw_pointer_local = this;
        auto isolate_id_local = isolate_id;
        auto dart_persistent_handle_local = dart_persistent_handle;
        auto f_close_callbacks_local = f_close_callbacks;
        auto deleter = [dart_persistent_handle_local, f_close_callbacks_local]() {
            Dart_DeletePersistentHandle_DL(dart_persistent_handle_local);
            (*reinterpret_cast<void (*)()>(f_close_callbacks_local))();
        };

        if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            deleter();
        } else {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, deleter);
        }
    }

    smoke_NoCacheInterface_Proxy(const smoke_NoCacheInterface_Proxy&) = delete;
    smoke_NoCacheInterface_Proxy& operator=(const smoke_NoCacheInterface_Proxy&) = delete;

    void
    foo() override {
        
        
        dispatch([&]() { (*reinterpret_cast<void (*)()>(f0))(
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
library_smoke_NoCacheInterface_foo(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::NoCacheInterface>>::toCpp(_self)).foo();
}















// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_NoCacheInterface_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    library_smoke_NoCacheInterface_release_handle(handle);
}

void
library_smoke_NoCacheInterface_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_NoCacheInterface_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_NoCacheInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::NoCacheInterface>(
            *reinterpret_cast<std::shared_ptr<smoke::NoCacheInterface>*>(handle)
        )
    );
}

void
library_smoke_NoCacheInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::NoCacheInterface>*>(handle);
}


FfiOpaqueHandle
library_smoke_NoCacheInterface_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {
    std::shared_ptr<smoke_NoCacheInterface_Proxy>* proxy_ptr;
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_NoCacheInterface_Proxy>(
            new (std::nothrow) smoke_NoCacheInterface_Proxy(token, isolate_id, dart_handle, close_callbacks, f0)
        );

    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}





FfiOpaqueHandle
library_smoke_NoCacheInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::NoCacheInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}

#ifdef __cplusplus
}
#endif
