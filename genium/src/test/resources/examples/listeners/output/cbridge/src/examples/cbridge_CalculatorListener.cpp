//
//
// Automatically generated. Do not modify. Your changes will be lost.

#include "cbridge/include/examples/cbridge_CalculatorListener.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "examples/CalculatorListener.h"
#include <memory>
#include <new>

void examples_CalculatorListener_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::examples::CalculatorListener>>(handle);
}

_baseRef examples_CalculatorListener_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::examples::CalculatorListener>>(handle)))
        : 0;
}

void examples_CalculatorListener_onCalculationResult(_baseRef _instance, double calculationResult) {
    return get_pointer<std::shared_ptr<::examples::CalculatorListener>>(_instance)->get()->on_calculation_result(calculationResult);
}

class examples_CalculatorListenerProxy : public std::shared_ptr<::examples::CalculatorListener>::element_type, public CachedProxyBase<examples_CalculatorListenerProxy> {
public:
    using function_table_t = examples_CalculatorListener_FunctionTable;

    examples_CalculatorListenerProxy(examples_CalculatorListener_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }

    virtual ~examples_CalculatorListenerProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }

    void on_calculation_result(double calculationResult) override {
        return mFunctions.examples_CalculatorListener_onCalculationResult(mFunctions.swift_pointer, calculationResult);
    }

private:
    function_table_t mFunctions;
};

_baseRef examples_CalculatorListener_createProxy(examples_CalculatorListener_FunctionTable functionTable) {
    auto proxy = examples_CalculatorListenerProxy::get_proxy(std::move(functionTable));
    if (proxy) {
        return reinterpret_cast<_baseRef>( new std::shared_ptr<::examples::CalculatorListener>(std::move(proxy)) );
    } else {
        return 0;
    }
}

const void* examples_CalculatorListener_get_swift_object_from_cache(_baseRef handle) {
    return handle ? examples_CalculatorListenerProxy::get_swift_object(get_pointer<std::shared_ptr<::examples::CalculatorListener>>(handle)->get()) : nullptr;
}

