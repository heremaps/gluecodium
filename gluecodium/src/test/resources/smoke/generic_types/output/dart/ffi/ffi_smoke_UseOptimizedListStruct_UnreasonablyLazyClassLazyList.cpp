#include "ConversionBase.h"
#include "ffi_smoke_UseOptimizedListStruct_UnreasonablyLazyClassLazyList.h"
#include "smoke/UnreasonablyLazyClass.h"
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
void
library_smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<std::shared_ptr<::smoke::UnreasonablyLazyClass>>>*>(handle);
}
uint64_t
library_smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get_size(FfiOpaqueHandle handle) {
    auto& vector = *reinterpret_cast<std::shared_ptr<std::vector<std::shared_ptr<::smoke::UnreasonablyLazyClass>>>*>(handle);
    return vector->size();
}
FfiOpaqueHandle
library_smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get(FfiOpaqueHandle handle, uint64_t index) {
    auto& vector = *reinterpret_cast<std::shared_ptr<std::vector<std::shared_ptr<::smoke::UnreasonablyLazyClass>>>*>(handle);
    auto& result = vector->operator[](index);
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::UnreasonablyLazyClass>>::toFfi(result);
}
#ifdef __cplusplus
}
#endif
