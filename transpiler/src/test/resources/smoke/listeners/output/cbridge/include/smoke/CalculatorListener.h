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

#include "cbridge/include/BaseHandle.h"

_baseRef smoke_CalculatorListener_ResultStruct_create();
void smoke_CalculatorListener_ResultStruct_release(_baseRef handle);
double smoke_CalculatorListener_ResultStruct_result_get(_baseRef handle);
void smoke_CalculatorListener_ResultStruct_result_set(_baseRef handle, double result);
void smoke_CalculatorListener_release(_baseRef handle);

typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    void(*smoke_CalculatorListener_onCalculationResult)(void* swift_pointer, double calculationResult);
    void(*smoke_CalculatorListener_onCalculationResultConst)(void* swift_pointer, double calculationResult);
    void(*smoke_CalculatorListener_onCalculationResultStruct)(void* swift_pointer, _baseRef calculationResult);
    void(*smoke_CalculatorListener_onCalculationResultArray)(void* swift_pointer, _baseRef calculationResult);
} smoke_CalculatorListener_FunctionTable;

_baseRef smoke_CalculatorListener_createProxy(smoke_CalculatorListener_FunctionTable functionTable);
const void* smoke_CalculatorListener_get_swift_object_from_cache(_baseRef handle);
void smoke_CalculatorListener_onCalculationResult(_baseRef _instance, double calculationResult);
void smoke_CalculatorListener_onCalculationResultConst(_baseRef _instance, double calculationResult);
void smoke_CalculatorListener_onCalculationResultStruct(_baseRef _instance, _baseRef calculationResult);
void smoke_CalculatorListener_onCalculationResultArray(_baseRef _instance, _baseRef calculationResult);

#ifdef __cplusplus
}
#endif
