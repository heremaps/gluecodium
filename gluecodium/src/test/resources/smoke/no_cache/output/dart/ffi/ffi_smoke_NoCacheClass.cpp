#include "ffi_smoke_NoCacheClass.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "smoke/NoCacheClass.h"
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_NoCacheClass_make(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::NoCacheClass>>::toFfi(
        smoke::NoCacheClass::make()
    );
}
void
library_smoke_NoCacheClass_foo(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::NoCacheClass>>::toCpp(_self)).foo();
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_NoCacheClass_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    library_smoke_NoCacheClass_release_handle(handle);
}
void
library_smoke_NoCacheClass_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_NoCacheClass_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_NoCacheClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::NoCacheClass>(
            *reinterpret_cast<std::shared_ptr<smoke::NoCacheClass>*>(handle)
        )
    );
}
void
library_smoke_NoCacheClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::NoCacheClass>*>(handle);
}
#ifdef __cplusplus
}
#endif
