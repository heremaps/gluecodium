
#pragma once

#include "Export.h"
#include "OpaqueHandle.h"
#include "dart_api_dl.h"
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif




_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_InterfaceWithStatic_regularFunction(FfiOpaqueHandle _self, int32_t _isolate_id);



_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_InterfaceWithStatic_staticFunction(int32_t _isolate_id);




_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_InterfaceWithStatic_regularProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id);



_GLUECODIUM_FFI_EXPORT void library_smoke_InterfaceWithStatic_regularProperty_set__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value);




_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_InterfaceWithStatic_staticProperty_get(int32_t _isolate_id);



_GLUECODIUM_FFI_EXPORT void library_smoke_InterfaceWithStatic_staticProperty_set__String(int32_t _isolate_id, FfiOpaqueHandle value);












_GLUECODIUM_FFI_EXPORT void library_smoke_InterfaceWithStatic_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_InterfaceWithStatic_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_InterfaceWithStatic_release_handle(FfiOpaqueHandle handle);

_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_InterfaceWithStatic_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle f0, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s);



_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_InterfaceWithStatic_get_type_id(FfiOpaqueHandle handle);

#ifdef __cplusplus
}
#endif
