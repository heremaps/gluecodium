
#include "ffi_smoke_StandaloneProducer.h"

#include "ConversionBase.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "smoke/StandaloneProducer.h"
#include <functional>
#include <string>
#include <memory>
#include <new>
#include <thread>

class smoke_StandaloneProducer_Proxy {
public:
    smoke_StandaloneProducer_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), isolate_thread_id(std::this_thread::get_id()), f0(f0) {
    }

    ~smoke_StandaloneProducer_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_StandaloneProducer");

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

    smoke_StandaloneProducer_Proxy(const smoke_StandaloneProducer_Proxy&) = delete;
    smoke_StandaloneProducer_Proxy& operator=(const smoke_StandaloneProducer_Proxy&) = delete;

    std::string
    operator()() {
        FfiOpaqueHandle _result_handle;
        
        dispatch([&]() { (*reinterpret_cast<void (*)(FfiOpaqueHandle*)>(f0))(
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
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




FfiOpaqueHandle
library_smoke_StandaloneProducer_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        gluecodium::ffi::Conversion<smoke::StandaloneProducer>::toCpp(_self).operator()()
    );
}















// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_StandaloneProducer_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    library_smoke_StandaloneProducer_release_handle(handle);
}

void
library_smoke_StandaloneProducer_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_StandaloneProducer_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_StandaloneProducer_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) smoke::StandaloneProducer(
            *reinterpret_cast<smoke::StandaloneProducer*>(handle)
        )
    );
}

void
library_smoke_StandaloneProducer_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::StandaloneProducer*>(handle);
}

FfiOpaqueHandle
library_smoke_StandaloneProducer_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::StandaloneProducer>(
            gluecodium::ffi::Conversion<smoke::StandaloneProducer>::toCpp(value)
        )
    );
}

void
library_smoke_StandaloneProducer_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::StandaloneProducer>*>(handle);
}

FfiOpaqueHandle
library_smoke_StandaloneProducer_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::StandaloneProducer>::toFfi(
        **reinterpret_cast<std::optional<smoke::StandaloneProducer>*>(handle)
    );
}




FfiOpaqueHandle
library_smoke_StandaloneProducer_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {

    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_StandaloneProducer_Proxy>(token, isolate_id, "smoke_StandaloneProducer");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_StandaloneProducer_Proxy>(token, isolate_id, dart_handle, close_callbacks, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_StandaloneProducer", cached_proxy);
    } else {
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    }


    return reinterpret_cast<FfiOpaqueHandle>(
        new smoke::StandaloneProducer(
            std::bind(&smoke_StandaloneProducer_Proxy::operator(), cached_proxy)
        )
    );
}





#ifdef __cplusplus
}
#endif
