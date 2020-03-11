//
//

#include "cbridge/include/smoke/cbridge_PointerEquatableClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
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
bool smoke_PointerEquatableClass_equal(_baseRef lhs, _baseRef rhs) {
    return *get_pointer<std::shared_ptr<::smoke::PointerEquatableClass>>(lhs) == *get_pointer<std::shared_ptr<::smoke::PointerEquatableClass>>(rhs);
}
uint64_t smoke_PointerEquatableClass_hash(_baseRef handle) {
    return ::gluecodium::hash<std::shared_ptr<::smoke::PointerEquatableClass>>()(*get_pointer<std::shared_ptr<::smoke::PointerEquatableClass>>(handle));
}
