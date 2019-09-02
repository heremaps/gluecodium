//
//

#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GENIUM_C_EXPORT void examples_CalculatorListener_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef examples_CalculatorListener_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT void* examples_CalculatorListener_get_typed(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    void(*examples_CalculatorListener_onCalculationResult)(void* swift_pointer, double calculationResult);
} examples_CalculatorListener_FunctionTable;
_GENIUM_C_EXPORT _baseRef examples_CalculatorListener_create_proxy(examples_CalculatorListener_FunctionTable functionTable);
_GENIUM_C_EXPORT const void* examples_CalculatorListener_get_swift_object_from_cache(_baseRef handle);
_GENIUM_C_EXPORT void examples_CalculatorListener_onCalculationResult(_baseRef _instance, double calculationResult);
#ifdef __cplusplus
}
#endif