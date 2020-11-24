//
//
#include "cbridge/include/smoke/cbridge_Enums.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "foo/Bar.h"
#include "smoke/Enums.h"
#include <memory>
#include <new>
void smoke_Enums_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::Enums >>(handle);
}
_baseRef smoke_Enums_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::Enums >>(handle)))
        : 0;
}
const void* smoke_Enums_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::Enums >>(handle)->get())
        : nullptr;
}
void smoke_Enums_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::Enums >>(handle)->get(), swift_pointer);
}
void smoke_Enums_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::Enums >>(handle)->get());
}
void smoke_Enums_methodWithExternalEnum(smoke_Enums_ExternalEnum input) {
    return ::smoke::Enums::method_with_external_enum(static_cast<::smoke::Enums::External_Enum>(input));
}
