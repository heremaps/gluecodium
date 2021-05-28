#include "ffi_smoke_ExternalInterface.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "foo/Bar.h"
#include "gluecodium/TypeRepository.h"
#include <cstdint>
#include <memory>
#include <string>
#include <memory>
#include <new>
class smoke_ExternalInterface_Proxy : public ::smoke::ExternalInterface {
public:
    smoke_ExternalInterface_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0, FfiOpaqueHandle p0g)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0), p0g(p0g) {
        library_cache_dart_handle_by_raw_pointer(this, dart_handle);
    }
    ~smoke_ExternalInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_ExternalInterface");
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
    smoke_ExternalInterface_Proxy(const smoke_ExternalInterface_Proxy&) = delete;
    smoke_ExternalInterface_Proxy& operator=(const smoke_ExternalInterface_Proxy&) = delete;
    void
    some_Method(const int8_t someParameter) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, int8_t)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<int8_t>::toFfi(someParameter)
        ); });
    }
    std::string
    get_Me() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle*)>(p0g))(Dart_HandleFromPersistent_DL(dart_persistent_handle), &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f0;
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
void
library_smoke_ExternalInterface_someMethod__Byte(FfiOpaqueHandle _self, int32_t _isolate_id, int8_t someParameter) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ExternalInterface>>::toCpp(_self)).some_Method(
            gluecodium::ffi::Conversion<int8_t>::toCpp(someParameter)
        );
}
FfiOpaqueHandle
library_smoke_ExternalInterface_someProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ExternalInterface>>::toCpp(_self)).get_Me()
    );
}
FfiOpaqueHandle
library_smoke_ExternalInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::ExternalInterface>(
            *reinterpret_cast<std::shared_ptr<::smoke::ExternalInterface>*>(handle)
        )
    );
}
void
library_smoke_ExternalInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::ExternalInterface>*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalInterface_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0, FfiOpaqueHandle p0g) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_ExternalInterface_Proxy>(token, isolate_id, "smoke_ExternalInterface");
    std::shared_ptr<smoke_ExternalInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ExternalInterface_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ExternalInterface_Proxy>(
            new (std::nothrow) smoke_ExternalInterface_Proxy(token, isolate_id, dart_handle, f0, p0g)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_ExternalInterface", *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_ExternalInterface_SomeStruct_create_handle(FfiOpaqueHandle someField) {
    auto _result = new (std::nothrow) ::smoke::ExternalInterface::some_Struct();
    _result->some_Field = gluecodium::ffi::Conversion<std::string>::toCpp(someField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_ExternalInterface_SomeStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::ExternalInterface::some_Struct*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalInterface_SomeStruct_get_field_someField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<::smoke::ExternalInterface::some_Struct*>(handle)->some_Field
    );
}
FfiOpaqueHandle
library_smoke_ExternalInterface_SomeStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::ExternalInterface::some_Struct>(
            gluecodium::ffi::Conversion<::smoke::ExternalInterface::some_Struct>::toCpp(value)
        )
    );
}
void
library_smoke_ExternalInterface_SomeStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::ExternalInterface::some_Struct>*>(handle);
}
FfiOpaqueHandle
library_smoke_ExternalInterface_SomeStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::ExternalInterface::some_Struct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::ExternalInterface::some_Struct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_ExternalInterface_SomeEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::ExternalInterface::some_Enum>(
            gluecodium::ffi::Conversion<::smoke::ExternalInterface::some_Enum>::toCpp(value)
        )
    );
}
void
library_smoke_ExternalInterface_SomeEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::ExternalInterface::some_Enum>*>(handle);
}
uint32_t
library_smoke_ExternalInterface_SomeEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::ExternalInterface::some_Enum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::ExternalInterface::some_Enum>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_ExternalInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<::smoke::ExternalInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
