
#include "ffi_smoke_AsyncClass.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "smoke/AsyncClass.h"
#include "smoke/AsyncErrorCode.h"
#include <cstdint>
#include <memory>
#include <stdbool.h>
#include <memory>
#include <new>

class smoke_AsyncClass_AsyncvoidResultlambda_Proxy {
public:
    smoke_AsyncClass_AsyncvoidResultlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), f0(f0) {
    }

    ~smoke_AsyncClass_AsyncvoidResultlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncvoidResultlambda");

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

    smoke_AsyncClass_AsyncvoidResultlambda_Proxy(const smoke_AsyncClass_AsyncvoidResultlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncvoidResultlambda_Proxy& operator=(const smoke_AsyncClass_AsyncvoidResultlambda_Proxy&) = delete;

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
    const FfiOpaqueHandle f0;

    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};

class smoke_AsyncClass_AsyncvoidthrowsResultlambda_Proxy {
public:
    smoke_AsyncClass_AsyncvoidthrowsResultlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), f0(f0) {
    }

    ~smoke_AsyncClass_AsyncvoidthrowsResultlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncvoidthrowsResultlambda");

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

    smoke_AsyncClass_AsyncvoidthrowsResultlambda_Proxy(const smoke_AsyncClass_AsyncvoidthrowsResultlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncvoidthrowsResultlambda_Proxy& operator=(const smoke_AsyncClass_AsyncvoidthrowsResultlambda_Proxy&) = delete;

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
    const FfiOpaqueHandle f0;

    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};

class smoke_AsyncClass_AsyncvoidthrowsErrorlambda_Proxy {
public:
    smoke_AsyncClass_AsyncvoidthrowsErrorlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), f0(f0) {
    }

    ~smoke_AsyncClass_AsyncvoidthrowsErrorlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncvoidthrowsErrorlambda");

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

    smoke_AsyncClass_AsyncvoidthrowsErrorlambda_Proxy(const smoke_AsyncClass_AsyncvoidthrowsErrorlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncvoidthrowsErrorlambda_Proxy& operator=(const smoke_AsyncClass_AsyncvoidthrowsErrorlambda_Proxy&) = delete;

    void
    operator()(const smoke::AsyncErrorCode p0) {
        
        
        dispatch([&]() { (*reinterpret_cast<void (*)(uint32_t)>(f0))(
            gluecodium::ffi::Conversion<smoke::AsyncErrorCode>::toFfi(p0)
        ); });
    }



private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f_close_callbacks;
    const Dart_Isolate isolate_handle;
    const FfiOpaqueHandle f0;

    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};

class smoke_AsyncClass_AsyncintResultlambda_Proxy {
public:
    smoke_AsyncClass_AsyncintResultlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), f0(f0) {
    }

    ~smoke_AsyncClass_AsyncintResultlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncintResultlambda");

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

    smoke_AsyncClass_AsyncintResultlambda_Proxy(const smoke_AsyncClass_AsyncintResultlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncintResultlambda_Proxy& operator=(const smoke_AsyncClass_AsyncintResultlambda_Proxy&) = delete;

    void
    operator()(const int32_t p0) {
        
        
        dispatch([&]() { (*reinterpret_cast<void (*)(int32_t)>(f0))(
            gluecodium::ffi::Conversion<int32_t>::toFfi(p0)
        ); });
    }



private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f_close_callbacks;
    const Dart_Isolate isolate_handle;
    const FfiOpaqueHandle f0;

    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};

class smoke_AsyncClass_AsyncintthrowsResultlambda_Proxy {
public:
    smoke_AsyncClass_AsyncintthrowsResultlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), f0(f0) {
    }

    ~smoke_AsyncClass_AsyncintthrowsResultlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncintthrowsResultlambda");

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

    smoke_AsyncClass_AsyncintthrowsResultlambda_Proxy(const smoke_AsyncClass_AsyncintthrowsResultlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncintthrowsResultlambda_Proxy& operator=(const smoke_AsyncClass_AsyncintthrowsResultlambda_Proxy&) = delete;

    void
    operator()(const int32_t p0) {
        
        
        dispatch([&]() { (*reinterpret_cast<void (*)(int32_t)>(f0))(
            gluecodium::ffi::Conversion<int32_t>::toFfi(p0)
        ); });
    }



private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f_close_callbacks;
    const Dart_Isolate isolate_handle;
    const FfiOpaqueHandle f0;

    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};

class smoke_AsyncClass_AsyncintthrowsErrorlambda_Proxy {
public:
    smoke_AsyncClass_AsyncintthrowsErrorlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), f0(f0) {
    }

    ~smoke_AsyncClass_AsyncintthrowsErrorlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncintthrowsErrorlambda");

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

    smoke_AsyncClass_AsyncintthrowsErrorlambda_Proxy(const smoke_AsyncClass_AsyncintthrowsErrorlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncintthrowsErrorlambda_Proxy& operator=(const smoke_AsyncClass_AsyncintthrowsErrorlambda_Proxy&) = delete;

    void
    operator()(const smoke::AsyncErrorCode p0) {
        
        
        dispatch([&]() { (*reinterpret_cast<void (*)(uint32_t)>(f0))(
            gluecodium::ffi::Conversion<smoke::AsyncErrorCode>::toFfi(p0)
        ); });
    }



private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f_close_callbacks;
    const Dart_Isolate isolate_handle;
    const FfiOpaqueHandle f0;

    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};

class smoke_AsyncClass_AsyncstaticResultlambda_Proxy {
public:
    smoke_AsyncClass_AsyncstaticResultlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), f0(f0) {
    }

    ~smoke_AsyncClass_AsyncstaticResultlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncstaticResultlambda");

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

    smoke_AsyncClass_AsyncstaticResultlambda_Proxy(const smoke_AsyncClass_AsyncstaticResultlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncstaticResultlambda_Proxy& operator=(const smoke_AsyncClass_AsyncstaticResultlambda_Proxy&) = delete;

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
library_smoke_AsyncClass_asyncVoid__asyncVoid__resultLambda_Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle Resultlambda, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::AsyncClass>>::toCpp(_self)).async_void(
        gluecodium::ffi::Conversion<std::function<void()>>::toCpp(Resultlambda),
        gluecodium::ffi::Conversion<bool>::toCpp(input)
    );
}



void
library_smoke_AsyncClass_asyncVoidThrows__asyncVoidThrows__resultLambda_asyncVoidThrows__errorLambda_Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle Resultlambda, FfiOpaqueHandle Errorlambda, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::AsyncClass>>::toCpp(_self)).async_void_throws(
        gluecodium::ffi::Conversion<std::function<void()>>::toCpp(Resultlambda),
        gluecodium::ffi::Conversion<std::function<void(smoke::AsyncErrorCode)>>::toCpp(Errorlambda),
        gluecodium::ffi::Conversion<bool>::toCpp(input)
    );
}



void
library_smoke_AsyncClass_asyncInt__asyncInt__resultLambda_Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle Resultlambda, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::AsyncClass>>::toCpp(_self)).async_int(
        gluecodium::ffi::Conversion<std::function<void(int32_t)>>::toCpp(Resultlambda),
        gluecodium::ffi::Conversion<bool>::toCpp(input)
    );
}



void
library_smoke_AsyncClass_asyncIntThrows__asyncIntThrows__resultLambda_asyncIntThrows__errorLambda_Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle Resultlambda, FfiOpaqueHandle Errorlambda, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::AsyncClass>>::toCpp(_self)).async_int_throws(
        gluecodium::ffi::Conversion<std::function<void(int32_t)>>::toCpp(Resultlambda),
        gluecodium::ffi::Conversion<std::function<void(smoke::AsyncErrorCode)>>::toCpp(Errorlambda),
        gluecodium::ffi::Conversion<bool>::toCpp(input)
    );
}



void
library_smoke_AsyncClass_asyncStatic__asyncStatic__resultLambda_Boolean(int32_t _isolate_id, FfiOpaqueHandle Resultlambda, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    smoke::AsyncClass::async_static(
        gluecodium::ffi::Conversion<std::function<void()>>::toCpp(Resultlambda),
        gluecodium::ffi::Conversion<bool>::toCpp(input)
    );
}













void
library_smoke_AsyncClass_AsyncvoidResultlambda_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void()>>::toCpp(_self).operator()();
}



void
library_smoke_AsyncClass_AsyncvoidthrowsResultlambda_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void()>>::toCpp(_self).operator()();
}



void
library_smoke_AsyncClass_AsyncvoidthrowsErrorlambda_call__AsyncErrorCode(FfiOpaqueHandle _self, int32_t _isolate_id, uint32_t p0) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void(const smoke::AsyncErrorCode)>>::toCpp(_self).operator()(
        gluecodium::ffi::Conversion<smoke::AsyncErrorCode>::toCpp(p0)
    );
}



void
library_smoke_AsyncClass_AsyncintResultlambda_call__Int(FfiOpaqueHandle _self, int32_t _isolate_id, int32_t p0) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void(const int32_t)>>::toCpp(_self).operator()(
        gluecodium::ffi::Conversion<int32_t>::toCpp(p0)
    );
}



void
library_smoke_AsyncClass_AsyncintthrowsResultlambda_call__Int(FfiOpaqueHandle _self, int32_t _isolate_id, int32_t p0) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void(const int32_t)>>::toCpp(_self).operator()(
        gluecodium::ffi::Conversion<int32_t>::toCpp(p0)
    );
}



void
library_smoke_AsyncClass_AsyncintthrowsErrorlambda_call__AsyncErrorCode(FfiOpaqueHandle _self, int32_t _isolate_id, uint32_t p0) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void(const smoke::AsyncErrorCode)>>::toCpp(_self).operator()(
        gluecodium::ffi::Conversion<smoke::AsyncErrorCode>::toCpp(p0)
    );
}



void
library_smoke_AsyncClass_AsyncstaticResultlambda_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void()>>::toCpp(_self).operator()();
}





// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_AsyncClass_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::AsyncClass>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_AsyncClass_release_handle(handle);
}

void
library_smoke_AsyncClass_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_AsyncClass_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_AsyncClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::AsyncClass>(
            *reinterpret_cast<std::shared_ptr<smoke::AsyncClass>*>(handle)
        )
    );
}

void
library_smoke_AsyncClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::AsyncClass>*>(handle);
}

void
library_smoke_AsyncClass_AsyncvoidResultlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void()>*>(handle);
}
void
library_smoke_AsyncClass_AsyncvoidthrowsResultlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void()>*>(handle);
}
void
library_smoke_AsyncClass_AsyncvoidthrowsErrorlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void(const smoke::AsyncErrorCode)>*>(handle);
}
void
library_smoke_AsyncClass_AsyncintResultlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void(const int32_t)>*>(handle);
}
void
library_smoke_AsyncClass_AsyncintthrowsResultlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void(const int32_t)>*>(handle);
}
void
library_smoke_AsyncClass_AsyncintthrowsErrorlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void(const smoke::AsyncErrorCode)>*>(handle);
}
void
library_smoke_AsyncClass_AsyncstaticResultlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void()>*>(handle);
}



FfiOpaqueHandle
library_smoke_AsyncClass_AsyncvoidResultlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {

    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncvoidResultlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncvoidResultlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncvoidResultlambda_Proxy>(token, isolate_id, dart_handle, close_callbacks, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncvoidResultlambda", cached_proxy);
    } else {
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    }


    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void()>(
            std::bind(&smoke_AsyncClass_AsyncvoidResultlambda_Proxy::operator(), cached_proxy)
        )
    );
}


FfiOpaqueHandle
library_smoke_AsyncClass_AsyncvoidthrowsResultlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {

    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncvoidthrowsResultlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncvoidthrowsResultlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncvoidthrowsResultlambda_Proxy>(token, isolate_id, dart_handle, close_callbacks, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncvoidthrowsResultlambda", cached_proxy);
    } else {
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    }


    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void()>(
            std::bind(&smoke_AsyncClass_AsyncvoidthrowsResultlambda_Proxy::operator(), cached_proxy)
        )
    );
}


FfiOpaqueHandle
library_smoke_AsyncClass_AsyncvoidthrowsErrorlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {

    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncvoidthrowsErrorlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncvoidthrowsErrorlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncvoidthrowsErrorlambda_Proxy>(token, isolate_id, dart_handle, close_callbacks, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncvoidthrowsErrorlambda", cached_proxy);
    } else {
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    }


    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void(const smoke::AsyncErrorCode)>(
            std::bind(&smoke_AsyncClass_AsyncvoidthrowsErrorlambda_Proxy::operator(), cached_proxy, std::placeholders::_1)
        )
    );
}


FfiOpaqueHandle
library_smoke_AsyncClass_AsyncintResultlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {

    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncintResultlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncintResultlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncintResultlambda_Proxy>(token, isolate_id, dart_handle, close_callbacks, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncintResultlambda", cached_proxy);
    } else {
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    }


    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void(const int32_t)>(
            std::bind(&smoke_AsyncClass_AsyncintResultlambda_Proxy::operator(), cached_proxy, std::placeholders::_1)
        )
    );
}


FfiOpaqueHandle
library_smoke_AsyncClass_AsyncintthrowsResultlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {

    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncintthrowsResultlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncintthrowsResultlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncintthrowsResultlambda_Proxy>(token, isolate_id, dart_handle, close_callbacks, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncintthrowsResultlambda", cached_proxy);
    } else {
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    }


    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void(const int32_t)>(
            std::bind(&smoke_AsyncClass_AsyncintthrowsResultlambda_Proxy::operator(), cached_proxy, std::placeholders::_1)
        )
    );
}


FfiOpaqueHandle
library_smoke_AsyncClass_AsyncintthrowsErrorlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {

    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncintthrowsErrorlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncintthrowsErrorlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncintthrowsErrorlambda_Proxy>(token, isolate_id, dart_handle, close_callbacks, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncintthrowsErrorlambda", cached_proxy);
    } else {
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    }


    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void(const smoke::AsyncErrorCode)>(
            std::bind(&smoke_AsyncClass_AsyncintthrowsErrorlambda_Proxy::operator(), cached_proxy, std::placeholders::_1)
        )
    );
}


FfiOpaqueHandle
library_smoke_AsyncClass_AsyncstaticResultlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0) {

    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncstaticResultlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncstaticResultlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncstaticResultlambda_Proxy>(token, isolate_id, dart_handle, close_callbacks, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncstaticResultlambda", cached_proxy);
    } else {
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    }


    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void()>(
            std::bind(&smoke_AsyncClass_AsyncstaticResultlambda_Proxy::operator(), cached_proxy)
        )
    );
}





#ifdef __cplusplus
}
#endif
