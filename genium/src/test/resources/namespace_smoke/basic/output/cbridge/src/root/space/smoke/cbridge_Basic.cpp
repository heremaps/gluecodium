//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/root/space/smoke/cbridge_Basic.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "genium/Optional.h"
#include "genium/TypeRepository.h"
#include "root/space/smoke/Basic.h"
#include <memory>
#include <new>
#include <string>
void smoke_Basic_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::root::space::smoke::Basic>>(handle);
}
_baseRef smoke_Basic_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::root::space::smoke::Basic>>(handle)))
        : 0;
}
_baseRef smoke_Basic_basicMethod(_baseRef inputString) {
    return Conversion<std::string>::toBaseRef(::root::space::smoke::Basic::basic_method(Conversion<std::string>::toCpp(inputString)))
;
}
