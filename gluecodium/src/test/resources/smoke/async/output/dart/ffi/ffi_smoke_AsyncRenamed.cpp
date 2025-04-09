
#include "ffi_smoke_AsyncRenamed.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "smoke/AsyncRenamed.h"
#include <memory>
#include <memory>
#include <new>

class smoke_AsyncRenamed_DisposeResultlambda_Proxy {
public:
    smoke_AsyncRenamed_DisposeResultlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), f0(f0) {
    }

    ~smoke_AsyncRenamed_DisposeResultlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncRenamed_DisposeResultlambda");

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

    smoke_AsyncRenamed_DisposeResultlambda_Proxy(const smoke_AsyncRenamed_DisposeResultlambda_Proxy&) = delete;
    smoke_AsyncRenamed_DisposeResultlambda_Proxy& operator=(const smoke_AsyncRenamed_DisposeResultlambda_Proxy&) = delete;

    void
    operator()() {
        
        
        dispatch([&]() { (*reinterpret_cast<void (*)()>(f0))(
        ); });
    }



private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f_close_callbacks;
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
library_smoke_AsyncRenamed_dispose__dispose__resultLambda(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle Resultlambda) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::AsyncRenamed>>::toCpp(_self)).callDispose(
        gluecodium::ffi::Conversion<std::function<void()>>::toCpp(Resultlambda)
    );
}













void
library_smoke_AsyncRenamed_DisposeResultlambda_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void()>>::toCpp(_self).operator()();
}





// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_AsyncRenamed_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::AsyncRenamed>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_AsyncRenamed_release_handle(handle);
}

void
library_smoke_AsyncRenamed_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_AsyncRenamed_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_AsyncRenamed_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::AsyncRenamed>(
            *reinterpret_cast<std::shared_ptr<smoke::AsyncRenamed>*>(handle)
        )
    );
}

void
library_smoke_AsyncRenamed_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::AsyncRenamed>*>(handle);
}

void
library_smoke_AsyncRenamed_DisposeResultlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void()>*>(handle);
}



FfiOpaqueHandle
library_smoke_AsyncRenamed_DisposeResultlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {

    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncRenamed_DisposeResultlambda_Proxy>(token, isolate_id, "smoke_AsyncRenamed_DisposeResultlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncRenamed_DisposeResultlambda_Proxy>(token, isolate_id, dart_handle, close_callbacks, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncRenamed_DisposeResultlambda", cached_proxy);
    } else {
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    }


    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void()>(
            std::bind(&smoke_AsyncRenamed_DisposeResultlambda_Proxy::operator(), cached_proxy)
        )
    );
}





#ifdef __cplusplus
}
#endif
