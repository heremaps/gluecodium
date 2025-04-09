
#include "ffi_smoke_SimpleInterface.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/SimpleInterface.h"
#include <memory>
#include <string>
#include <memory>
#include <new>

class smoke_SimpleInterface_Proxy : public smoke::SimpleInterface {
public:
    smoke_SimpleInterface_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0, FfiOpaqueHandle f1)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), f0(f0), f1(f1) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }

    ~smoke_SimpleInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_SimpleInterface");

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

    smoke_SimpleInterface_Proxy(const smoke_SimpleInterface_Proxy&) = delete;
    smoke_SimpleInterface_Proxy& operator=(const smoke_SimpleInterface_Proxy&) = delete;

    std::string
    get_string_value() override {
        FfiOpaqueHandle _result_handle;
        
        dispatch([&]() { (*reinterpret_cast<void (*)(FfiOpaqueHandle*)>(f0))(
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }

    std::shared_ptr<smoke::SimpleInterface>
    use_simple_interface(const std::shared_ptr<smoke::SimpleInterface>& input) override {
        FfiOpaqueHandle _result_handle;
        
        dispatch([&]() { (*reinterpret_cast<void (*)(FfiOpaqueHandle, FfiOpaqueHandle*)>(f1))(
            gluecodium::ffi::Conversion<std::shared_ptr<smoke::SimpleInterface>>::toFfi(input), 
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<std::shared_ptr<smoke::SimpleInterface>>::toCpp(_result_handle);
        delete reinterpret_cast<std::shared_ptr<smoke::SimpleInterface>*>(_result_handle);
        return _result;
    }



private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f_close_callbacks;
    const FfiOpaqueHandle f0;
    const FfiOpaqueHandle f1;

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
library_smoke_SimpleInterface_getStringValue(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SimpleInterface>>::toCpp(_self)).get_string_value()
    );
}



FfiOpaqueHandle
library_smoke_SimpleInterface_useSimpleInterface__SimpleInterface(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::SimpleInterface>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SimpleInterface>>::toCpp(_self)).use_simple_interface(
            gluecodium::ffi::Conversion<std::shared_ptr<smoke::SimpleInterface>>::toCpp(input)
        )
    );
}















// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_SimpleInterface_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::SimpleInterface>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_SimpleInterface_release_handle(handle);
}

void
library_smoke_SimpleInterface_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_SimpleInterface_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_SimpleInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::SimpleInterface>(
            *reinterpret_cast<std::shared_ptr<smoke::SimpleInterface>*>(handle)
        )
    );
}

void
library_smoke_SimpleInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::SimpleInterface>*>(handle);
}


FfiOpaqueHandle
library_smoke_SimpleInterface_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0, FfiOpaqueHandle f1) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_SimpleInterface_Proxy>(token, isolate_id, "smoke_SimpleInterface");
    std::shared_ptr<smoke_SimpleInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SimpleInterface_Proxy>(cached_proxy);
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_SimpleInterface_Proxy>(
            new (std::nothrow) smoke_SimpleInterface_Proxy(token, isolate_id, dart_handle, close_callbacks, f0, f1)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_SimpleInterface", *proxy_ptr);
    }

    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}





FfiOpaqueHandle
library_smoke_SimpleInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::SimpleInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}

#ifdef __cplusplus
}
#endif
