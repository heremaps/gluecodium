//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif

#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/StringHandle.h"
#include <stdbool.h>
#include <stdint.h>

typedef uint32_t smoke_Errors_InternalError;
typedef uint32_t smoke_Errors_ExternalErrors;
typedef struct {
    bool has_value;
    union {
        smoke_Errors_InternalError error_code;
        _baseRef returned_value;
    };
} smoke_Errors_methodWithErrorsAndReturnValue_result;

void smoke_Errors_release(_baseRef handle);
smoke_Errors_InternalError smoke_Errors_methodWithErrors();
smoke_Errors_ExternalErrors smoke_Errors_methodWithExternalErrors();
smoke_Errors_methodWithErrorsAndReturnValue_result smoke_Errors_methodWithErrorsAndReturnValue();

#ifdef __cplusplus
}
#endif
