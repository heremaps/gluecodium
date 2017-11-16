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
#include "cbridge/include/smoke/CalculatorListener.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/smoke/CalculatorListenerImpl.h"
#include "smoke/CalculatorListener.h"
#include <memory>
void smoke_CalculatorListener_release(smoke_CalculatorListenerRef handle) {
    delete get_pointer(handle);
}
void smoke_CalculatorListener_onCalculationResult(smoke_CalculatorListenerRef _instance, double calculationResult) {
    return get_pointer(_instance)->get()->on_calculation_result(calculationResult);
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
private:
    function_table_t mFunctions;
};
smoke_CalculatorListenerRef smoke_CalculatorListener_createProxy(smoke_CalculatorListener_FunctionTable functionTable) {
    return { new std::shared_ptr<smoke::CalculatorListener>(smoke_CalculatorListenerProxy::get_proxy(std::move(functionTable))) };
}