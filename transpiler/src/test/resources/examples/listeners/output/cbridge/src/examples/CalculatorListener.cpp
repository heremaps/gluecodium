//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

#include "cbridge/include/examples/CalculatorListener.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/examples/CalculatorListenerImpl.h"
#include "examples/CalculatorListener.h"
#include <memory>
void examples_CalculatorListener_release(examples_CalculatorListenerRef handle) {
    delete get_pointer(handle);
}
void examples_CalculatorListener_onCalculationResult(examples_CalculatorListenerRef _instance, double calculationResult) {
    return get_pointer(_instance)->get()->on_calculation_result(calculationResult);
}
class examples_CalculatorListenerProxy : public std::shared_ptr<examples::CalculatorListener>::element_type, public CachedProxyBase<examples_CalculatorListenerProxy> {
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
examples_CalculatorListenerRef examples_CalculatorListener_createProxy(examples_CalculatorListener_FunctionTable functionTable) {
    return { new std::shared_ptr<examples::CalculatorListener>(examples_CalculatorListenerProxy::get_proxy(std::move(functionTable))) };
}
