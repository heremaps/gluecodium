//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
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
_baseRef smoke_Errors_copy(_baseRef handle) {
    return { new std::shared_ptr<smoke::Errors>(*get_pointer<std::shared_ptr<smoke::Errors>>(handle)) };
}



smoke_Errors_InternalError smoke_Errors_methodWithErrors() {
    return ::smoke::Errors::method_with_errors().code().code();
}


