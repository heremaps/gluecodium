#include "ffi_smoke_CalculatorListener.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/CalculationResult.h"
#include "smoke/CalculatorListener.h"
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>
#include <memory>
#include <new>
class smoke_CalculatorListener_Proxy : public smoke::CalculatorListener {
public:
    smoke_CalculatorListener_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle f2, FfiOpaqueHandle f3, FfiOpaqueHandle f4, FfiOpaqueHandle f5)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f0(f0), f1(f1), f2(f2), f3(f3), f4(f4), f5(f5) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }
    ~smoke_CalculatorListener_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_CalculatorListener");
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
    smoke_CalculatorListener_Proxy(const smoke_CalculatorListener_Proxy&) = delete;
    smoke_CalculatorListener_Proxy& operator=(const smoke_CalculatorListener_Proxy&) = delete;
    void
    on_calculation_result(const double calculationResult) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, double)>(f0))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<double>::toFfi(calculationResult)
        ); });
    }
    void
    on_calculation_result_const(const double calculationResult) const override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, double)>(f1))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<double>::toFfi(calculationResult)
        ); });
    }
    void
    on_calculation_result_struct(const smoke::CalculatorListener::ResultStruct& calculationResult) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle)>(f2))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<smoke::CalculatorListener::ResultStruct>::toFfi(calculationResult)
        ); });
    }
    void
    on_calculation_result_array(const std::vector<double>& calculationResult) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle)>(f3))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<std::vector<double>>::toFfi(calculationResult)
        ); });
    }
    void
    on_calculation_result_map(const std::unordered_map<std::string, double>& calculationResults) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle)>(f4))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toFfi(calculationResults)
        ); });
    }
    void
    on_calculation_result_instance(const std::shared_ptr<smoke::CalculationResult>& calculationResult) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(Dart_Handle, FfiOpaqueHandle)>(f5))(Dart_HandleFromPersistent_DL(dart_persistent_handle),
            gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculationResult>>::toFfi(calculationResult)
        ); });
    }
private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
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
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result(
        gluecodium::ffi::Conversion<double>::toCpp(calculationResult)
    );
}
void
library_smoke_CalculatorListener_onCalculationResultConst__Double(FfiOpaqueHandle _self, int32_t _isolate_id, double calculationResult) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result_const(
        gluecodium::ffi::Conversion<double>::toCpp(calculationResult)
    );
}
void
library_smoke_CalculatorListener_onCalculationResultStruct__ResultStruct(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle calculationResult) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result_struct(
        gluecodium::ffi::Conversion<smoke::CalculatorListener::ResultStruct>::toCpp(calculationResult)
    );
}
void
library_smoke_CalculatorListener_onCalculationResultArray__ListOf_Double(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle calculationResult) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result_array(
        gluecodium::ffi::Conversion<std::vector<double>>::toCpp(calculationResult)
    );
}
void
library_smoke_CalculatorListener_onCalculationResultMap__MapOf_String_to_Double(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle calculationResults) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result_map(
        gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toCpp(calculationResults)
    );
}
void
library_smoke_CalculatorListener_onCalculationResultInstance__CalculationResult(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle calculationResult) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculatorListener>>::toCpp(_self)).on_calculation_result_instance(
        gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculationResult>>::toCpp(calculationResult)
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_CalculatorListener_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::CalculatorListener>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_CalculatorListener_release_handle(handle);
}
void
library_smoke_CalculatorListener_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_CalculatorListener_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_CalculatorListener_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::CalculatorListener>(
            *reinterpret_cast<std::shared_ptr<smoke::CalculatorListener>*>(handle)
        )
    );
}
void
library_smoke_CalculatorListener_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::CalculatorListener>*>(handle);
}
FfiOpaqueHandle
library_smoke_CalculatorListener_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle f2, FfiOpaqueHandle f3, FfiOpaqueHandle f4, FfiOpaqueHandle f5) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_CalculatorListener_Proxy>(token, isolate_id, "smoke_CalculatorListener");
    std::shared_ptr<smoke_CalculatorListener_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_CalculatorListener_Proxy>(cached_proxy);
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_CalculatorListener_Proxy>(
            new (std::nothrow) smoke_CalculatorListener_Proxy(token, isolate_id, dart_handle, f0, f1, f2, f3, f4, f5)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_CalculatorListener", *proxy_ptr);
    }
    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}
FfiOpaqueHandle
library_smoke_CalculatorListener_ResultStruct_create_handle(double result) {
    auto _result = new (std::nothrow) smoke::CalculatorListener::ResultStruct();
    _result->result = gluecodium::ffi::Conversion<double>::toCpp(result);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_CalculatorListener_ResultStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::CalculatorListener::ResultStruct*>(handle);
}
double
library_smoke_CalculatorListener_ResultStruct_get_field_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::CalculatorListener::ResultStruct*>(handle)->result
    );
}
FfiOpaqueHandle
library_smoke_CalculatorListener_ResultStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::CalculatorListener::ResultStruct>(
            gluecodium::ffi::Conversion<smoke::CalculatorListener::ResultStruct>::toCpp(value)
        )
    );
}
void
library_smoke_CalculatorListener_ResultStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::CalculatorListener::ResultStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_CalculatorListener_ResultStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::CalculatorListener::ResultStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::CalculatorListener::ResultStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_CalculatorListener_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::CalculatorListener>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
