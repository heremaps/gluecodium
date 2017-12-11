// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/StringHandleImpl.h"
#include <new>

std_stringRef std_string_create(const char* c_str) {
    return { new (std::nothrow) std::string(c_str) };
}

void std_string_release(std_stringRef handle) {
    delete get_pointer(handle);
}

const char* std_string_data_get(std_stringRef handle) {
    return get_pointer(handle)->data();
}

int64_t std_string_size_get(std_stringRef handle) {
    return get_pointer(handle)->size();
}
