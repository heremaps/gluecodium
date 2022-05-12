#include "ffi_smoke_ChildClassWithBool.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/ChildClassWithBool.h"
#include <memory>
#include <stdbool.h>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
void
library_smoke_ChildClassWithBool_rootMethod__Boolean(FfiOpaqueHandle _self, int32_t _isolate_id, bool input1) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ChildClassWithBool>>::toCpp(_self)).root_method(
        gluecodium::ffi::Conversion<bool>::toCpp(input1)
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_ChildClassWithBool_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::ChildClassWithBool>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_ChildClassWithBool_release_handle(handle);
}
void
library_smoke_ChildClassWithBool_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_ChildClassWithBool_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_ChildClassWithBool_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::ChildClassWithBool>(
            *reinterpret_cast<std::shared_ptr<smoke::ChildClassWithBool>*>(handle)
        )
    );
}
void
library_smoke_ChildClassWithBool_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::ChildClassWithBool>*>(handle);
}
FfiOpaqueHandle
library_smoke_ChildClassWithBool_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::ChildClassWithBool>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif
