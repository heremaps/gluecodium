#include "ConversionBase.h"
#include "ffi_smoke_UseOptimizedList_VeryBigStructLazyList.h"
#include "smoke/VeryBigStruct.h"
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_finalizer(FfiOpaqueHandle handle, int32_t /*isolate_id*/) {
    delete reinterpret_cast<std::shared_ptr<std::vector<::std::shared_ptr< ::smoke::VeryBigStruct >>>*>(handle);
}
void
library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
uint64_t
library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get_size(FfiOpaqueHandle handle) {
    auto& vector = *reinterpret_cast<std::shared_ptr<std::vector<::std::shared_ptr< ::smoke::VeryBigStruct >>>*>(handle);
    return vector->size();
}
FfiOpaqueHandle
library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get(FfiOpaqueHandle handle, uint64_t index) {
    auto& vector = *reinterpret_cast<std::shared_ptr<std::vector<::std::shared_ptr< ::smoke::VeryBigStruct >>>*>(handle);
    auto& result = *vector->operator[](index);
    return gluecodium::ffi::Conversion<::smoke::VeryBigStruct>::toFfi(result);
}
#ifdef __cplusplus
}
#endif
