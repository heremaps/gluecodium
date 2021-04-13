//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GLUECODIUM_C_EXPORT void smoke_EnableIfEnabled_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_EnableIfEnabled_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_EnableIfEnabled_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_EnableIfEnabled_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_EnableIfEnabled_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_EnableIfEnabled_enableIfUnquoted();
_GLUECODIUM_C_EXPORT void smoke_EnableIfEnabled_enableIfUnquotedList();
_GLUECODIUM_C_EXPORT void smoke_EnableIfEnabled_enableIfQuoted();
_GLUECODIUM_C_EXPORT void smoke_EnableIfEnabled_enableIfQuotedList();
_GLUECODIUM_C_EXPORT void smoke_EnableIfEnabled_enableIfTagged();
_GLUECODIUM_C_EXPORT void smoke_EnableIfEnabled_enableIfTaggedList();
_GLUECODIUM_C_EXPORT void smoke_EnableIfEnabled_enableIfMixedList();
#ifdef __cplusplus
}
#endif
