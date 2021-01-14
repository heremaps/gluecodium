#include "ffi_smoke_OuterStruct.h"
#include "ConversionBase.h"
#include "ReverseCache.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/Locale.h"
#include "gluecodium/TimePointHash.h"
#include "gluecodium/TypeRepository.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/OuterStruct.h"
#include <chrono>
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <memory>
#include <new>
class smoke_OuterStruct_InnerInterface_Proxy : public ::smoke::OuterStruct::InnerInterface {
public:
    smoke_OuterStruct_InnerInterface_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0)
        : token(token), isolate_id(isolate_id), deleter(deleter), f0(f0) { }
    ~smoke_OuterStruct_InnerInterface_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_OuterStruct_InnerInterface");
        gluecodium::ffi::remove_cached_token(this, isolate_id);
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [token_local, deleter_local]() {
            (*deleter_local)(token_local);
        });
    }
    smoke_OuterStruct_InnerInterface_Proxy(const smoke_OuterStruct_InnerInterface_Proxy&) = delete;
    smoke_OuterStruct_InnerInterface_Proxy& operator=(const smoke_OuterStruct_InnerInterface_Proxy&) = delete;
    std::unordered_map<std::string, std::shared_ptr<std::vector<uint8_t>>>
    bar_baz() override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle*)>(f0))(token,
            &_result_handle
        ); });
        auto _result = gluecodium::ffi::Conversion<std::unordered_map<std::string, std::shared_ptr<std::vector<uint8_t>>>>::toCpp(_result_handle);
        delete reinterpret_cast<std::unordered_map<std::string, std::shared_ptr<std::vector<uint8_t>>>*>(_result_handle);
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
void
library_smoke_OuterStruct_doNothing(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            gluecodium::ffi::Conversion<::smoke::OuterStruct>::toCpp(_self).do_nothing();
}
void
library_smoke_OuterStruct_InnerStruct_doSomething(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            gluecodium::ffi::Conversion<::smoke::OuterStruct::InnerStruct>::toCpp(_self).do_something();
}
FfiOpaqueHandle
library_smoke_OuterStruct_InnerClass_fooBar(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::unordered_set<gluecodium::Locale>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::OuterStruct::InnerClass>>::toCpp(_self)).foo_bar()
    );
}
FfiOpaqueHandle
library_smoke_OuterStruct_InnerInterface_barBaz(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::unordered_map<std::string, std::shared_ptr<std::vector<uint8_t>>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::OuterStruct::InnerInterface>>::toCpp(_self)).bar_baz()
    );
}
FfiOpaqueHandle
library_smoke_OuterStruct_InnerClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::OuterStruct::InnerClass>(
            *reinterpret_cast<std::shared_ptr<::smoke::OuterStruct::InnerClass>*>(handle)
        )
    );
}
void
library_smoke_OuterStruct_InnerClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::OuterStruct::InnerClass>*>(handle);
}
FfiOpaqueHandle
library_smoke_OuterStruct_InnerInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::OuterStruct::InnerInterface>(
            *reinterpret_cast<std::shared_ptr<::smoke::OuterStruct::InnerInterface>*>(handle)
        )
    );
}
void
library_smoke_OuterStruct_InnerInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::OuterStruct::InnerInterface>*>(handle);
}
FfiOpaqueHandle
library_smoke_OuterStruct_InnerInterface_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_OuterStruct_InnerInterface_Proxy>(token, isolate_id, "smoke_OuterStruct_InnerInterface");
    std::shared_ptr<smoke_OuterStruct_InnerInterface_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_OuterStruct_InnerInterface_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_OuterStruct_InnerInterface_Proxy>(
            new (std::nothrow) smoke_OuterStruct_InnerInterface_Proxy(token, isolate_id, deleter, f0)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_OuterStruct_InnerInterface", *proxy_ptr);
        gluecodium::ffi::cache_token(proxy_ptr->get(), isolate_id, token);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_OuterStruct_create_handle(FfiOpaqueHandle field) {
    auto _result = new (std::nothrow) ::smoke::OuterStruct(gluecodium::ffi::Conversion<std::string>::toCpp(field));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_OuterStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::OuterStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_OuterStruct_get_field_field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<::smoke::OuterStruct*>(handle)->field
    );
}
FfiOpaqueHandle
library_smoke_OuterStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::OuterStruct>(
            gluecodium::ffi::Conversion<::smoke::OuterStruct>::toCpp(value)
        )
    );
}
void
library_smoke_OuterStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::OuterStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_OuterStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::OuterStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::OuterStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_OuterStruct_InnerStruct_create_handle(FfiOpaqueHandle otherField) {
    auto _result = new (std::nothrow) ::smoke::OuterStruct::InnerStruct(gluecodium::ffi::Conversion<std::vector<std::chrono::system_clock::time_point>>::toCpp(otherField));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_OuterStruct_InnerStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::OuterStruct::InnerStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_OuterStruct_InnerStruct_get_field_otherField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::vector<std::chrono::system_clock::time_point>>::toFfi(
        reinterpret_cast<::smoke::OuterStruct::InnerStruct*>(handle)->other_field
    );
}
FfiOpaqueHandle
library_smoke_OuterStruct_InnerStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::OuterStruct::InnerStruct>(
            gluecodium::ffi::Conversion<::smoke::OuterStruct::InnerStruct>::toCpp(value)
        )
    );
}
void
library_smoke_OuterStruct_InnerStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::OuterStruct::InnerStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_OuterStruct_InnerStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::OuterStruct::InnerStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::OuterStruct::InnerStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_OuterStruct_InnerEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::OuterStruct::InnerEnum>(
            gluecodium::ffi::Conversion<::smoke::OuterStruct::InnerEnum>::toCpp(value)
        )
    );
}
void
library_smoke_OuterStruct_InnerEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::OuterStruct::InnerEnum>*>(handle);
}
uint32_t
library_smoke_OuterStruct_InnerEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::OuterStruct::InnerEnum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::OuterStruct::InnerEnum>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_OuterStruct_InnerInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<::smoke::OuterStruct::InnerInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
