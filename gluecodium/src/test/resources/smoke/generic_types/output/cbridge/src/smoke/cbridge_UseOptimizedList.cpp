//
//
#include "cbridge\include\smoke\cbridge_UseOptimizedList.h"
#include "cbridge_internal\include\BaseHandleImpl.h"
#include "cbridge_internal\include\TypeInitRepository.h"
#include "cbridge_internal\include\WrapperCache.h"
#include "gluecodium\VectorHash.h"
#include "smoke\UnreasonablyLazyClass.h"
#include "smoke\UseOptimizedList.h"
#include "smoke\VeryBigStruct.h"
#include <memory>
#include <new>
#include <vector>
void smoke_UseOptimizedList_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::UseOptimizedList >>(handle);
}
_baseRef smoke_UseOptimizedList_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::UseOptimizedList >>(handle)))
        : 0;
}
const void* smoke_UseOptimizedList_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::UseOptimizedList >>(handle)->get())
        : nullptr;
}
void smoke_UseOptimizedList_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::UseOptimizedList >>(handle)->get(), swift_pointer);
}
void smoke_UseOptimizedList_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::UseOptimizedList >>(handle)->get());
}
_baseRef smoke_UseOptimizedList_fetchTheBigOnes() {
    return reinterpret_cast<_baseRef>(
        new (std::nothrow) std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >>(
            new (std::nothrow) ::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >(::smoke::UseOptimizedList::fetch_the_big_ones())
        )
    );
}
_baseRef smoke_UseOptimizedList_lazyOnes_get() {
    return reinterpret_cast<_baseRef>(
        new (std::nothrow) std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>(
            new (std::nothrow) ::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >(::smoke::UseOptimizedList::get_lazy_ones())
        )
    );
}
