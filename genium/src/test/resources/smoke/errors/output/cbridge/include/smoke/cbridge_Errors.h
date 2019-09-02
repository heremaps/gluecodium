//
//

#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
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
_GENIUM_C_EXPORT void smoke_Errors_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_Errors_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT smoke_Errors_InternalError smoke_Errors_methodWithErrors();
_GENIUM_C_EXPORT smoke_Errors_ExternalErrors smoke_Errors_methodWithExternalErrors();
_GENIUM_C_EXPORT smoke_Errors_methodWithErrorsAndReturnValue_result smoke_Errors_methodWithErrorsAndReturnValue();
_GENIUM_C_EXPORT smoke_Errors_InternalError smoke_Errors_methodWithAliasedError();
#ifdef __cplusplus
}
#endif
