//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include <stdint.h>
_GLUECODIUM_C_EXPORT void dontsmoke_UseCppExternalTypes_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef dontsmoke_UseCppExternalTypes_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* dontsmoke_UseCppExternalTypes_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void dontsmoke_UseCppExternalTypes_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void dontsmoke_UseCppExternalTypes_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void dontsmoke_UseCppExternalTypes_useStruct(_baseRef input);
_GLUECODIUM_C_EXPORT void dontsmoke_UseCppExternalTypes_useEnum(uint32_t input);
_GLUECODIUM_C_EXPORT void dontsmoke_UseCppExternalTypes_useClass(_baseRef input);
#ifdef __cplusplus
}
#endif
