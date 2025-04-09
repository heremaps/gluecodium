
#include "ffi_smoke_SkipSetter.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/SkipSetter.h"
#include <memory>
#include <string>
#include <memory>
#include <new>

class smoke_SkipSetter_Proxy : public smoke::SkipSetter {
public:
    smoke_SkipSetter_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle p0g)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), p0g(p0g) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }

    ~smoke_SkipSetter_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_SkipSetter");

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

    smoke_SkipSetter_Proxy(const smoke_SkipSetter_Proxy&) = delete;
    smoke_SkipSetter_Proxy& operator=(const smoke_SkipSetter_Proxy&) = delete;


    std::string
    get_foo() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle*)>(p0g))(&_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }

    void
    set_foo(const std::string& value) override {
    }

private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f_close_callbacks;
    const FfiOpaqueHandle p0g;
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
library_smoke_SkipSetter_foo_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SkipSetter>>::toCpp(_self)).get_foo()
    );
}















// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_SkipSetter_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::SkipSetter>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_SkipSetter_release_handle(handle);
}

void
library_smoke_SkipSetter_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_SkipSetter_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_SkipSetter_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::SkipSetter>(
            *reinterpret_cast<std::shared_ptr<smoke::SkipSetter>*>(handle)
        )
    );
}

void
library_smoke_SkipSetter_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::SkipSetter>*>(handle);
}


FfiOpaqueHandle
library_smoke_SkipSetter_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle p0g) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_SkipSetter_Proxy>(token, isolate_id, "smoke_SkipSetter");
    std::shared_ptr<smoke_SkipSetter_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SkipSetter_Proxy>(cached_proxy);
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SkipSetter_Proxy>(
            new (std::nothrow) smoke_SkipSetter_Proxy(token, isolate_id, dart_handle, close_callbacks, p0g)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_SkipSetter", *proxy_ptr);
    }

    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}





FfiOpaqueHandle
library_smoke_SkipSetter_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::SkipSetter>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}

#ifdef __cplusplus
}
#endif
