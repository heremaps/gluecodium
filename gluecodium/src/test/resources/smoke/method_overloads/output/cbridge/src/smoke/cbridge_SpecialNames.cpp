//
//
#include "cbridge/include/smoke/cbridge_SpecialNames.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "smoke/SpecialNames.h"
#include <memory>
#include <new>
#include <string>
void smoke_SpecialNames_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::SpecialNames >>(handle);
}
_baseRef smoke_SpecialNames_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::SpecialNames >>(handle)))
        : 0;
}
const void* smoke_SpecialNames_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::SpecialNames >>(handle)->get())
        : nullptr;
}
void smoke_SpecialNames_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::SpecialNames >>(handle)->get(), swift_pointer);
}
void smoke_SpecialNames_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::SpecialNames >>(handle)->get());
}
void smoke_SpecialNames_create(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::SpecialNames >>(_instance)->get()->create();
}
void smoke_SpecialNames_release(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::SpecialNames >>(_instance)->get()->release();
}
void smoke_SpecialNames_createProxy(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::SpecialNames >>(_instance)->get()->create_proxy();
}
void smoke_SpecialNames_Uppercase(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::SpecialNames >>(_instance)->get()->_uppercase();
}
_baseRef smoke_SpecialNames_make(_baseRef result) {
    return Conversion<::std::shared_ptr< ::smoke::SpecialNames >>::toBaseRef(::smoke::SpecialNames::make(Conversion<::std::string>::toCpp(result)));
}
