#include "ffi_smoke_ExternalInterface.h"
#include "ConversionBase.h"
#include "ReverseCache.h"
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
    smoke_ExternalInterface_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle p0g)
        : token(token), isolate_id(isolate_id), deleter(deleter), f0(f0), p0g(p0g) { }
    ~smoke_ExternalInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_ExternalInterface");
        gluecodium::ffi::remove_cached_token(this, isolate_id);
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [token_local, deleter_local]() {
            (*deleter_local)(token_local);
        });
    }
    smoke_ExternalInterface_Proxy(const smoke_ExternalInterface_Proxy&) = delete;
    smoke_ExternalInterface_Proxy& operator=(const smoke_ExternalInterface_Proxy&) = delete;
    void
    some_Method(const int8_t someParameter) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, int8_t)>(f0))(token,
            gluecodium::ffi::Conversion<int8_t>::toFfi(someParameter)
        ); });
    }
    std::string
    get_Me() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle*)>(p0g))(token, &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const FfiOpaqueHandle deleter;
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
library_smoke_ExternalInterface_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle p0g) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_ExternalInterface_Proxy>(token, isolate_id, "smoke_ExternalInterface");
    std::shared_ptr<smoke_ExternalInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ExternalInterface_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ExternalInterface_Proxy>(
            new (std::nothrow) smoke_ExternalInterface_Proxy(token, isolate_id, deleter, f0, p0g)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_ExternalInterface", *proxy_ptr);
        gluecodium::ffi::cache_token(proxy_ptr->get(), isolate_id, token);
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
    const auto& type_repository = ::gluecodium::get_type_repository(static_cast<::smoke::ExternalInterface*>(nullptr));
    const auto& type_id = type_repository.get_id(reinterpret_cast<std::shared_ptr<::smoke::ExternalInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
