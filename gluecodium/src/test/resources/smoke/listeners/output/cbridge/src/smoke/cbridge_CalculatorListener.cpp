//
//
#include "cbridge/include/smoke/cbridge_CalculatorListener.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/TypeRepository.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/CalculationResult.h"
#include "smoke/CalculatorListener.h"
#include <memory>
#include <new>
#include <optional>
#include <string>
#include <unordered_map>
#include <vector>
void smoke_CalculatorListener_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(handle);
}
_baseRef smoke_CalculatorListener_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(handle)))
        : 0;
}
const void* smoke_CalculatorListener_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(handle)->get())
        : nullptr;
}
void smoke_CalculatorListener_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(handle)->get(), swift_pointer);
}
void smoke_CalculatorListener_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_CalculatorListener(_baseRef handle);
}
namespace {
struct smoke_CalculatorListenerRegisterInit {
    smoke_CalculatorListenerRegisterInit() {
        get_init_repository().add_init("smoke_CalculatorListener", &_CBridgeInitsmoke_CalculatorListener);
    }
} s_smoke_CalculatorListener_register_init;
}
void* smoke_CalculatorListener_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository().get_id(get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_CalculatorListener(handle);
}
void smoke_CalculatorListener_onCalculationResult(_baseRef _instance, double calculationResult) {
    return get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(_instance)->get()->on_calculation_result(calculationResult);
}
void smoke_CalculatorListener_onCalculationResultConst(_baseRef _instance, double calculationResult) {
    return get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(_instance)->get()->on_calculation_result_const(calculationResult);
}
void smoke_CalculatorListener_onCalculationResultStruct(_baseRef _instance, _baseRef calculationResult) {
    return get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(_instance)->get()->on_calculation_result_struct(Conversion<::smoke::CalculatorListener::ResultStruct>::toCpp(calculationResult));
}
void smoke_CalculatorListener_onCalculationResultArray(_baseRef _instance, _baseRef calculationResult) {
    return get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(_instance)->get()->on_calculation_result_array(Conversion<::std::vector< double >>::toCpp(calculationResult));
}
void smoke_CalculatorListener_onCalculationResultMap(_baseRef _instance, _baseRef calculationResults) {
    return get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(_instance)->get()->on_calculation_result_map(Conversion<::std::unordered_map< ::std::string, double >>::toCpp(calculationResults));
}
void smoke_CalculatorListener_onCalculationResultInstance(_baseRef _instance, _baseRef calculationResult) {
    return get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(_instance)->get()->on_calculation_result_instance(Conversion<::std::shared_ptr< ::smoke::CalculationResult >>::toCpp(calculationResult));
}
class smoke_CalculatorListenerProxy : public ::smoke::CalculatorListener, public CachedProxyBase<smoke_CalculatorListenerProxy> {
public:
    smoke_CalculatorListenerProxy(smoke_CalculatorListener_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_CalculatorListenerProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_CalculatorListenerProxy(const smoke_CalculatorListenerProxy&) = delete;
    smoke_CalculatorListenerProxy& operator=(const smoke_CalculatorListenerProxy&) = delete;
    void on_calculation_result(double calculationResult) override {
        mFunctions.smoke_CalculatorListener_onCalculationResult(mFunctions.swift_pointer, calculationResult);
    }
    void on_calculation_result_const(double calculationResult) const override {
        mFunctions.smoke_CalculatorListener_onCalculationResultConst(mFunctions.swift_pointer, calculationResult);
    }
    void on_calculation_result_struct(const ::smoke::CalculatorListener::ResultStruct& calculationResult) override {
        mFunctions.smoke_CalculatorListener_onCalculationResultStruct(mFunctions.swift_pointer, Conversion<::smoke::CalculatorListener::ResultStruct>::toBaseRef(calculationResult));
    }
    void on_calculation_result_array(const ::std::vector< double >& calculationResult) override {
        mFunctions.smoke_CalculatorListener_onCalculationResultArray(mFunctions.swift_pointer, Conversion<::std::vector< double >>::toBaseRef(calculationResult));
    }
    void on_calculation_result_map(const ::std::unordered_map< ::std::string, double >& calculationResults) override {
        mFunctions.smoke_CalculatorListener_onCalculationResultMap(mFunctions.swift_pointer, Conversion<::std::unordered_map< ::std::string, double >>::toBaseRef(calculationResults));
    }
    void on_calculation_result_instance(const ::std::shared_ptr< ::smoke::CalculationResult >& calculationResult) override {
        mFunctions.smoke_CalculatorListener_onCalculationResultInstance(mFunctions.swift_pointer, Conversion<::std::shared_ptr< ::smoke::CalculationResult >>::toBaseRef(calculationResult));
    }
private:
    smoke_CalculatorListener_FunctionTable mFunctions;
};
_baseRef smoke_CalculatorListener_create_proxy(smoke_CalculatorListener_FunctionTable functionTable) {
    auto proxy = smoke_CalculatorListenerProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::CalculatorListener >(proxy)) : 0;
}
const void* smoke_CalculatorListener_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_CalculatorListenerProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::CalculatorListener >>(handle)->get()) : nullptr;
}
_baseRef
smoke_CalculatorListener_ResultStruct_create_handle( double result )
{
    ::smoke::CalculatorListener::ResultStruct* _struct = new ( ::std::nothrow ) ::smoke::CalculatorListener::ResultStruct();
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
    auto _struct = new ( ::std::nothrow ) std::optional<::smoke::CalculatorListener::ResultStruct>( ::smoke::CalculatorListener::ResultStruct( ) );
    (*_struct)->result = result;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_CalculatorListener_ResultStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::smoke::CalculatorListener::ResultStruct>*>( handle ) );
}
void smoke_CalculatorListener_ResultStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::smoke::CalculatorListener::ResultStruct>*>( handle );
}
double smoke_CalculatorListener_ResultStruct_result_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::CalculatorListener::ResultStruct>(handle);
    return struct_pointer->result;
}
