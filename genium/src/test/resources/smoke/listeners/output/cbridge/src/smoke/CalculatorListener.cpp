//
//
// Automatically generated. Do not modify. Your changes will be lost.

#include "cbridge/include/smoke/CalculatorListener.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "smoke/CalculatorListener.h"
#include <memory>
#include <new>
#include <unordered_map>
#include <vector>

void smoke_CalculatorListener_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<smoke::CalculatorListener>>(handle);
}
_baseRef smoke_CalculatorListener_ResultStruct_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::CalculatorListener::ResultStruct() );
}
void smoke_CalculatorListener_ResultStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::CalculatorListener::ResultStruct>(handle);
}
double smoke_CalculatorListener_ResultStruct_result_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::CalculatorListener::ResultStruct>(handle);
    return struct_pointer->result;
}
void smoke_CalculatorListener_ResultStruct_result_set(_baseRef handle, double result) {
    get_pointer<::smoke::CalculatorListener::ResultStruct>(handle)->result = result;
}
void smoke_CalculatorListener_onCalculationResult(_baseRef _instance, double calculationResult) {
    return get_pointer<std::shared_ptr<smoke::CalculatorListener>>(_instance)->get()->on_calculation_result(calculationResult);
}
void smoke_CalculatorListener_onCalculationResultConst(_baseRef _instance, double calculationResult) {
    return get_pointer<std::shared_ptr<smoke::CalculatorListener>>(_instance)->get()->on_calculation_result_const(calculationResult);
}
void smoke_CalculatorListener_onCalculationResultStruct(_baseRef _instance, _baseRef calculationResult) {
    return get_pointer<std::shared_ptr<smoke::CalculatorListener>>(_instance)->get()->on_calculation_result_struct(*get_pointer<::smoke::CalculatorListener::ResultStruct>(calculationResult));
}
void smoke_CalculatorListener_onCalculationResultArray(_baseRef _instance, _baseRef calculationResult) {
    return get_pointer<std::shared_ptr<smoke::CalculatorListener>>(_instance)->get()->on_calculation_result_array(*get_pointer<std::vector<double>>(calculationResult));
}
void smoke_CalculatorListener_onCalculationResultMap(_baseRef _instance, _baseRef calculationResults) {
    return get_pointer<std::shared_ptr<smoke::CalculatorListener>>(_instance)->get()->on_calculation_result_map(*get_pointer<std::unordered_map<std::string, double>>(calculationResults));
}

class smoke_CalculatorListenerProxy : public std::shared_ptr<smoke::CalculatorListener>::element_type, public CachedProxyBase<smoke_CalculatorListenerProxy> {
public:
    using function_table_t = smoke_CalculatorListener_FunctionTable;
    smoke_CalculatorListenerProxy(smoke_CalculatorListener_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_CalculatorListenerProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    void on_calculation_result(double calculationResult) override {
        return mFunctions.smoke_CalculatorListener_onCalculationResult(mFunctions.swift_pointer, calculationResult);
    }
    void on_calculation_result_const(double calculationResult) override {
        return mFunctions.smoke_CalculatorListener_onCalculationResultConst(mFunctions.swift_pointer, calculationResult);
    }
    void on_calculation_result_struct(const ::smoke::CalculatorListener::ResultStruct& calculationResult) override {
        return mFunctions.smoke_CalculatorListener_onCalculationResultStruct(mFunctions.swift_pointer, reinterpret_cast<_baseRef>( new ::smoke::CalculatorListener::ResultStruct(calculationResult) ));
    }
    void on_calculation_result_array(const std::vector<double>& calculationResult) override {
        return mFunctions.smoke_CalculatorListener_onCalculationResultArray(mFunctions.swift_pointer, reinterpret_cast<_baseRef>( new std::vector<double>(calculationResult) ));
    }
    void on_calculation_result_map(const ::smoke::CalculatorListener::NamedCalculationResults& calculationResults) override {
        return mFunctions.smoke_CalculatorListener_onCalculationResultMap(mFunctions.swift_pointer, reinterpret_cast<_baseRef>( new ::smoke::CalculatorListener::NamedCalculationResults(calculationResults) ));
    }
private:
    function_table_t mFunctions;
};

_baseRef smoke_CalculatorListener_createProxy(smoke_CalculatorListener_FunctionTable functionTable) {
    auto proxy = smoke_CalculatorListenerProxy::get_proxy(std::move(functionTable));
    if (proxy) {
        return reinterpret_cast<_baseRef>( new std::shared_ptr<smoke::CalculatorListener>(std::move(proxy)) );
    } else {
        return 0;
    }
}

const void* smoke_CalculatorListener_get_swift_object_from_cache(_baseRef handle) {
    return smoke_CalculatorListenerProxy::get_swift_object(get_pointer<std::shared_ptr<smoke::CalculatorListener>>(handle)->get());
}
_baseRef smoke_CalculatorListener_NamedCalculationResults_create() {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, double>() );
}
void smoke_CalculatorListener_NamedCalculationResults_release(_baseRef handle) {
    delete get_pointer<std::unordered_map<std::string, double>>(handle);
}
_baseRef smoke_CalculatorListener_NamedCalculationResults_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, double>::iterator( get_pointer<std::unordered_map<std::string, double>>(handle)->begin() ) );
}
void smoke_CalculatorListener_NamedCalculationResults_iterator_release(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle );
}
void smoke_CalculatorListener_NamedCalculationResults_put(_baseRef handle, _baseRef key, double value) {
    (*get_pointer<std::unordered_map<std::string, double>>(handle))[*get_pointer<std::string>(key)] = value;
}
bool smoke_CalculatorListener_NamedCalculationResults_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<std::string, double>>(handle)->end();
}
void smoke_CalculatorListener_NamedCalculationResults_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle );
}
_baseRef smoke_CalculatorListener_NamedCalculationResults_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ))->first;
    return reinterpret_cast<_baseRef>(new std::string { key });
}
double smoke_CalculatorListener_NamedCalculationResults_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ))->second;
    return value;
}
