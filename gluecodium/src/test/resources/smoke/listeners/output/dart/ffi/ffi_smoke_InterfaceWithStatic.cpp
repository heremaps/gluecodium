#include "ffi_smoke_InterfaceWithStatic.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/InterfaceWithStatic.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
class smoke_InterfaceWithStatic_Proxy : public ::smoke::InterfaceWithStatic {
public:
    smoke_InterfaceWithStatic_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0), p0g(p0g), p0s(p0s) {
        library_cache_dart_handle_by_raw_pointer(this, dart_handle);
    }
    ~smoke_InterfaceWithStatic_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_InterfaceWithStatic");
        auto raw_pointer_local = this;
        auto dart_persistent_handle_local = dart_persistent_handle;
        auto deleter = [raw_pointer_local, dart_persistent_handle_local]() {
            library_uncache_dart_handle_by_raw_pointer(raw_pointer_local);
            Dart_DeletePersistentHandle_DL(dart_persistent_handle_local);
        };
        if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            deleter();
        } else {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, deleter);
        }
    }
    smoke_InterfaceWithStatic_Proxy(const smoke_InterfaceWithStatic_Proxy&) = delete;
    smoke_InterfaceWithStatic_Proxy& operator=(const smoke_InterfaceWithStatic_Proxy&) = delete;
    std::string
    regular_function() override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle*)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    std::string
    get_regular_property() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle*)>(p0g))(Dart_HandleFromPersistent_DL(dart_persistent_handle), &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    void
    set_regular_property(const std::string& value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle)>(p0s))(
            Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<std::string>::toFfi(value)
        ); });
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f0;
    const FfiOpaqueHandle p0g;
    const FfiOpaqueHandle p0s;
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
library_smoke_InterfaceWithStatic_regularFunction(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::InterfaceWithStatic>>::toCpp(_self)).regular_function()
    );
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_staticFunction(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        ::smoke::InterfaceWithStatic::static_function()
    );
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_regularProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::InterfaceWithStatic>>::toCpp(_self)).get_regular_property()
    );
}
void
library_smoke_InterfaceWithStatic_regularProperty_set__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::InterfaceWithStatic>>::toCpp(_self)).set_regular_property(
            gluecodium::ffi::Conversion<std::string>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_staticProperty_get(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        ::smoke::InterfaceWithStatic::get_static_property()
    );
}
void
library_smoke_InterfaceWithStatic_staticProperty_set__String(int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            ::smoke::InterfaceWithStatic::set_static_property(
            gluecodium::ffi::Conversion<std::string>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::InterfaceWithStatic>(
            *reinterpret_cast<std::shared_ptr<::smoke::InterfaceWithStatic>*>(handle)
        )
    );
}
void
library_smoke_InterfaceWithStatic_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::InterfaceWithStatic>*>(handle);
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_InterfaceWithStatic_Proxy>(token, isolate_id, "smoke_InterfaceWithStatic");
    std::shared_ptr<smoke_InterfaceWithStatic_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_InterfaceWithStatic_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_InterfaceWithStatic_Proxy>(
            new (std::nothrow) smoke_InterfaceWithStatic_Proxy(token, isolate_id, dart_handle, f0, p0g, p0s)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_InterfaceWithStatic", *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_InterfaceWithStatic_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<::smoke::InterfaceWithStatic>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
