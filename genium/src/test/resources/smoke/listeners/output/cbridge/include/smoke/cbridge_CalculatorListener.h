//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_CalculationResult.h"
#include <stdbool.h>
_baseRef smoke_CalculatorListener_ResultStruct_create_handle(double result);
void smoke_CalculatorListener_ResultStruct_release_handle(_baseRef handle);
double smoke_CalculatorListener_ResultStruct_result_get(_baseRef handle);
void smoke_CalculatorListener_release_handle(_baseRef handle);
_baseRef smoke_CalculatorListener_copy_handle(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    void(*smoke_CalculatorListener_onCalculationResult)(void* swift_pointer, double calculationResult);
    void(*smoke_CalculatorListener_onCalculationResultConst)(void* swift_pointer, double calculationResult);
    void(*smoke_CalculatorListener_onCalculationResultStruct)(void* swift_pointer, _baseRef calculationResult);
    void(*smoke_CalculatorListener_onCalculationResultArray)(void* swift_pointer, _baseRef calculationResult);
    void(*smoke_CalculatorListener_onCalculationResultMap)(void* swift_pointer, _baseRef calculationResults);
    void(*smoke_CalculatorListener_onCalculationResultInstance)(void* swift_pointer, _baseRef calculationResult);
} smoke_CalculatorListener_FunctionTable;
_baseRef smoke_CalculatorListener_create_proxy(smoke_CalculatorListener_FunctionTable functionTable);
const void* smoke_CalculatorListener_get_swift_object_from_cache(_baseRef handle);
void smoke_CalculatorListener_onCalculationResult(_baseRef _instance, double calculationResult);
void smoke_CalculatorListener_onCalculationResultConst(_baseRef _instance, double calculationResult);
void smoke_CalculatorListener_onCalculationResultStruct(_baseRef _instance, _baseRef calculationResult);
void smoke_CalculatorListener_onCalculationResultArray(_baseRef _instance, _baseRef calculationResult);
void smoke_CalculatorListener_onCalculationResultMap(_baseRef _instance, _baseRef calculationResults);
void smoke_CalculatorListener_onCalculationResultInstance(_baseRef _instance, _baseRef calculationResult);
_baseRef smoke_CalculatorListener_NamedCalculationResults_create_handle();
void smoke_CalculatorListener_NamedCalculationResults_release_handle(_baseRef handle);
_baseRef smoke_CalculatorListener_NamedCalculationResults_iterator(_baseRef handle);
void smoke_CalculatorListener_NamedCalculationResults_iterator_release_handle(_baseRef iterator_handle);
void smoke_CalculatorListener_NamedCalculationResults_put(_baseRef handle, _baseRef key, double value);
bool smoke_CalculatorListener_NamedCalculationResults_iterator_is_valid(_baseRef handle, _baseRef iterator_handle);
void smoke_CalculatorListener_NamedCalculationResults_iterator_increment(_baseRef iterator_handle);
_baseRef smoke_CalculatorListener_NamedCalculationResults_iterator_key(_baseRef iterator_handle);
double smoke_CalculatorListener_NamedCalculationResults_iterator_value(_baseRef iterator_handle);
#ifdef __cplusplus
}
#endif