
#include "ffi_smoke_AsyncWithSkips.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "smoke/AsyncWithSkips.h"
#include <memory>
#include <memory>
#include <new>
#include <thread>

class smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_Proxy {
public:
    smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), isolate_thread_id(std::this_thread::get_id()), f0(f0) {
    }

    ~smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncWithSkips_MakeSharedInstanceResultlambda");

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

    smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_Proxy(const smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_Proxy&) = delete;
    smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_Proxy& operator=(const smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_Proxy&) = delete;

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
    const Dart_Isolate isolate_handle;
    const std::thread::id isolate_thread_id;
    const FfiOpaqueHandle f0;

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
library_smoke_AsyncWithSkips_makeSharedInstance__make_shared_instance__resultLambda(int32_t _isolate_id, FfiOpaqueHandle Resultlambda) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    smoke::AsyncWithSkips::make_shared_instance(
        gluecodium::ffi::Conversion<std::function<void()>>::toCpp(Resultlambda)
    );
}













void
library_smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void()>>::toCpp(_self).operator()();
}





// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_AsyncWithSkips_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::AsyncWithSkips>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_AsyncWithSkips_release_handle(handle);
}

void
library_smoke_AsyncWithSkips_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_AsyncWithSkips_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_AsyncWithSkips_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::AsyncWithSkips>(
            *reinterpret_cast<std::shared_ptr<smoke::AsyncWithSkips>*>(handle)
        )
    );
}

void
library_smoke_AsyncWithSkips_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::AsyncWithSkips>*>(handle);
}

void
library_smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void()>*>(handle);
}



FfiOpaqueHandle
library_smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {

    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_Proxy>(token, isolate_id, "smoke_AsyncWithSkips_MakeSharedInstanceResultlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_Proxy>(token, isolate_id, dart_handle, close_callbacks, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncWithSkips_MakeSharedInstanceResultlambda", cached_proxy);
    } else {
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    }


    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void()>(
            std::bind(&smoke_AsyncWithSkips_MakeSharedInstanceResultlambda_Proxy::operator(), cached_proxy)
        )
    );
}





#ifdef __cplusplus
}
#endif
