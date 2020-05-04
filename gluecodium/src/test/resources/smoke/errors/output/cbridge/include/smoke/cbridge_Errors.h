//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_Payload.h"
#include <stdbool.h>
#include <stdint.h>
typedef uint32_t smoke_Errors_InternalErrorCode;
typedef uint32_t smoke_Errors_ExternalErrors;
typedef struct {
    bool has_value;
    smoke_Errors_InternalErrorCode error_value;
} smoke_Errors_methodWithErrors_result;
typedef struct {
    bool has_value;
    smoke_Errors_ExternalErrors error_value;
} smoke_Errors_methodWithExternalErrors_result;
typedef struct {
    bool has_value;
    union {
        smoke_Errors_InternalErrorCode error_value;
        _baseRef returned_value;
    };
} smoke_Errors_methodWithErrorsAndReturnValue_result;
typedef struct {
    bool has_value;
    _baseRef error_value;
} smoke_Errors_methodWithPayloadError_result;
typedef struct {
    bool has_value;
    union {
        _baseRef error_value;
        _baseRef returned_value;
    };
} smoke_Errors_methodWithPayloadErrorAndReturnValue_result;
_GLUECODIUM_C_EXPORT void smoke_Errors_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_Errors_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_Errors_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_Errors_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_Errors_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT smoke_Errors_methodWithErrors_result smoke_Errors_methodWithErrors();
_GLUECODIUM_C_EXPORT smoke_Errors_methodWithExternalErrors_result smoke_Errors_methodWithExternalErrors();
_GLUECODIUM_C_EXPORT smoke_Errors_methodWithErrorsAndReturnValue_result smoke_Errors_methodWithErrorsAndReturnValue();
_GLUECODIUM_C_EXPORT smoke_Errors_methodWithPayloadError_result smoke_Errors_methodWithPayloadError();
_GLUECODIUM_C_EXPORT smoke_Errors_methodWithPayloadErrorAndReturnValue_result smoke_Errors_methodWithPayloadErrorAndReturnValue();
#ifdef __cplusplus
}
#endif
