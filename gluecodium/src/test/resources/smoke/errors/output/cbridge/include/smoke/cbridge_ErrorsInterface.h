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
typedef uint32_t smoke_ErrorsInterface_InternalError;
typedef uint32_t smoke_ErrorsInterface_ExternalErrors;
typedef struct {
    bool has_value;
    smoke_ErrorsInterface_InternalError error_value;
} smoke_ErrorsInterface_methodWithErrors_result;
typedef struct {
    bool has_value;
    smoke_ErrorsInterface_ExternalErrors error_value;
} smoke_ErrorsInterface_methodWithExternalErrors_result;
typedef struct {
    bool has_value;
    union {
        smoke_ErrorsInterface_InternalError error_value;
        _baseRef returned_value;
    };
} smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result;
typedef struct {
    bool has_value;
    _baseRef error_value;
} smoke_ErrorsInterface_methodWithPayloadError_result;
typedef struct {
    bool has_value;
    union {
        _baseRef error_value;
        _baseRef returned_value;
    };
} smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_result;
_GLUECODIUM_C_EXPORT void smoke_ErrorsInterface_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_ErrorsInterface_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_ErrorsInterface_get_typed(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    smoke_ErrorsInterface_methodWithErrors_result(*smoke_ErrorsInterface_methodWithErrors)(void* swift_pointer);
    smoke_ErrorsInterface_methodWithExternalErrors_result(*smoke_ErrorsInterface_methodWithExternalErrors)(void* swift_pointer);
    smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result(*smoke_ErrorsInterface_methodWithErrorsAndReturnValue)(void* swift_pointer);
    smoke_ErrorsInterface_methodWithPayloadError_result(*smoke_ErrorsInterface_methodWithPayloadError)(void* swift_pointer);
    smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_result(*smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue)(void* swift_pointer);
} smoke_ErrorsInterface_FunctionTable;
_GLUECODIUM_C_EXPORT _baseRef smoke_ErrorsInterface_create_proxy(smoke_ErrorsInterface_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_ErrorsInterface_get_swift_object_from_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT smoke_ErrorsInterface_methodWithErrors_result smoke_ErrorsInterface_methodWithErrors(_baseRef _instance);
_GLUECODIUM_C_EXPORT smoke_ErrorsInterface_methodWithExternalErrors_result smoke_ErrorsInterface_methodWithExternalErrors(_baseRef _instance);
_GLUECODIUM_C_EXPORT smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result smoke_ErrorsInterface_methodWithErrorsAndReturnValue(_baseRef _instance);
_GLUECODIUM_C_EXPORT smoke_ErrorsInterface_methodWithPayloadError_result smoke_ErrorsInterface_methodWithPayloadError();
_GLUECODIUM_C_EXPORT smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_result smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue();
#ifdef __cplusplus
}
#endif
