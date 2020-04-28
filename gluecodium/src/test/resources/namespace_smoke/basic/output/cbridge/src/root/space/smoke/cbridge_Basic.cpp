//
//
#include "cbridge/include/root/space/smoke/cbridge_Basic.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "root/space/smoke/Basic.h"
#include <memory>
#include <new>
#include <string>
void smoke_Basic_release_handle(_baseRef handle) {
    auto ptr_ptr = get_pointer<std::shared_ptr<::root::space::smoke::Basic>>(handle);
    auto& wrapper_cache = get_wrapper_cache();
    if (wrapper_cache_is_alive) {
        wrapper_cache.remove_cached_wrapper(ptr_ptr->get());
    }
    delete ptr_ptr;
}
_baseRef smoke_Basic_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::root::space::smoke::Basic>>(handle)))
        : 0;
}
const void* smoke_Basic_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? get_wrapper_cache().get_cached_wrapper(get_pointer<std::shared_ptr<::root::space::smoke::Basic>>(handle)->get())
        : nullptr;
}
void smoke_Basic_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    get_wrapper_cache().cache_wrapper(get_pointer<std::shared_ptr<::root::space::smoke::Basic>>(handle)->get(), swift_pointer);
}
_baseRef smoke_Basic_basicMethod(_baseRef inputString) {
    return Conversion<std::string>::toBaseRef(::root::space::smoke::Basic::basic_method(Conversion<std::string>::toCpp(inputString)));
}
