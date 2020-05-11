//
//
#include "cbridge/include/smoke/cbridge_PointerEquatableClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/PointerEquatableClass.h"
#include <memory>
#include <new>
void smoke_PointerEquatableClass_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::PointerEquatableClass>>(handle);
}
_baseRef smoke_PointerEquatableClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::PointerEquatableClass>>(handle)))
        : 0;
}
const void* smoke_PointerEquatableClass_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<std::shared_ptr<::smoke::PointerEquatableClass>>(handle)->get())
        : nullptr;
}
void smoke_PointerEquatableClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<std::shared_ptr<::smoke::PointerEquatableClass>>(handle)->get(), swift_pointer);
}
void smoke_PointerEquatableClass_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<std::shared_ptr<::smoke::PointerEquatableClass>>(handle)->get());
}
bool smoke_PointerEquatableClass_equal(_baseRef lhs, _baseRef rhs) {
    return *get_pointer<std::shared_ptr<::smoke::PointerEquatableClass>>(lhs) == *get_pointer<std::shared_ptr<::smoke::PointerEquatableClass>>(rhs);
}
uint64_t smoke_PointerEquatableClass_hash(_baseRef handle) {
    return ::gluecodium::hash<std::shared_ptr<::smoke::PointerEquatableClass>>()(*get_pointer<std::shared_ptr<::smoke::PointerEquatableClass>>(handle));
}
