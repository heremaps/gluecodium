//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/smoke/cbridge_EnumsInTypeCollection.h"
_GLUECODIUM_C_EXPORT void smoke_EnumsInTypeCollectionInterface_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_EnumsInTypeCollectionInterface_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_EnumsInTypeCollectionInterface_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_EnumsInTypeCollectionInterface_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_EnumsInTypeCollectionInterface_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT smoke_EnumsInTypeCollection_TCEnum smoke_EnumsInTypeCollectionInterface_flipEnumValue(smoke_EnumsInTypeCollection_TCEnum input);
#ifdef __cplusplus
}
#endif
