#include "ffi_smoke_Lambdas.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Lambdas.h"
#include <cstdint>
#include <functional>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>
#include <memory>
#include <new>
class smoke_Lambdas_Producer_Proxy {
public:
    smoke_Lambdas_Producer_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0) {
    }
    ~smoke_Lambdas_Producer_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_Lambdas_Producer");
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
    smoke_Lambdas_Producer_Proxy(const smoke_Lambdas_Producer_Proxy&) = delete;
    smoke_Lambdas_Producer_Proxy& operator=(const smoke_Lambdas_Producer_Proxy&) = delete;
    std::string
    operator()() {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle*)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
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
    const FfiOpaqueHandle f0;
    inline void dispatch(std::function<void()>&& callback) const
    {
        gluecodium::ffi::IsolateContext::is_current(isolate_id)
            ? callback()
            : gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
    }
};
class smoke_Lambdas_Confuser_Proxy {
public:
    smoke_Lambdas_Confuser_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0) {
    }
    ~smoke_Lambdas_Confuser_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_Lambdas_Confuser");
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
    smoke_Lambdas_Confuser_Proxy(const smoke_Lambdas_Confuser_Proxy&) = delete;
    smoke_Lambdas_Confuser_Proxy& operator=(const smoke_Lambdas_Confuser_Proxy&) = delete;
    smoke::Lambdas::Producer
    operator()(const std::string& p0) {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle, FfiOpaqueHandle*)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<std::string>::toFfi(p0),
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<smoke::Lambdas::Producer>::toCpp(_result_handle);
        delete reinterpret_cast<smoke::Lambdas::Producer*>(_result_handle);
        return _result;
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
class smoke_Lambdas_Consumer_Proxy {
public:
    smoke_Lambdas_Consumer_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0) {
    }
    ~smoke_Lambdas_Consumer_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_Lambdas_Consumer");
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
    smoke_Lambdas_Consumer_Proxy(const smoke_Lambdas_Consumer_Proxy&) = delete;
    smoke_Lambdas_Consumer_Proxy& operator=(const smoke_Lambdas_Consumer_Proxy&) = delete;
    void
    operator()(const std::string& p0) {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<std::string>::toFfi(p0)
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
class smoke_Lambdas_Indexer_Proxy {
public:
    smoke_Lambdas_Indexer_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0) {
    }
    ~smoke_Lambdas_Indexer_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_Lambdas_Indexer");
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
    smoke_Lambdas_Indexer_Proxy(const smoke_Lambdas_Indexer_Proxy&) = delete;
    smoke_Lambdas_Indexer_Proxy& operator=(const smoke_Lambdas_Indexer_Proxy&) = delete;
    int32_t
    operator()(const std::string& p0, const float p1) {
        int32_t _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle, float, int32_t*)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<std::string>::toFfi(p0),
            gluecodium::ffi::Conversion<float>::toFfi(p1),
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<int32_t>::toCpp(_result_handle);
        ;
        return _result;
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
class smoke_Lambdas_NullableConfuser_Proxy {
public:
    smoke_Lambdas_NullableConfuser_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0) {
    }
    ~smoke_Lambdas_NullableConfuser_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_Lambdas_NullableConfuser");
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
    smoke_Lambdas_NullableConfuser_Proxy(const smoke_Lambdas_NullableConfuser_Proxy&) = delete;
    smoke_Lambdas_NullableConfuser_Proxy& operator=(const smoke_Lambdas_NullableConfuser_Proxy&) = delete;
    gluecodium::optional<smoke::Lambdas::Producer>
    operator()(const gluecodium::optional<std::string>& p0) {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle, FfiOpaqueHandle*)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toFfi(p0),
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<gluecodium::optional<smoke::Lambdas::Producer>>::toCpp(_result_handle);
        delete reinterpret_cast<gluecodium::optional<smoke::Lambdas::Producer>*>(_result_handle);
        return _result;
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
FfiOpaqueHandle
library_smoke_Lambdas_deconfuse__String_Confuser(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value, FfiOpaqueHandle confuser) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::Lambdas::Producer>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Lambdas>>::toCpp(_self)).deconfuse(
            gluecodium::ffi::Conversion<std::string>::toCpp(value),
            gluecodium::ffi::Conversion<smoke::Lambdas::Confuser>::toCpp(confuser)
        )
    );
}
FfiOpaqueHandle
library_smoke_Lambdas_fuse__ListOf_String_Indexer(int32_t _isolate_id, FfiOpaqueHandle items, FfiOpaqueHandle callback) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::string>>::toFfi(
        smoke::Lambdas::fuse(
            gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(items),
            gluecodium::ffi::Conversion<smoke::Lambdas::Indexer>::toCpp(callback)
        )
    );
}
FfiOpaqueHandle
library_smoke_Lambdas_Producer_call(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        gluecodium::ffi::Conversion<smoke::Lambdas::Producer>::toCpp(_self).operator()()
    );
}
FfiOpaqueHandle
library_smoke_Lambdas_Confuser_call__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle p0) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::Lambdas::Producer>::toFfi(
        gluecodium::ffi::Conversion<smoke::Lambdas::Confuser>::toCpp(_self).operator()(
            gluecodium::ffi::Conversion<std::string>::toCpp(p0)
        )
    );
}
void
library_smoke_Lambdas_Consumer_call__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle p0) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    gluecodium::ffi::Conversion<smoke::Lambdas::Consumer>::toCpp(_self).operator()(
        gluecodium::ffi::Conversion<std::string>::toCpp(p0)
    );
}
int32_t
library_smoke_Lambdas_Indexer_call__String_Float(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle p0, float p1) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        gluecodium::ffi::Conversion<smoke::Lambdas::Indexer>::toCpp(_self).operator()(
            gluecodium::ffi::Conversion<std::string>::toCpp(p0),
            gluecodium::ffi::Conversion<float>::toCpp(p1)
        )
    );
}
FfiOpaqueHandle
library_smoke_Lambdas_NullableConfuser_call__String_(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle p0) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<gluecodium::optional<smoke::Lambdas::Producer>>::toFfi(
        gluecodium::ffi::Conversion<smoke::Lambdas::NullableConfuser>::toCpp(_self).operator()(
            gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toCpp(p0)
        )
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Lambdas_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::Lambdas>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_Lambdas_release_handle(handle);
}
void
library_smoke_Lambdas_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Lambdas_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Lambdas_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::Lambdas>(
            *reinterpret_cast<std::shared_ptr<smoke::Lambdas>*>(handle)
        )
    );
}
void
library_smoke_Lambdas_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::Lambdas>*>(handle);
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Lambdas_Producer_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    library_smoke_Lambdas_Producer_release_handle(handle);
}
void
library_smoke_Lambdas_Producer_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Lambdas_Producer_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Lambdas_Producer_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) smoke::Lambdas::Producer(
            *reinterpret_cast<smoke::Lambdas::Producer*>(handle)
        )
    );
}
void
library_smoke_Lambdas_Producer_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Lambdas::Producer*>(handle);
}
FfiOpaqueHandle
library_smoke_Lambdas_Producer_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::Lambdas::Producer>(
            gluecodium::ffi::Conversion<smoke::Lambdas::Producer>::toCpp(value)
        )
    );
}
void
library_smoke_Lambdas_Producer_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::Lambdas::Producer>*>(handle);
}
FfiOpaqueHandle
library_smoke_Lambdas_Producer_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Lambdas::Producer>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::Lambdas::Producer>*>(handle)
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Lambdas_Confuser_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    library_smoke_Lambdas_Confuser_release_handle(handle);
}
void
library_smoke_Lambdas_Confuser_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Lambdas_Confuser_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Lambdas_Confuser_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) smoke::Lambdas::Confuser(
            *reinterpret_cast<smoke::Lambdas::Confuser*>(handle)
        )
    );
}
void
library_smoke_Lambdas_Confuser_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Lambdas::Confuser*>(handle);
}
FfiOpaqueHandle
library_smoke_Lambdas_Confuser_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::Lambdas::Confuser>(
            gluecodium::ffi::Conversion<smoke::Lambdas::Confuser>::toCpp(value)
        )
    );
}
void
library_smoke_Lambdas_Confuser_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::Lambdas::Confuser>*>(handle);
}
FfiOpaqueHandle
library_smoke_Lambdas_Confuser_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Lambdas::Confuser>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::Lambdas::Confuser>*>(handle)
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Lambdas_Consumer_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    library_smoke_Lambdas_Consumer_release_handle(handle);
}
void
library_smoke_Lambdas_Consumer_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Lambdas_Consumer_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Lambdas_Consumer_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) smoke::Lambdas::Consumer(
            *reinterpret_cast<smoke::Lambdas::Consumer*>(handle)
        )
    );
}
void
library_smoke_Lambdas_Consumer_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Lambdas::Consumer*>(handle);
}
FfiOpaqueHandle
library_smoke_Lambdas_Consumer_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::Lambdas::Consumer>(
            gluecodium::ffi::Conversion<smoke::Lambdas::Consumer>::toCpp(value)
        )
    );
}
void
library_smoke_Lambdas_Consumer_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::Lambdas::Consumer>*>(handle);
}
FfiOpaqueHandle
library_smoke_Lambdas_Consumer_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Lambdas::Consumer>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::Lambdas::Consumer>*>(handle)
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Lambdas_Indexer_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    library_smoke_Lambdas_Indexer_release_handle(handle);
}
void
library_smoke_Lambdas_Indexer_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Lambdas_Indexer_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Lambdas_Indexer_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) smoke::Lambdas::Indexer(
            *reinterpret_cast<smoke::Lambdas::Indexer*>(handle)
        )
    );
}
void
library_smoke_Lambdas_Indexer_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Lambdas::Indexer*>(handle);
}
FfiOpaqueHandle
library_smoke_Lambdas_Indexer_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::Lambdas::Indexer>(
            gluecodium::ffi::Conversion<smoke::Lambdas::Indexer>::toCpp(value)
        )
    );
}
void
library_smoke_Lambdas_Indexer_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::Lambdas::Indexer>*>(handle);
}
FfiOpaqueHandle
library_smoke_Lambdas_Indexer_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Lambdas::Indexer>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::Lambdas::Indexer>*>(handle)
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Lambdas_NullableConfuser_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    library_smoke_Lambdas_NullableConfuser_release_handle(handle);
}
void
library_smoke_Lambdas_NullableConfuser_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Lambdas_NullableConfuser_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Lambdas_NullableConfuser_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) smoke::Lambdas::NullableConfuser(
            *reinterpret_cast<smoke::Lambdas::NullableConfuser*>(handle)
        )
    );
}
void
library_smoke_Lambdas_NullableConfuser_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Lambdas::NullableConfuser*>(handle);
}
FfiOpaqueHandle
library_smoke_Lambdas_NullableConfuser_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::Lambdas::NullableConfuser>(
            gluecodium::ffi::Conversion<smoke::Lambdas::NullableConfuser>::toCpp(value)
        )
    );
}
void
library_smoke_Lambdas_NullableConfuser_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::Lambdas::NullableConfuser>*>(handle);
}
FfiOpaqueHandle
library_smoke_Lambdas_NullableConfuser_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Lambdas::NullableConfuser>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::Lambdas::NullableConfuser>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Lambdas_Producer_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_Lambdas_Producer_Proxy>(token, isolate_id, "smoke_Lambdas_Producer");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_Lambdas_Producer_Proxy>(token, isolate_id, dart_handle, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_Lambdas_Producer", cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new smoke::Lambdas::Producer(
            std::bind(&smoke_Lambdas_Producer_Proxy::operator(), cached_proxy)
        )
    );
}
FfiOpaqueHandle
library_smoke_Lambdas_Confuser_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_Lambdas_Confuser_Proxy>(token, isolate_id, "smoke_Lambdas_Confuser");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_Lambdas_Confuser_Proxy>(token, isolate_id, dart_handle, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_Lambdas_Confuser", cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new smoke::Lambdas::Confuser(
            std::bind(&smoke_Lambdas_Confuser_Proxy::operator(), cached_proxy, std::placeholders::_1)
        )
    );
}
FfiOpaqueHandle
library_smoke_Lambdas_Consumer_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_Lambdas_Consumer_Proxy>(token, isolate_id, "smoke_Lambdas_Consumer");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_Lambdas_Consumer_Proxy>(token, isolate_id, dart_handle, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_Lambdas_Consumer", cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new smoke::Lambdas::Consumer(
            std::bind(&smoke_Lambdas_Consumer_Proxy::operator(), cached_proxy, std::placeholders::_1)
        )
    );
}
FfiOpaqueHandle
library_smoke_Lambdas_Indexer_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_Lambdas_Indexer_Proxy>(token, isolate_id, "smoke_Lambdas_Indexer");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_Lambdas_Indexer_Proxy>(token, isolate_id, dart_handle, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_Lambdas_Indexer", cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new smoke::Lambdas::Indexer(
            std::bind(&smoke_Lambdas_Indexer_Proxy::operator(), cached_proxy, std::placeholders::_1, std::placeholders::_2)
        )
    );
}
FfiOpaqueHandle
library_smoke_Lambdas_NullableConfuser_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_Lambdas_NullableConfuser_Proxy>(token, isolate_id, "smoke_Lambdas_NullableConfuser");
    if (!cached_proxy) {
        cached_proxy = std::make_shared<smoke_Lambdas_NullableConfuser_Proxy>(token, isolate_id, dart_handle, f0);
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_Lambdas_NullableConfuser", cached_proxy);
    }
    return reinterpret_cast<FfiOpaqueHandle>(
        new smoke::Lambdas::NullableConfuser(
            std::bind(&smoke_Lambdas_NullableConfuser_Proxy::operator(), cached_proxy, std::placeholders::_1)
        )
    );
}
#ifdef __cplusplus
}
#endif
