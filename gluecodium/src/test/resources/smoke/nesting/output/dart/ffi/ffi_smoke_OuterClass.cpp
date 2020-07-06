#include "ffi_smoke_OuterClass.h"
#include "ConversionBase.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "smoke/OuterClass.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
class smoke_OuterClass_InnerInterface_Proxy : public ::smoke::OuterClass::InnerInterface {
public:
    smoke_OuterClass_InnerInterface_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), deleter(deleter), f0(f0) { }
    ~smoke_OuterClass_InnerInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_OuterClass_InnerInterface");
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t, FfiOpaqueHandle)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [this, token_local, deleter_local]() {
            (*deleter_local)(token_local, this);
        });
    }
    smoke_OuterClass_InnerInterface_Proxy(const smoke_OuterClass_InnerInterface_Proxy&) = delete;
    smoke_OuterClass_InnerInterface_Proxy& operator=(const smoke_OuterClass_InnerInterface_Proxy&) = delete;
    std::string
    foo(const std::string& input) override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle, FfiOpaqueHandle*)>(f0))(token,
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
    const FfiOpaqueHandle deleter;
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
library_smoke_OuterClass_foo__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::OuterClass>>::toCpp(_self)).foo(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_OuterClass_InnerClass_foo__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::OuterClass::InnerClass>>::toCpp(_self)).foo(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_OuterClass_InnerInterface_foo__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::OuterClass::InnerInterface>>::toCpp(_self)).foo(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_OuterClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::OuterClass>(
            *reinterpret_cast<std::shared_ptr<::smoke::OuterClass>*>(handle)
        )
    );
}
void
library_smoke_OuterClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::OuterClass>*>(handle);
}
FfiOpaqueHandle
library_smoke_OuterClass_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::OuterClass>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_OuterClass_InnerClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::OuterClass::InnerClass>(
            *reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerClass>*>(handle)
        )
    );
}
void
library_smoke_OuterClass_InnerClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerClass>*>(handle);
}
FfiOpaqueHandle
library_smoke_OuterClass_InnerClass_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerClass>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_OuterClass_InnerInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::OuterClass::InnerInterface>(
            *reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerInterface>*>(handle)
        )
    );
}
void
library_smoke_OuterClass_InnerInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerInterface>*>(handle);
}
FfiOpaqueHandle
library_smoke_OuterClass_InnerInterface_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerInterface>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_OuterClass_InnerInterface_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_OuterClass_InnerInterface_Proxy>(token, isolate_id, "smoke_OuterClass_InnerInterface");
    std::shared_ptr<smoke_OuterClass_InnerInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_OuterClass_InnerInterface_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_OuterClass_InnerInterface_Proxy>(
            new (std::nothrow) smoke_OuterClass_InnerInterface_Proxy(token, isolate_id, deleter, f0)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_OuterClass_InnerInterface", *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_OuterClass_InnerInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_repository = ::gluecodium::get_type_repository(static_cast<::smoke::OuterClass::InnerInterface*>(nullptr));
    const auto& type_id = type_repository.get_id(reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
