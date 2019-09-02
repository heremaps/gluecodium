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
typedef uint32_t smoke_ErrorsInterface_InternalError;
typedef uint32_t smoke_ErrorsInterface_ExternalErrors;
typedef struct {
    bool has_value;
    union {
        smoke_ErrorsInterface_InternalError error_code;
        _baseRef returned_value;
    };
} smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result;
_GENIUM_C_EXPORT void smoke_ErrorsInterface_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_ErrorsInterface_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT void* smoke_ErrorsInterface_get_typed(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    smoke_ErrorsInterface_InternalError(*smoke_ErrorsInterface_methodWithErrors)(void* swift_pointer);
    smoke_ErrorsInterface_ExternalErrors(*smoke_ErrorsInterface_methodWithExternalErrors)(void* swift_pointer);
    smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result(*smoke_ErrorsInterface_methodWithErrorsAndReturnValue)(void* swift_pointer);
} smoke_ErrorsInterface_FunctionTable;
_GENIUM_C_EXPORT _baseRef smoke_ErrorsInterface_create_proxy(smoke_ErrorsInterface_FunctionTable functionTable);
_GENIUM_C_EXPORT const void* smoke_ErrorsInterface_get_swift_object_from_cache(_baseRef handle);
_GENIUM_C_EXPORT smoke_ErrorsInterface_InternalError smoke_ErrorsInterface_methodWithErrors(_baseRef _instance);
_GENIUM_C_EXPORT smoke_ErrorsInterface_ExternalErrors smoke_ErrorsInterface_methodWithExternalErrors(_baseRef _instance);
_GENIUM_C_EXPORT smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result smoke_ErrorsInterface_methodWithErrorsAndReturnValue(_baseRef _instance);
#ifdef __cplusplus
}
#endif