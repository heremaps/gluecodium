#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include "dart_api_dl.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_Constructors_create(int32_t _isolate_id);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_Constructors_create__Constructors(int32_t _isolate_id, FfiOpaqueHandle other);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_Constructors_create__String_ULong(int32_t _isolate_id, FfiOpaqueHandle foo, uint64_t bar);
_GLUECODIUM_FFI_EXPORT void library_smoke_Constructors_create__String_return_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_Constructors_create__String_return_get_result(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT uint32_t library_smoke_Constructors_create__String_return_get_error(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT bool library_smoke_Constructors_create__String_return_has_error(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_Constructors_create__String(int32_t _isolate_id, FfiOpaqueHandle input);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_Constructors_create__ListOf_Double(int32_t _isolate_id, FfiOpaqueHandle input);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_Constructors_create__ULong(int32_t _isolate_id, uint64_t input);
_GLUECODIUM_FFI_EXPORT void library_smoke_Constructors_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_Constructors_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_Constructors_release_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_Constructors_ErrorEnum_create_handle_nullable(uint32_t value);
_GLUECODIUM_FFI_EXPORT void library_smoke_Constructors_ErrorEnum_release_handle_nullable(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT uint32_t library_smoke_Constructors_ErrorEnum_get_value_nullable(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_Constructors_get_type_id(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
