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
#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    void* const private_pointer;
} examples_CalculatorListenerRef;

void examples_CalculatorListener_release(examples_CalculatorListenerRef handle);

typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    void(*examples_CalculatorListener_onCalculationResult)(void* swift_pointer, double calculationResult);
} examples_CalculatorListener_FunctionTable;

examples_CalculatorListenerRef examples_CalculatorListener_createProxy(examples_CalculatorListener_FunctionTable functionTable);
void examples_CalculatorListener_onCalculationResult(examples_CalculatorListenerRef _instance, double calculationResult);

#ifdef __cplusplus
}
#endif