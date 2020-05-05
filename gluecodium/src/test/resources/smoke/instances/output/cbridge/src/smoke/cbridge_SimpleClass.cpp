//
//
#include "cbridge/include/smoke/cbridge_SimpleClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/SimpleClass.h"
#include <memory>
#include <new>
#include <string>
void smoke_SimpleClass_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::SimpleClass>>(handle);
}
_baseRef smoke_SimpleClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::SimpleClass>>(handle)))
        : 0;
}
const void* smoke_SimpleClass_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? get_wrapper_cache().get_cached_wrapper(get_pointer<std::shared_ptr<::smoke::SimpleClass>>(handle)->get())
        : nullptr;
}
void smoke_SimpleClass_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    get_wrapper_cache().cache_wrapper(get_pointer<std::shared_ptr<::smoke::SimpleClass>>(handle)->get(), swift_pointer);
}
void smoke_SimpleClass_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!wrapper_cache_is_alive) return;
    get_wrapper_cache().remove_cached_wrapper(get_pointer<std::shared_ptr<::smoke::SimpleClass>>(handle)->get());
}
_baseRef smoke_SimpleClass_getStringValue(_baseRef _instance) {
    return Conversion<std::string>::toBaseRef(get_pointer<std::shared_ptr<::smoke::SimpleClass>>(_instance)->get()->get_string_value());
}
_baseRef smoke_SimpleClass_useSimpleClass(_baseRef _instance, _baseRef input) {
    return Conversion<std::shared_ptr<::smoke::SimpleClass>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::SimpleClass>>(_instance)->get()->use_simple_class(Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp(input)));
}
