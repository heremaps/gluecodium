#pragma once
#include "OpaqueHandle.h"
#include "dart_api_dl.h"
#ifdef __cplusplus
extern "C" {
#endif
struct FinalizerData {
    FfiOpaqueHandle ffi_handle;
    int32_t isolate_id;
    void (*finalizer)(FfiOpaqueHandle, int32_t);
};
_GLUECODIUM_FFI_EXPORT void library_execute_finalizer(void*, void* data);
#ifdef __cplusplus
}
#endif
