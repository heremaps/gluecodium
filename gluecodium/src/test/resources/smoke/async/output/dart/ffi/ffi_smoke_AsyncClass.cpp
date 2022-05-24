#include "ffi_smoke_AsyncClass.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "smoke/AsyncClass.h"
#include <cstdint>
#include <memory>
#include <stdbool.h>
#include <string>
#include <memory>
#include <new>
class smoke_AsyncClass_AsyncvoidCompleterlambda_Proxy {
public:
    smoke_AsyncClass_AsyncvoidCompleterlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0) {
    }
    ~smoke_AsyncClass_AsyncvoidCompleterlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncvoidCompleterlambda");
        auto dart_persistent_handle_local = dart_persistent_handle;
        auto deleter = [dart_persistent_handle_local]() {
            Dart_DeletePersistentHandle_DL(dart_persistent_handle_local);
        };
        if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            deleter();
        } else {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, deleter);
        }
    }
    smoke_AsyncClass_AsyncvoidCompleterlambda_Proxy(const smoke_AsyncClass_AsyncvoidCompleterlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncvoidCompleterlambda_Proxy& operator=(const smoke_AsyncClass_AsyncvoidCompleterlambda_Proxy&) = delete;
    void
    operator()() {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle)
        ); });
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f0;
    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};
class smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_Proxy {
public:
    smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0) {
    }
    ~smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncvoidthrowsCompleterlambda");
        auto dart_persistent_handle_local = dart_persistent_handle;
        auto deleter = [dart_persistent_handle_local]() {
            Dart_DeletePersistentHandle_DL(dart_persistent_handle_local);
        };
        if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            deleter();
        } else {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, deleter);
        }
    }
    smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_Proxy(const smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_Proxy& operator=(const smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_Proxy&) = delete;
    void
    operator()(const bool p0, const std::string& p1) {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, bool, FfiOpaqueHandle)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<bool>::toFfi(p0),
            gluecodium::ffi::Conversion<std::string>::toFfi(p1)
        ); });
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f0;
    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};
class smoke_AsyncClass_AsyncintCompleterlambda_Proxy {
public:
    smoke_AsyncClass_AsyncintCompleterlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0) {
    }
    ~smoke_AsyncClass_AsyncintCompleterlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncintCompleterlambda");
        auto dart_persistent_handle_local = dart_persistent_handle;
        auto deleter = [dart_persistent_handle_local]() {
            Dart_DeletePersistentHandle_DL(dart_persistent_handle_local);
        };
        if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            deleter();
        } else {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, deleter);
        }
    }
    smoke_AsyncClass_AsyncintCompleterlambda_Proxy(const smoke_AsyncClass_AsyncintCompleterlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncintCompleterlambda_Proxy& operator=(const smoke_AsyncClass_AsyncintCompleterlambda_Proxy&) = delete;
    void
    operator()(const int32_t p0) {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, int32_t)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<int32_t>::toFfi(p0)
        ); });
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f0;
    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};
class smoke_AsyncClass_AsyncintthrowsCompleterlambda_Proxy {
public:
    smoke_AsyncClass_AsyncintthrowsCompleterlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0) {
    }
    ~smoke_AsyncClass_AsyncintthrowsCompleterlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncintthrowsCompleterlambda");
        auto dart_persistent_handle_local = dart_persistent_handle;
        auto deleter = [dart_persistent_handle_local]() {
            Dart_DeletePersistentHandle_DL(dart_persistent_handle_local);
        };
        if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            deleter();
        } else {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, deleter);
        }
    }
    smoke_AsyncClass_AsyncintthrowsCompleterlambda_Proxy(const smoke_AsyncClass_AsyncintthrowsCompleterlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncintthrowsCompleterlambda_Proxy& operator=(const smoke_AsyncClass_AsyncintthrowsCompleterlambda_Proxy&) = delete;
    void
    operator()(const bool p0, const int32_t p1, const std::string& p2) {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, bool, int32_t, FfiOpaqueHandle)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<bool>::toFfi(p0),
            gluecodium::ffi::Conversion<int32_t>::toFfi(p1),
            gluecodium::ffi::Conversion<std::string>::toFfi(p2)
        ); });
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f0;
    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};
class smoke_AsyncClass_AsyncstaticCompleterlambda_Proxy {
public:
    smoke_AsyncClass_AsyncstaticCompleterlambda_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0) {
    }
    ~smoke_AsyncClass_AsyncstaticCompleterlambda_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_AsyncClass_AsyncstaticCompleterlambda");
        auto dart_persistent_handle_local = dart_persistent_handle;
        auto deleter = [dart_persistent_handle_local]() {
            Dart_DeletePersistentHandle_DL(dart_persistent_handle_local);
        };
        if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            deleter();
        } else {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, deleter);
        }
    }
    smoke_AsyncClass_AsyncstaticCompleterlambda_Proxy(const smoke_AsyncClass_AsyncstaticCompleterlambda_Proxy&) = delete;
    smoke_AsyncClass_AsyncstaticCompleterlambda_Proxy& operator=(const smoke_AsyncClass_AsyncstaticCompleterlambda_Proxy&) = delete;
    void
    operator()() {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle)
        ); });
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
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
library_smoke_AsyncClass_asyncVoid__asyncVoid__completerLambda_Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle Completerlambda, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::AsyncClass>>::toCpp(_self)).async_void(
        gluecodium::ffi::Conversion<std::function<void()>>::toCpp(Completerlambda),
        gluecodium::ffi::Conversion<bool>::toCpp(input)
    );
}
void
library_smoke_AsyncClass_asyncVoidThrows__asyncVoidThrows__completerLambda_Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle Completerlambda, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::AsyncClass>>::toCpp(_self)).async_void_throws(
        gluecodium::ffi::Conversion<std::function<void(bool, std::string)>>::toCpp(Completerlambda),
        gluecodium::ffi::Conversion<bool>::toCpp(input)
    );
}
void
library_smoke_AsyncClass_asyncInt__asyncInt__completerLambda_Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle Completerlambda, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::AsyncClass>>::toCpp(_self)).async_int(
        gluecodium::ffi::Conversion<std::function<void(int32_t)>>::toCpp(Completerlambda),
        gluecodium::ffi::Conversion<bool>::toCpp(input)
    );
}
void
library_smoke_AsyncClass_asyncIntThrows__asyncIntThrows__completerLambda_Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle Completerlambda, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::AsyncClass>>::toCpp(_self)).async_int_throws(
        gluecodium::ffi::Conversion<std::function<void(bool, int32_t, std::string)>>::toCpp(Completerlambda),
        gluecodium::ffi::Conversion<bool>::toCpp(input)
    );
}
void
library_smoke_AsyncClass_asyncStatic__asyncStatic__completerLambda_Boolean(int32_t _isolate_id, FfiOpaqueHandle Completerlambda, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    smoke::AsyncClass::async_static(
        gluecodium::ffi::Conversion<std::function<void()>>::toCpp(Completerlambda),
        gluecodium::ffi::Conversion<bool>::toCpp(input)
    );
}
void
library_smoke_AsyncClass_AsyncvoidCompleterlambda_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void()>>::toCpp(_self).operator()();
}
void
library_smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_call__Boolean_String(FfiOpaqueHandle _self, int32_t _isolate_id, bool p0, FfiOpaqueHandle p1) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void(const bool, const std::string)>>::toCpp(_self).operator()(
        gluecodium::ffi::Conversion<bool>::toCpp(p0),
        gluecodium::ffi::Conversion<std::string>::toCpp(p1)
    );
}
void
library_smoke_AsyncClass_AsyncintCompleterlambda_call__Int(FfiOpaqueHandle _self, int32_t _isolate_id, int32_t p0) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void(const int32_t)>>::toCpp(_self).operator()(
        gluecodium::ffi::Conversion<int32_t>::toCpp(p0)
    );
}
void
library_smoke_AsyncClass_AsyncintthrowsCompleterlambda_call__Boolean_Int_String(FfiOpaqueHandle _self, int32_t _isolate_id, bool p0, int32_t p1, FfiOpaqueHandle p2) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<::std::function<void(const bool, const int32_t, const std::string)>>::toCpp(_self).operator()(
        gluecodium::ffi::Conversion<bool>::toCpp(p0),
        gluecodium::ffi::Conversion<int32_t>::toCpp(p1),
        gluecodium::ffi::Conversion<std::string>::toCpp(p2)
    );
}
void
library_smoke_AsyncClass_AsyncstaticCompleterlambda_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
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
library_smoke_AsyncClass_AsyncvoidCompleterlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void()>*>(handle);
}
void
library_smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void(const bool, const std::string)>*>(handle);
}
void
library_smoke_AsyncClass_AsyncintCompleterlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void(const int32_t)>*>(handle);
}
void
library_smoke_AsyncClass_AsyncintthrowsCompleterlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void(const bool, const int32_t, const std::string)>*>(handle);
}
void
library_smoke_AsyncClass_AsyncstaticCompleterlambda_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::std::function<void()>*>(handle);
}
FfiOpaqueHandle
library_smoke_AsyncClass_AsyncvoidCompleterlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncvoidCompleterlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncvoidCompleterlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncvoidCompleterlambda_Proxy>(token, isolate_id, dart_handle, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncvoidCompleterlambda", cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void()>(
            std::bind(&smoke_AsyncClass_AsyncvoidCompleterlambda_Proxy::operator(), cached_proxy)
        )
    );
}
FfiOpaqueHandle
library_smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncvoidthrowsCompleterlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_Proxy>(token, isolate_id, dart_handle, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncvoidthrowsCompleterlambda", cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void(const bool, const std::string)>(
            std::bind(&smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_Proxy::operator(), cached_proxy, std::placeholders::_1, std::placeholders::_2)
        )
    );
}
FfiOpaqueHandle
library_smoke_AsyncClass_AsyncintCompleterlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncintCompleterlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncintCompleterlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncintCompleterlambda_Proxy>(token, isolate_id, dart_handle, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncintCompleterlambda", cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void(const int32_t)>(
            std::bind(&smoke_AsyncClass_AsyncintCompleterlambda_Proxy::operator(), cached_proxy, std::placeholders::_1)
        )
    );
}
FfiOpaqueHandle
library_smoke_AsyncClass_AsyncintthrowsCompleterlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncintthrowsCompleterlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncintthrowsCompleterlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncintthrowsCompleterlambda_Proxy>(token, isolate_id, dart_handle, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncintthrowsCompleterlambda", cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void(const bool, const int32_t, const std::string)>(
            std::bind(&smoke_AsyncClass_AsyncintthrowsCompleterlambda_Proxy::operator(), cached_proxy, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3)
        )
    );
}
FfiOpaqueHandle
library_smoke_AsyncClass_AsyncstaticCompleterlambda_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_AsyncClass_AsyncstaticCompleterlambda_Proxy>(token, isolate_id, "smoke_AsyncClass_AsyncstaticCompleterlambda");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_AsyncClass_AsyncstaticCompleterlambda_Proxy>(token, isolate_id, dart_handle, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_AsyncClass_AsyncstaticCompleterlambda", cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::std::function<void()>(
            std::bind(&smoke_AsyncClass_AsyncstaticCompleterlambda_Proxy::operator(), cached_proxy)
        )
    );
}
#ifdef __cplusplus
}
#endif
