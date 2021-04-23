//
//
#include "cbridge/include/smoke/cbridge_UseOptimizedList_UnreasonablyLazyClassLazyList.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "smoke/UnreasonablyLazyClass.h"
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
void smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>>(handle);
}
uint64_t smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get_size(_baseRef handle) {
    auto& vector = *get_pointer<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>>(handle);
    return vector->size();
}
_baseRef smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get(_baseRef handle, uint64_t index) {
    auto& vector = *get_pointer<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>>(handle);
    auto& result = vector->operator[](index);
    return Conversion<::std::shared_ptr< ::smoke::UnreasonablyLazyClass >>::toBaseRef(result);
}
#ifdef __cplusplus
}
#endif
