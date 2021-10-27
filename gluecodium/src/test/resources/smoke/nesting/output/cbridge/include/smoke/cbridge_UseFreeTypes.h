//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdbool.h>
#include <stdint.h>
typedef struct {
    bool has_value;
    union {
        uint32_t error_value;
        double returned_value;
    };
} smoke_UseFreeTypes_doStuff_result;
_GLUECODIUM_C_EXPORT void smoke_UseFreeTypes_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_UseFreeTypes_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_UseFreeTypes_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_UseFreeTypes_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_UseFreeTypes_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT smoke_UseFreeTypes_doStuff_result smoke_UseFreeTypes_doStuff(_baseRef _instance, _baseRef point, uint32_t mode);
#ifdef __cplusplus
}
#endif
