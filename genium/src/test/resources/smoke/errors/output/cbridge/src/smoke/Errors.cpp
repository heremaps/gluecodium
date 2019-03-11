//
//
// Automatically generated. Do not modify. Your changes will be lost.

#include "cbridge/include/smoke/Errors.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/Errors.h"
#include <memory>
#include <new>

void smoke_Errors_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<smoke::Errors>>(handle);
}


smoke_Errors_InternalError smoke_Errors_methodWithErrors() {
    return ::smoke::Errors::method_with_errors().value();
}
