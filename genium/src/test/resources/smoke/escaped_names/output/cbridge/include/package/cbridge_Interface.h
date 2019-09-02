//
//

#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
_GENIUM_C_EXPORT void package_Interface_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef package_Interface_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT void* package_Interface_get_typed(_baseRef handle);
typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
} package_Interface_FunctionTable;
_GENIUM_C_EXPORT _baseRef package_Interface_create_proxy(package_Interface_FunctionTable functionTable);
_GENIUM_C_EXPORT const void* package_Interface_get_swift_object_from_cache(_baseRef handle);
#ifdef __cplusplus
}
#endif