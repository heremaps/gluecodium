
#include "ffi_smoke_SpecialNamesInterface.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/SpecialNamesInterface.h"
#include <functional>
#include <memory>
#include <memory>
#include <new>
#include <thread>

class smoke_SpecialNamesInterface_Proxy : public smoke::SpecialNamesInterface {
public:
    smoke_SpecialNamesInterface_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), isolate_thread_id(std::this_thread::get_id()), f0(f0) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }

    ~smoke_SpecialNamesInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_SpecialNamesInterface");

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

    smoke_SpecialNamesInterface_Proxy(const smoke_SpecialNamesInterface_Proxy&) = delete;
    smoke_SpecialNamesInterface_Proxy& operator=(const smoke_SpecialNamesInterface_Proxy&) = delete;

    void
    dispatch(const smoke::SpecialNamesInterface::Callback& callback) const override {
        
        
        dispatch([&]() { (*reinterpret_cast<void (*)(FfiOpaqueHandle)>(f0))(
            gluecodium::ffi::Conversion<smoke::SpecialNamesInterface::Callback>::toFfi(callback)
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

class smoke_SpecialNamesInterface_Callback_Proxy {
public:
    smoke_SpecialNamesInterface_Callback_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), isolate_thread_id(std::this_thread::get_id()), f0(f0) {
    }

    ~smoke_SpecialNamesInterface_Callback_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_SpecialNamesInterface_Callback");

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

    smoke_SpecialNamesInterface_Callback_Proxy(const smoke_SpecialNamesInterface_Callback_Proxy&) = delete;
    smoke_SpecialNamesInterface_Callback_Proxy& operator=(const smoke_SpecialNamesInterface_Callback_Proxy&) = delete;

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
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};


#ifdef __cplusplus
extern "C" {
#endif




void
library_smoke_SpecialNamesInterface_dispatch__Callback(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle callback) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SpecialNamesInterface>>::toCpp(_self)).dispatch(
        gluecodium::ffi::Conversion<smoke::SpecialNamesInterface::Callback>::toCpp(callback)
    );
}












void
library_smoke_SpecialNamesInterface_Callback_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<smoke::SpecialNamesInterface::Callback>::toCpp(_self).operator()();
}






// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_SpecialNamesInterface_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::SpecialNamesInterface>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_SpecialNamesInterface_release_handle(handle);
}

void
library_smoke_SpecialNamesInterface_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_SpecialNamesInterface_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_SpecialNamesInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::SpecialNamesInterface>(
            *reinterpret_cast<std::shared_ptr<smoke::SpecialNamesInterface>*>(handle)
        )
    );
}

void
library_smoke_SpecialNamesInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::SpecialNamesInterface>*>(handle);
}

// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_SpecialNamesInterface_Callback_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    library_smoke_SpecialNamesInterface_Callback_release_handle(handle);
}

void
library_smoke_SpecialNamesInterface_Callback_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_SpecialNamesInterface_Callback_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_SpecialNamesInterface_Callback_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) smoke::SpecialNamesInterface::Callback(
            *reinterpret_cast<smoke::SpecialNamesInterface::Callback*>(handle)
        )
    );
}

void
library_smoke_SpecialNamesInterface_Callback_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::SpecialNamesInterface::Callback*>(handle);
}

FfiOpaqueHandle
library_smoke_SpecialNamesInterface_Callback_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::SpecialNamesInterface::Callback>(
            gluecodium::ffi::Conversion<smoke::SpecialNamesInterface::Callback>::toCpp(value)
        )
    );
}

void
library_smoke_SpecialNamesInterface_Callback_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::SpecialNamesInterface::Callback>*>(handle);
}

FfiOpaqueHandle
library_smoke_SpecialNamesInterface_Callback_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::SpecialNamesInterface::Callback>::toFfi(
        **reinterpret_cast<std::optional<smoke::SpecialNamesInterface::Callback>*>(handle)
    );
}


FfiOpaqueHandle
library_smoke_SpecialNamesInterface_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_SpecialNamesInterface_Proxy>(token, isolate_id, "smoke_SpecialNamesInterface");
    std::shared_ptr<smoke_SpecialNamesInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SpecialNamesInterface_Proxy>(cached_proxy);
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SpecialNamesInterface_Proxy>(
            new (std::nothrow) smoke_SpecialNamesInterface_Proxy(token, isolate_id, dart_handle, close_callbacks, f0)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_SpecialNamesInterface", *proxy_ptr);
    }

    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}



FfiOpaqueHandle
library_smoke_SpecialNamesInterface_Callback_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {

    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_SpecialNamesInterface_Callback_Proxy>(token, isolate_id, "smoke_SpecialNamesInterface_Callback");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_SpecialNamesInterface_Callback_Proxy>(token, isolate_id, dart_handle, close_callbacks, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_SpecialNamesInterface_Callback", cached_proxy);
    } else {
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    }


    return reinterpret_cast<FfiOpaqueHandle>(
        new smoke::SpecialNamesInterface::Callback(
            std::bind(&smoke_SpecialNamesInterface_Callback_Proxy::operator(), cached_proxy)
        )
    );
}




FfiOpaqueHandle
library_smoke_SpecialNamesInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::SpecialNamesInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}

#ifdef __cplusplus
}
#endif
