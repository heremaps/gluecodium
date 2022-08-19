//
//
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_UseOptimizedListStruct_VeryBigStructLazyList.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/VeryBigStruct.h"
#include <memory>
#include <new>
#include <string>
#ifdef __cplusplus
extern "C" {
#endif
void smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >>>(handle);
}
uint64_t smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get_size(_baseRef handle) {
    auto& vector = *get_pointer<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >>>(handle);
    return vector->size();
}
_baseRef smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get(_baseRef handle, uint64_t index) {
    auto& vector = *get_pointer<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >>>(handle);
    auto& result = *vector->operator[](index);
    return Conversion<::smoke::VeryBigStruct>::toBaseRef(result);
}
#ifdef __cplusplus
}
#endif
