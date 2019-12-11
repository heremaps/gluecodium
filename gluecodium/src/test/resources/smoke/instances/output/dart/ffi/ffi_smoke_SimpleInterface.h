#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle smoke_SimpleInterface_getStringValue(FfiOpaqueHandle _self);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle smoke_SimpleInterface_useSimpleInterface__SimpleInterface(FfiOpaqueHandle _self, FfiOpaqueHandle input);
_GLUECODIUM_FFI_EXPORT void smoke_SimpleInterface_release_handle(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
