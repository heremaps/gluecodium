#include "ffi_smoke_CalculatorListener.h"
#include "ConversionBase.h"
#include "ReverseCache.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "gluecodium/VectorHash.h"
#include "smoke/CalculationResult.h"
#include "smoke/CalculatorListener.h"
#include <memory>
#include <vector>
#include <memory>
#include <new>
class smoke_CalculatorListener_Proxy : public ::smoke::CalculatorListener {
public:
    smoke_CalculatorListener_Proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle f2, FfiOpaqueHandle f3, FfiOpaqueHandle f4, FfiOpaqueHandle f5)
        : token(token), isolate_id(isolate_id), deleter(deleter), f0(f0), f1(f1), f2(f2), f3(f3), f4(f4), f5(f5) { }
    ~smoke_CalculatorListener_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_CalculatorListener");
        gluecodium::ffi::remove_cached_token(this, isolate_id);
        auto token_local = token;
        auto deleter_local = reinterpret_cast<void (*)(uint64_t)>(deleter);
        gluecodium::ffi::cbqm.enqueueCallback(isolate_id, [token_local, deleter_local]() {
            (*deleter_local)(token_local);
        });
    }
    smoke_CalculatorListener_Proxy(const smoke_CalculatorListener_Proxy&) = delete;
    smoke_CalculatorListener_Proxy& operator=(const smoke_CalculatorListener_Proxy&) = delete;
    void
    on_calculation_result(const double calculationResult) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, double)>(f0))(token,
            gluecodium::ffi::Conversion<double>::toFfi(calculationResult)
        ); });
    }
    void
    on_calculation_result_const(const double calculationResult) const override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, double)>(f1))(token,
            gluecodium::ffi::Conversion<double>::toFfi(calculationResult)
        ); });
    }
    void
    on_calculation_result_struct(const ::smoke::CalculatorListener::ResultStruct& calculationResult) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle)>(f2))(token,
            gluecodium::ffi::Conversion<::smoke::CalculatorListener::ResultStruct>::toFfi(calculationResult)
        ); });
    }
    void
    on_calculation_result_array(const std::vector<double>& calculationResult) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle)>(f3))(token,
            gluecodium::ffi::Conversion<std::vector<double>>::toFfi(calculationResult)
        ); });
    }
    void
    on_calculation_result_map(const std::unordered_map<std::string, double>& calculationResults) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle)>(f4))(token,
            gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toFfi(calculationResults)
        ); });
    }
    void
    on_calculation_result_instance(const std::shared_ptr<::smoke::CalculationResult>& calculationResult) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint64_t, FfiOpaqueHandle)>(f5))(token,
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculationResult>>::toFfi(calculationResult)
        ); });
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const FfiOpaqueHandle deleter;
    const FfiOpaqueHandle f0;
    const FfiOpaqueHandle f1;
    const FfiOpaqueHandle f2;
    const FfiOpaqueHandle f3;
    const FfiOpaqueHandle f4;
    const FfiOpaqueHandle f5;
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
library_smoke_CalculatorListener_onCalculationResult__Double(FfiOpaqueHandle _self, int32_t _isolate_id, double calculationResult) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result(
            gluecodium::ffi::Conversion<double>::toCpp(calculationResult)
        );
}
void
library_smoke_CalculatorListener_onCalculationResultConst__Double(FfiOpaqueHandle _self, int32_t _isolate_id, double calculationResult) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result_const(
            gluecodium::ffi::Conversion<double>::toCpp(calculationResult)
        );
}
void
library_smoke_CalculatorListener_onCalculationResultStruct__ResultStruct(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle calculationResult) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result_struct(
            gluecodium::ffi::Conversion<::smoke::CalculatorListener::ResultStruct>::toCpp(calculationResult)
        );
}
void
library_smoke_CalculatorListener_onCalculationResultArray__ListOf_1Double(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle calculationResult) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result_array(
            gluecodium::ffi::Conversion<std::vector<double>>::toCpp(calculationResult)
        );
}
void
library_smoke_CalculatorListener_onCalculationResultMap__MapOf_1String_1to_1Double(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle calculationResults) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result_map(
            gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toCpp(calculationResults)
        );
}
void
library_smoke_CalculatorListener_onCalculationResultInstance__CalculationResult(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle calculationResult) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result_instance(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculationResult>>::toCpp(calculationResult)
        );
}
FfiOpaqueHandle
library_smoke_CalculatorListener_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::CalculatorListener>(
            *reinterpret_cast<std::shared_ptr<::smoke::CalculatorListener>*>(handle)
        )
    );
}
void
library_smoke_CalculatorListener_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::CalculatorListener>*>(handle);
}
FfiOpaqueHandle
library_smoke_CalculatorListener_create_proxy(uint64_t token, int32_t isolate_id, FfiOpaqueHandle deleter, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle f2, FfiOpaqueHandle f3, FfiOpaqueHandle f4, FfiOpaqueHandle f5) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_CalculatorListener_Proxy>(token, isolate_id, "smoke_CalculatorListener");
    std::shared_ptr<smoke_CalculatorListener_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_CalculatorListener_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_CalculatorListener_Proxy>(
            new (std::nothrow) smoke_CalculatorListener_Proxy(token, isolate_id, deleter, f0, f1, f2, f3, f4, f5)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_CalculatorListener", *proxy_ptr);
        gluecodium::ffi::cache_token(proxy_ptr->get(), isolate_id, token);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_CalculatorListener_ResultStruct_create_handle(double result) {
    auto _result = new (std::nothrow) ::smoke::CalculatorListener::ResultStruct(gluecodium::ffi::Conversion<double>::toCpp(result));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_CalculatorListener_ResultStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::CalculatorListener::ResultStruct*>(handle);
}
double
library_smoke_CalculatorListener_ResultStruct_get_field_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<::smoke::CalculatorListener::ResultStruct*>(handle)->result
    );
}
FfiOpaqueHandle
library_smoke_CalculatorListener_ResultStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::CalculatorListener::ResultStruct>(
            gluecodium::ffi::Conversion<::smoke::CalculatorListener::ResultStruct>::toCpp(value)
        )
    );
}
void
library_smoke_CalculatorListener_ResultStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::CalculatorListener::ResultStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_CalculatorListener_ResultStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::CalculatorListener::ResultStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::CalculatorListener::ResultStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_CalculatorListener_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<::smoke::CalculatorListener>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
