
#include "ffi_smoke_OuterInterface.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/OuterInterface.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#include <thread>

class smoke_OuterInterface_Proxy : public smoke::OuterInterface {
public:
    smoke_OuterInterface_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), isolate_thread_id(std::this_thread::get_id()), f0(f0) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }

    ~smoke_OuterInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_OuterInterface");

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

    smoke_OuterInterface_Proxy(const smoke_OuterInterface_Proxy&) = delete;
    smoke_OuterInterface_Proxy& operator=(const smoke_OuterInterface_Proxy&) = delete;

    std::string
    foo(const std::string& input) override {
        FfiOpaqueHandle _result_handle;
        
        dispatch([&]() { (*reinterpret_cast<void (*)(FfiOpaqueHandle, FfiOpaqueHandle*)>(f0))(
            gluecodium::ffi::Conversion<std::string>::toFfi(input), 
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
            gluecodium::ffi::cbqm.executeCallbackInIsolateScope(isolate_id, isolate_handle, std::move(callback));
        }
    }
};

class smoke_OuterInterface_InnerInterface_Proxy : public smoke::OuterInterface::InnerInterface {
public:
    smoke_OuterInterface_InnerInterface_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), isolate_thread_id(std::this_thread::get_id()), f0(f0) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }

    ~smoke_OuterInterface_InnerInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_OuterInterface_InnerInterface");

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

    smoke_OuterInterface_InnerInterface_Proxy(const smoke_OuterInterface_InnerInterface_Proxy&) = delete;
    smoke_OuterInterface_InnerInterface_Proxy& operator=(const smoke_OuterInterface_InnerInterface_Proxy&) = delete;

    std::string
    foo(const std::string& input) override {
        FfiOpaqueHandle _result_handle;
        
        dispatch([&]() { (*reinterpret_cast<void (*)(FfiOpaqueHandle, FfiOpaqueHandle*)>(f0))(
            gluecodium::ffi::Conversion<std::string>::toFfi(input), 
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
            gluecodium::ffi::cbqm.executeCallbackInIsolateScope(isolate_id, isolate_handle, std::move(callback));
        }
    }
};


#ifdef __cplusplus
extern "C" {
#endif




FfiOpaqueHandle
library_smoke_OuterInterface_foo__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::OuterInterface>>::toCpp(_self)).foo(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}

















FfiOpaqueHandle
library_smoke_OuterInterface_InnerClass_foo__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::OuterInterface::InnerClass>>::toCpp(_self)).foo(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}



















FfiOpaqueHandle
library_smoke_OuterInterface_InnerInterface_foo__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::OuterInterface::InnerInterface>>::toCpp(_self)).foo(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}

















// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_OuterInterface_InnerClass_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::OuterInterface::InnerClass>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_OuterInterface_InnerClass_release_handle(handle);
}

void
library_smoke_OuterInterface_InnerClass_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_OuterInterface_InnerClass_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_OuterInterface_InnerClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::OuterInterface::InnerClass>(
            *reinterpret_cast<std::shared_ptr<smoke::OuterInterface::InnerClass>*>(handle)
        )
    );
}

void
library_smoke_OuterInterface_InnerClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::OuterInterface::InnerClass>*>(handle);
}

// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_OuterInterface_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::OuterInterface>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_OuterInterface_release_handle(handle);
}

void
library_smoke_OuterInterface_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_OuterInterface_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_OuterInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::OuterInterface>(
            *reinterpret_cast<std::shared_ptr<smoke::OuterInterface>*>(handle)
        )
    );
}

void
library_smoke_OuterInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::OuterInterface>*>(handle);
}

// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_OuterInterface_InnerInterface_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::OuterInterface::InnerInterface>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_OuterInterface_InnerInterface_release_handle(handle);
}

void
library_smoke_OuterInterface_InnerInterface_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_OuterInterface_InnerInterface_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_OuterInterface_InnerInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::OuterInterface::InnerInterface>(
            *reinterpret_cast<std::shared_ptr<smoke::OuterInterface::InnerInterface>*>(handle)
        )
    );
}

void
library_smoke_OuterInterface_InnerInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::OuterInterface::InnerInterface>*>(handle);
}


FfiOpaqueHandle
library_smoke_OuterInterface_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_OuterInterface_Proxy>(token, isolate_id, "smoke_OuterInterface");
    std::shared_ptr<smoke_OuterInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_OuterInterface_Proxy>(cached_proxy);
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_OuterInterface_Proxy>(
            new (std::nothrow) smoke_OuterInterface_Proxy(token, isolate_id, dart_handle, close_callbacks, f0)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_OuterInterface", *proxy_ptr);
    }

    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}

FfiOpaqueHandle
library_smoke_OuterInterface_InnerInterface_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_OuterInterface_InnerInterface_Proxy>(token, isolate_id, "smoke_OuterInterface_InnerInterface");
    std::shared_ptr<smoke_OuterInterface_InnerInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_OuterInterface_InnerInterface_Proxy>(cached_proxy);
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_OuterInterface_InnerInterface_Proxy>(
            new (std::nothrow) smoke_OuterInterface_InnerInterface_Proxy(token, isolate_id, dart_handle, close_callbacks, f0)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_OuterInterface_InnerInterface", *proxy_ptr);
    }

    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}





FfiOpaqueHandle
library_smoke_OuterInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::OuterInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
FfiOpaqueHandle
library_smoke_OuterInterface_InnerInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::OuterInterface::InnerInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}

#ifdef __cplusplus
}
#endif
