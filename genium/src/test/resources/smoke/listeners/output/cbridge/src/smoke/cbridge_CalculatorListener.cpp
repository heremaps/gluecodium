//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "Optional.h"
#include "cbridge/include/smoke/cbridge_CalculatorListener.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "smoke/CalculationResult.h"
#include "smoke/CalculatorListener.h"
#include <memory>
#include <new>
#include <unordered_map>
#include <vector>
void smoke_CalculatorListener_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::CalculatorListener>>(handle);
}
_baseRef smoke_CalculatorListener_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::CalculatorListener>>(handle)))
        : 0;
}
_baseRef
smoke_CalculatorListener_ResultStruct_create_handle( double result )
{
    ::smoke::CalculatorListener::ResultStruct* _struct = new ( std::nothrow ) ::smoke::CalculatorListener::ResultStruct();
    _struct->result = result;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_CalculatorListener_ResultStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::CalculatorListener::ResultStruct>( handle );
}
_baseRef
smoke_CalculatorListener_ResultStruct_create_optional_handle(double result)
{
    auto _struct = new ( std::nothrow ) genium::optional<::smoke::CalculatorListener::ResultStruct>( ::smoke::CalculatorListener::ResultStruct( ) );
    (*_struct)->result = result;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_CalculatorListener_ResultStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<genium::optional<::smoke::CalculatorListener::ResultStruct>*>( handle ) );
}
void smoke_CalculatorListener_ResultStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<genium::optional<::smoke::CalculatorListener::ResultStruct>*>( handle );
}
double smoke_CalculatorListener_ResultStruct_result_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::CalculatorListener::ResultStruct>(handle);
return struct_pointer->result;
}
void smoke_CalculatorListener_onCalculationResult(_baseRef _instance, double calculationResult) {
    return get_pointer<std::shared_ptr<::smoke::CalculatorListener>>(_instance)->get()->on_calculation_result(calculationResult)
;
}
void smoke_CalculatorListener_onCalculationResultConst(_baseRef _instance, double calculationResult) {
    return get_pointer<std::shared_ptr<::smoke::CalculatorListener>>(_instance)->get()->on_calculation_result_const(calculationResult)
;
}
void smoke_CalculatorListener_onCalculationResultStruct(_baseRef _instance, _baseRef calculationResult) {
    return get_pointer<std::shared_ptr<::smoke::CalculatorListener>>(_instance)->get()->on_calculation_result_struct(Conversion<::smoke::CalculatorListener::ResultStruct>::toCpp(calculationResult))
;
}
void smoke_CalculatorListener_onCalculationResultArray(_baseRef _instance, _baseRef calculationResult) {
    return get_pointer<std::shared_ptr<::smoke::CalculatorListener>>(_instance)->get()->on_calculation_result_array(Conversion<std::vector<double>>::toCpp(calculationResult))
;
}
void smoke_CalculatorListener_onCalculationResultMap(_baseRef _instance, _baseRef calculationResults) {
    return get_pointer<std::shared_ptr<::smoke::CalculatorListener>>(_instance)->get()->on_calculation_result_map(Conversion<::smoke::CalculatorListener::NamedCalculationResults>::toCpp(calculationResults))
;
}
void smoke_CalculatorListener_onCalculationResultInstance(_baseRef _instance, _baseRef calculationResult) {
    return get_pointer<std::shared_ptr<::smoke::CalculatorListener>>(_instance)->get()->on_calculation_result_instance(Conversion<std::shared_ptr<::smoke::CalculationResult>>::toCpp(calculationResult))
;
}
class smoke_CalculatorListenerProxy : public std::shared_ptr<::smoke::CalculatorListener>::element_type, public CachedProxyBase<smoke_CalculatorListenerProxy> {
public:
    smoke_CalculatorListenerProxy(smoke_CalculatorListener_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_CalculatorListenerProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    void on_calculation_result(double calculationResult) override {
        mFunctions.smoke_CalculatorListener_onCalculationResult(mFunctions.swift_pointer, calculationResult);    }
    void on_calculation_result_const(double calculationResult) const override {
        mFunctions.smoke_CalculatorListener_onCalculationResultConst(mFunctions.swift_pointer, calculationResult);    }
    void on_calculation_result_struct(const ::smoke::CalculatorListener::ResultStruct& calculationResult) override {
        mFunctions.smoke_CalculatorListener_onCalculationResultStruct(mFunctions.swift_pointer, Conversion<::smoke::CalculatorListener::ResultStruct>::toBaseRef(calculationResult));    }
    void on_calculation_result_array(const std::vector<double>& calculationResult) override {
        mFunctions.smoke_CalculatorListener_onCalculationResultArray(mFunctions.swift_pointer, Conversion<std::vector<double>>::toBaseRef(calculationResult));    }
    void on_calculation_result_map(const ::smoke::CalculatorListener::NamedCalculationResults& calculationResults) override {
        mFunctions.smoke_CalculatorListener_onCalculationResultMap(mFunctions.swift_pointer, Conversion<::smoke::CalculatorListener::NamedCalculationResults>::toBaseRef(calculationResults));    }
    void on_calculation_result_instance(const std::shared_ptr<::smoke::CalculationResult>& calculationResult) override {
        mFunctions.smoke_CalculatorListener_onCalculationResultInstance(mFunctions.swift_pointer, Conversion<std::shared_ptr<::smoke::CalculationResult>>::toBaseRef(calculationResult));    }
private:
    smoke_CalculatorListener_FunctionTable mFunctions;
};
_baseRef smoke_CalculatorListener_create_proxy(smoke_CalculatorListener_FunctionTable functionTable) {
    auto proxy = smoke_CalculatorListenerProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new std::shared_ptr<::smoke::CalculatorListener>(std::move(proxy))) : 0;
}
const void* smoke_CalculatorListener_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_CalculatorListenerProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::CalculatorListener>>(handle)->get()) : nullptr;
}
_baseRef smoke_CalculatorListener_NamedCalculationResults_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, double>() );
}
void smoke_CalculatorListener_NamedCalculationResults_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<std::string, double>>(handle);
}
_baseRef smoke_CalculatorListener_NamedCalculationResults_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, double>::iterator( get_pointer<std::unordered_map<std::string, double>>(handle)->begin() ) );
}
void smoke_CalculatorListener_NamedCalculationResults_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle );
}
void smoke_CalculatorListener_NamedCalculationResults_put(_baseRef handle, _baseRef key, double value) {
    (*get_pointer<std::unordered_map<std::string, double>>(handle)).emplace(std::move(Conversion<std::string>::toCpp(key)), std::move(value));
}
bool smoke_CalculatorListener_NamedCalculationResults_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<std::string, double>>(handle)->end();
}
void smoke_CalculatorListener_NamedCalculationResults_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle );
}
_baseRef smoke_CalculatorListener_NamedCalculationResults_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ))->first;
    return Conversion<std::string>::toBaseRef(key);
}
double smoke_CalculatorListener_NamedCalculationResults_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef smoke_CalculatorListener_NamedCalculationResults_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) genium::optional<std::unordered_map<std::string, double>>( std::unordered_map<std::string, double>( ) ) );
}
void smoke_CalculatorListener_NamedCalculationResults_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<genium::optional<std::unordered_map<std::string, double>>*>( handle );
}
_baseRef smoke_CalculatorListener_NamedCalculationResults_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<genium::optional<std::unordered_map<std::string, double>>*>( handle ) );
}