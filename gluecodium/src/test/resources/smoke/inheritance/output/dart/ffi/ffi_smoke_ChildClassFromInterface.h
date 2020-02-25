#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT void smoke_ChildClassFromInterface_childClassMethod(FfiOpaqueHandle _self);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle smoke_ChildClassFromInterface_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void smoke_ChildClassFromInterface_release_handle(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
