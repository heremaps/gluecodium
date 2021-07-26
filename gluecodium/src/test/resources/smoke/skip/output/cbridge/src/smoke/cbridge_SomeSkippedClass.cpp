//
//
#include "cbridge/include/smoke/cbridge_SomeSkippedClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "dont/smoke/DontSmokeEnum.h"
#include "smoke/SomeSkippedClass.h"
#include <memory>
#include <new>
void smoke_SomeSkippedClass_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::SomeSkippedClass >>(handle);
}
_baseRef smoke_SomeSkippedClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::SomeSkippedClass >>(handle)))
        : 0;
}
const void* smoke_SomeSkippedClass_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::SomeSkippedClass >>(handle)->get())
        : nullptr;
}
void smoke_SomeSkippedClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::SomeSkippedClass >>(handle)->get(), swift_pointer);
}
void smoke_SomeSkippedClass_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::SomeSkippedClass >>(handle)->get());
}
dont_smoke_DontSmokeEnum smoke_SomeSkippedClass_doFoo(_baseRef _instance) {
    return static_cast<dont_smoke_DontSmokeEnum>(get_pointer<::std::shared_ptr< ::smoke::SomeSkippedClass >>(_instance)->get()->do_foo());
}
