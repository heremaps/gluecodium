#include "ffi_smoke_SpecialNames.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "smoke/SpecialNames.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
void
library_smoke_SpecialNames_create(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SpecialNames>>::toCpp(_self)).create();
}
void
library_smoke_SpecialNames_release(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SpecialNames>>::toCpp(_self)).release();
}
void
library_smoke_SpecialNames_createProxy(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SpecialNames>>::toCpp(_self)).create_proxy();
}
void
library_smoke_SpecialNames_Uppercase(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::SpecialNames>>::toCpp(_self))._uppercase();
}
FfiOpaqueHandle
library_smoke_SpecialNames_make__String(int32_t _isolate_id, FfiOpaqueHandle result) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::SpecialNames>>::toFfi(
        smoke::SpecialNames::make(
            gluecodium::ffi::Conversion<std::string>::toCpp(result)
        )
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_SpecialNames_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::SpecialNames>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_SpecialNames_release_handle(handle);
}
void
library_smoke_SpecialNames_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_SpecialNames_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_SpecialNames_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::SpecialNames>(
            *reinterpret_cast<std::shared_ptr<smoke::SpecialNames>*>(handle)
        )
    );
}
void
library_smoke_SpecialNames_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::SpecialNames>*>(handle);
}
#ifdef __cplusplus
}
#endif
