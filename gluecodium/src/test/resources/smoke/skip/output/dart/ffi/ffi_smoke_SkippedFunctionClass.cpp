#include "ffi_smoke_SkippedFunctionClass.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "smoke/SkippedFunctionClass.h"
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_SkippedFunctionClass_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::SkippedFunctionClass>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_SkippedFunctionClass_release_handle(handle);
}
void
library_smoke_SkippedFunctionClass_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_SkippedFunctionClass_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_SkippedFunctionClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::SkippedFunctionClass>(
            *reinterpret_cast<std::shared_ptr<smoke::SkippedFunctionClass>*>(handle)
        )
    );
}
void
library_smoke_SkippedFunctionClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::SkippedFunctionClass>*>(handle);
}
#ifdef __cplusplus
}
#endif
