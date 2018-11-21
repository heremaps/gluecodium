//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include "cbridge/include/BaseHandle.h"

void examples_CalculatorListener_release(_baseRef handle);
_baseRef examples_CalculatorListener_copy_handle(_baseRef handle);

typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    void(*examples_CalculatorListener_onCalculationResult)(void* swift_pointer, double calculationResult);
} examples_CalculatorListener_FunctionTable;

_baseRef examples_CalculatorListener_createProxy(examples_CalculatorListener_FunctionTable functionTable);
const void* examples_CalculatorListener_get_swift_object_from_cache(_baseRef handle);
void examples_CalculatorListener_onCalculationResult(_baseRef _instance, double calculationResult);

#ifdef __cplusplus
}
#endif
