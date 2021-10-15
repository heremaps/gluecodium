//
//
#include "cbridge/include/smoke/cbridge_SkippedFunctionClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "smoke/SkippedFunctionClass.h"
#include <memory>
#include <new>
void smoke_SkippedFunctionClass_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::SkippedFunctionClass >>(handle);
}
_baseRef smoke_SkippedFunctionClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::SkippedFunctionClass >>(handle)))
        : 0;
}
const void* smoke_SkippedFunctionClass_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::SkippedFunctionClass >>(handle)->get())
        : nullptr;
}
void smoke_SkippedFunctionClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::SkippedFunctionClass >>(handle)->get(), swift_pointer);
}
void smoke_SkippedFunctionClass_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::SkippedFunctionClass >>(handle)->get());
}
