//
//
#include "cbridge/include/smoke/cbridge_NoCacheClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "smoke/NoCacheClass.h"
#include <memory>
#include <new>
void smoke_NoCacheClass_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::NoCacheClass >>(handle);
}
_baseRef smoke_NoCacheClass_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::NoCacheClass >>(handle)))
        : 0;
}
_baseRef smoke_NoCacheClass_make() {
    return Conversion<::std::shared_ptr< ::smoke::NoCacheClass >>::toBaseRef(::smoke::NoCacheClass::make());
}
void smoke_NoCacheClass_foo(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::NoCacheClass >>(_instance)->get()->foo();
}
