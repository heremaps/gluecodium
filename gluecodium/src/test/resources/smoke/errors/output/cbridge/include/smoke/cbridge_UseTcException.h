//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/smoke/cbridge_SomeTypeCollection.h"
#include <stdbool.h>
typedef struct {
    bool has_value;
    smoke_SomeTypeCollection_SomeTypeCollectionError error_value;
} smoke_UseTcException_doNothing_result;
_GLUECODIUM_C_EXPORT void smoke_UseTcException_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_UseTcException_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_UseTcException_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_UseTcException_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_UseTcException_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT smoke_UseTcException_doNothing_result smoke_UseTcException_doNothing(_baseRef _instance);
#ifdef __cplusplus
}
#endif
