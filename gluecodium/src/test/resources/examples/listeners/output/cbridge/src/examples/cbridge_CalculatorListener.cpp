//
//

#include "cbridge/include/examples/cbridge_CalculatorListener.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "examples/CalculatorListener.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include <memory>
#include <new>
void examples_CalculatorListener_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::examples::CalculatorListener>>(handle);
}
_baseRef examples_CalculatorListener_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::examples::CalculatorListener>>(handle)))
        : 0;
}
extern "C" {
extern void* _CBridgeInitexamples_CalculatorListener(_baseRef handle);
}
namespace {
struct examples_CalculatorListenerRegisterInit {
    examples_CalculatorListenerRegisterInit() {
        get_init_repository().add_init("examples_CalculatorListener", &_CBridgeInitexamples_CalculatorListener);
    }
} s_examples_CalculatorListener_register_init;
}
void* examples_CalculatorListener_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository(static_cast<std::shared_ptr<::examples::CalculatorListener>::element_type*>(nullptr)).get_id(get_pointer<std::shared_ptr<::examples::CalculatorListener>>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitexamples_CalculatorListener(handle);
}
void examples_CalculatorListener_onCalculationResult(_baseRef _instance, double calculationResult) {
    return get_pointer<std::shared_ptr<::examples::CalculatorListener>>(_instance)->get()->on_calculation_result(calculationResult)
;
}
class examples_CalculatorListenerProxy : public std::shared_ptr<::examples::CalculatorListener>::element_type, public CachedProxyBase<examples_CalculatorListenerProxy> {
public:
    examples_CalculatorListenerProxy(examples_CalculatorListener_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~examples_CalculatorListenerProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    void on_calculation_result(double calculationResult) override {
        mFunctions.examples_CalculatorListener_onCalculationResult(mFunctions.swift_pointer, calculationResult);    }
private:
    examples_CalculatorListener_FunctionTable mFunctions;
};
_baseRef examples_CalculatorListener_create_proxy(examples_CalculatorListener_FunctionTable functionTable) {
    auto proxy = examples_CalculatorListenerProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new std::shared_ptr<::examples::CalculatorListener>(std::move(proxy))) : 0;
}
const void* examples_CalculatorListener_get_swift_object_from_cache(_baseRef handle) {
    return handle ? examples_CalculatorListenerProxy::get_swift_object(get_pointer<std::shared_ptr<::examples::CalculatorListener>>(handle)->get()) : nullptr;
}