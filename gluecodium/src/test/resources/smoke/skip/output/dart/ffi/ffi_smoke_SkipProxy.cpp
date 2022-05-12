#include "ffi_smoke_SkipProxy.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/SkipProxy.h"
#include <memory>
#include <stdbool.h>
#include <string>
#include <memory>
#include <new>
class smoke_SkipProxy_Proxy : public smoke::SkipProxy {
public:
    smoke_SkipProxy_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s, FfiOpaqueHandle p1g, FfiOpaqueHandle p1s)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0), f1(f1), p0g(p0g), p0s(p0s), p1g(p1g), p1s(p1s) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }
    ~smoke_SkipProxy_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_SkipProxy");
        auto raw_pointer_local = this;
        auto isolate_id_local = isolate_id;
        auto dart_persistent_handle_local = dart_persistent_handle;
        auto deleter = [raw_pointer_local, isolate_id_local, dart_persistent_handle_local]() {
            library_uncache_dart_handle_by_raw_pointer(raw_pointer_local, isolate_id_local);
            Dart_DeletePersistentHandle_DL(dart_persistent_handle_local);
        };
        if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            deleter();
        } else {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, deleter);
        }
    }
    smoke_SkipProxy_Proxy(const smoke_SkipProxy_Proxy&) = delete;
    smoke_SkipProxy_Proxy& operator=(const smoke_SkipProxy_Proxy&) = delete;
    std::string
    not_in_java(const std::string& input) override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle, FfiOpaqueHandle*)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<std::string>::toFfi(input),
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    bool
    not_in_swift(const bool input) override {
        bool _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, bool, bool*)>(f1))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<bool>::toFfi(input),
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<bool>::toCpp(_result_handle);
        ;
        return _result;
    }
    float
    not_in_dart(const float input) override {
         return {};
    }
    std::string
    get_skipped_in_java() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle*)>(p0g))(Dart_HandleFromPersistent_DL(dart_persistent_handle), &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    void
    set_skipped_in_java(const std::string& value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle)>(p0s))(
            Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<std::string>::toFfi(value)
        ); });
    }
    bool
    is_skipped_in_swift() const override {
        bool _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, bool*)>(p1g))(Dart_HandleFromPersistent_DL(dart_persistent_handle), &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<bool>::toCpp(_result_handle);
        ;
        return _result;
    }
    void
    set_skipped_in_swift(const bool value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, bool)>(p1s))(
            Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<bool>::toFfi(value)
        ); });
    }
    float
    get_skipped_in_dart() const override {
        return {};
    }
    void
    set_skipped_in_dart(const float value) override {
    }
    smoke::SkippedEverywhere
    get_skipped_everywhere() const override {
        return {};
    }
    void
    set_skipped_everywhere(const smoke::SkippedEverywhere& value) override {
    }
    smoke::SkippedEverywhereEnum
    get_skipped_everywhere_too() const override {
        return {};
    }
    void
    set_skipped_everywhere_too(const smoke::SkippedEverywhereEnum value) override {
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f0;
    const FfiOpaqueHandle f1;
    const FfiOpaqueHandle p0g;
    const FfiOpaqueHandle p0s;
    const FfiOpaqueHandle p1g;
    const FfiOpaqueHandle p1s;
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
library_smoke_SkipProxy_notInJava__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SkipProxy>>::toCpp(_self)).not_in_java(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}
bool
library_smoke_SkipProxy_notInSwift__Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SkipProxy>>::toCpp(_self)).not_in_swift(
            gluecodium::ffi::Conversion<bool>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_SkipProxy_skippedInJava_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SkipProxy>>::toCpp(_self)).get_skipped_in_java()
    );
}
void
library_smoke_SkipProxy_skippedInJava_set__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SkipProxy>>::toCpp(_self)).set_skipped_in_java(
        gluecodium::ffi::Conversion<std::string>::toCpp(value)
    );
}
bool
library_smoke_SkipProxy_isSkippedInSwift_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SkipProxy>>::toCpp(_self)).is_skipped_in_swift()
    );
}
void
library_smoke_SkipProxy_isSkippedInSwift_set__Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, bool value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SkipProxy>>::toCpp(_self)).set_skipped_in_swift(
        gluecodium::ffi::Conversion<bool>::toCpp(value)
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_SkipProxy_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::SkipProxy>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_SkipProxy_release_handle(handle);
}
void
library_smoke_SkipProxy_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_SkipProxy_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_SkipProxy_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::SkipProxy>(
            *reinterpret_cast<std::shared_ptr<smoke::SkipProxy>*>(handle)
        )
    );
}
void
library_smoke_SkipProxy_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::SkipProxy>*>(handle);
}
FfiOpaqueHandle
library_smoke_SkipProxy_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s, FfiOpaqueHandle p1g, FfiOpaqueHandle p1s) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_SkipProxy_Proxy>(token, isolate_id, "smoke_SkipProxy");
    std::shared_ptr<smoke_SkipProxy_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SkipProxy_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SkipProxy_Proxy>(
            new (std::nothrow) smoke_SkipProxy_Proxy(token, isolate_id, dart_handle, f0, f1, p0g, p0s, p1g, p1s)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_SkipProxy", *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_SkipProxy_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::SkipProxy>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
