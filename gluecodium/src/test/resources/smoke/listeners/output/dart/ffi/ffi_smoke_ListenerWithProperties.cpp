#include "ffi_smoke_ListenerWithProperties.h"
#include "ConversionBase.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "smoke/ListenerWithProperties.h"
#include <memory>
#include <memory>
#include <new>
class smoke_ListenerWithProperties_Proxy : public ::smoke::ListenerWithProperties {
public:
    smoke_ListenerWithProperties_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s, FfiOpaqueHandle p1g, FfiOpaqueHandle p1s, FfiOpaqueHandle p2g, FfiOpaqueHandle p2s, FfiOpaqueHandle p3g, FfiOpaqueHandle p3s, FfiOpaqueHandle p4g, FfiOpaqueHandle p4s, FfiOpaqueHandle p5g, FfiOpaqueHandle p5s, FfiOpaqueHandle p6g, FfiOpaqueHandle p6s)
        : token(token), isolate_id(isolate_id), deleter(deleter), p0g(p0g), p0s(p0s), p1g(p1g), p1s(p1s), p2g(p2g), p2s(p2s), p3g(p3g), p3s(p3s), p4g(p4g), p4s(p4s), p5g(p5g), p5s(p5s), p6g(p6g), p6s(p6s) { }
    ~smoke_ListenerWithProperties_Proxy() {
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [this]() {
            (*reinterpret_cast<void (*)(uint64_t, FfiOpaqueHandle)>(deleter))(token, this);
        });
    }
    std::string
    get_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(p0g))(token, &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    void
    set_message(const std::string& value) override {
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle)>(p0s))(token,
            gluecodium::ffi::Conversion<std::string>::toFfi(value)
        ); });
    }
    std::shared_ptr<::smoke::CalculationResult>
    get_packed_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(p1g))(token, &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculationResult>>::toCpp(_result_handle);
        delete reinterpret_cast<std::shared_ptr<::smoke::CalculationResult>*>(_result_handle);
        return _result;
    }
    void
    set_packed_message(const std::shared_ptr<::smoke::CalculationResult>& value) override {
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle)>(p1s))(token,
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculationResult>>::toFfi(value)
        ); });
    }
    ::smoke::ListenerWithProperties::ResultStruct
    get_structured_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(p2g))(token, &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultStruct>::toCpp(_result_handle);
        delete reinterpret_cast<::smoke::ListenerWithProperties::ResultStruct*>(_result_handle);
        return _result;
    }
    void
    set_structured_message(const ::smoke::ListenerWithProperties::ResultStruct& value) override {
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle)>(p2s))(token,
            gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultStruct>::toFfi(value)
        ); });
    }
    ::smoke::ListenerWithProperties::ResultEnum
    get_enumerated_message() const override {
        uint32_t _result_handle;
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, uint32_t*)>(p3g))(token, &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultEnum>::toCpp(_result_handle);
        ;
        return _result;
    }
    void
    set_enumerated_message(const ::smoke::ListenerWithProperties::ResultEnum value) override {
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, uint32_t)>(p3s))(token,
            gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultEnum>::toFfi(value)
        ); });
    }
    std::vector<std::string>
    get_arrayed_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(p4g))(token, &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(_result_handle);
        delete reinterpret_cast<std::vector<std::string>*>(_result_handle);
        return _result;
    }
    void
    set_arrayed_message(const std::vector<std::string>& value) override {
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle)>(p4s))(token,
            gluecodium::ffi::Conversion<std::vector<std::string>>::toFfi(value)
        ); });
    }
    std::unordered_map<std::string, double>
    get_mapped_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(p5g))(token, &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toCpp(_result_handle);
        delete reinterpret_cast<std::unordered_map<std::string, double>*>(_result_handle);
        return _result;
    }
    void
    set_mapped_message(const std::unordered_map<std::string, double>& value) override {
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle)>(p5s))(token,
            gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toFfi(value)
        ); });
    }
    std::shared_ptr<std::vector<uint8_t>>
    get_buffered_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(p6g))(token, &_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toCpp(_result_handle);
        delete reinterpret_cast<std::shared_ptr<std::vector<uint8_t>>*>(_result_handle);
        return _result;
    }
    void
    set_buffered_message(const std::shared_ptr<std::vector<uint8_t>>& value) override {
        dispatch([&]() { (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle)>(p6s))(token,
            gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toFfi(value)
        ); });
    }
private:
    uint64_t token;
    int32_t isolate_id;
    FfiOpaqueHandle deleter;
    FfiOpaqueHandle p0g;
    FfiOpaqueHandle p0s;
    FfiOpaqueHandle p1g;
    FfiOpaqueHandle p1s;
    FfiOpaqueHandle p2g;
    FfiOpaqueHandle p2s;
    FfiOpaqueHandle p3g;
    FfiOpaqueHandle p3s;
    FfiOpaqueHandle p4g;
    FfiOpaqueHandle p4s;
    FfiOpaqueHandle p5g;
    FfiOpaqueHandle p5s;
    FfiOpaqueHandle p6g;
    FfiOpaqueHandle p6s;
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
library_smoke_ListenerWithProperties_message_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).get_message()
    );
}
void
library_smoke_ListenerWithProperties_message_set__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).set_message(
            gluecodium::ffi::Conversion<std::string>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_packedMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculationResult>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).get_packed_message()
    );
}
void
library_smoke_ListenerWithProperties_packedMessage_set__CalculationResult(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).set_packed_message(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculationResult>>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_structuredMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultStruct>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).get_structured_message()
    );
}
void
library_smoke_ListenerWithProperties_structuredMessage_set__ResultStruct(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).set_structured_message(
            gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultStruct>::toCpp(value)
        );
}
uint32_t
library_smoke_ListenerWithProperties_enumeratedMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultEnum>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).get_enumerated_message()
    );
}
void
library_smoke_ListenerWithProperties_enumeratedMessage_set__ResultEnum(FfiOpaqueHandle _self, int32_t _isolate_id, uint32_t value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).set_enumerated_message(
            gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultEnum>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_arrayedMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::vector<std::string>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).get_arrayed_message()
    );
}
void
library_smoke_ListenerWithProperties_arrayedMessage_set__ListOf_1String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).set_arrayed_message(
            gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_mappedMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).get_mapped_message()
    );
}
void
library_smoke_ListenerWithProperties_mappedMessage_set__MapOf_1String_1to_1Double(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).set_mapped_message(
            gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_bufferedMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).get_buffered_message()
    );
}
void
library_smoke_ListenerWithProperties_bufferedMessage_set__Blob(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenerWithProperties>>::toCpp(_self)).set_buffered_message(
            gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toCpp(value)
        );
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::ListenerWithProperties>(
            *reinterpret_cast<std::shared_ptr<::smoke::ListenerWithProperties>*>(handle)
        )
    );
}
void
library_smoke_ListenerWithProperties_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::ListenerWithProperties>*>(handle);
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s, FfiOpaqueHandle p1g, FfiOpaqueHandle p1s, FfiOpaqueHandle p2g, FfiOpaqueHandle p2s, FfiOpaqueHandle p3g, FfiOpaqueHandle p3s, FfiOpaqueHandle p4g, FfiOpaqueHandle p4s, FfiOpaqueHandle p5g, FfiOpaqueHandle p5s, FfiOpaqueHandle p6g, FfiOpaqueHandle p6s) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_ListenerWithProperties_Proxy>(token);
    std::shared_ptr<smoke_ListenerWithProperties_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ListenerWithProperties_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ListenerWithProperties_Proxy>(
            new (std::nothrow) smoke_ListenerWithProperties_Proxy(token, isolate_id, deleter, p0g, p0s, p1g, p1s, p2g, p2s, p3g, p3s, p4g, p4s, p5g, p5s, p6g, p6s)
        );
        gluecodium::ffi::cache_proxy(token, *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::ListenerWithProperties>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_ResultStruct_create_handle(double result) {
    auto _result = new (std::nothrow) ::smoke::ListenerWithProperties::ResultStruct(gluecodium::ffi::Conversion<double>::toCpp(result));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_ListenerWithProperties_ResultStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::ListenerWithProperties::ResultStruct*>(handle);
}
double
library_smoke_ListenerWithProperties_ResultStruct_get_field_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<::smoke::ListenerWithProperties::ResultStruct*>(handle)->result
    );
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_ResultStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::ListenerWithProperties::ResultStruct>(
            gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultStruct>::toCpp(value)
        )
    );
}
void
library_smoke_ListenerWithProperties_ResultStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::ListenerWithProperties::ResultStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_ResultStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::ListenerWithProperties::ResultStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_ResultEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::ListenerWithProperties::ResultEnum>(
            gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultEnum>::toCpp(value)
        )
    );
}
void
library_smoke_ListenerWithProperties_ResultEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::ListenerWithProperties::ResultEnum>*>(handle);
}
uint32_t
library_smoke_ListenerWithProperties_ResultEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::ListenerWithProperties::ResultEnum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::ListenerWithProperties::ResultEnum>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_ListenerWithProperties_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_repository = ::gluecodium::get_type_repository(static_cast<::smoke::ListenerWithProperties*>(nullptr));
    const auto& type_id = type_repository.get_id(reinterpret_cast<std::shared_ptr<::smoke::ListenerWithProperties>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
