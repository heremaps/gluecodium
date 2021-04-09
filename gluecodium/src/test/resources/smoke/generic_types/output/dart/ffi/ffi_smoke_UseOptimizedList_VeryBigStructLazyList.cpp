#include "ConversionBase.h"
#include "ffi_smoke_UseOptimizedList_VeryBigStructLazyList.h"
#include "smoke/VeryBigStruct.h"
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
void
library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<std::vector<::std::shared_ptr< ::smoke::VeryBigStruct >>>*>(handle);
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
