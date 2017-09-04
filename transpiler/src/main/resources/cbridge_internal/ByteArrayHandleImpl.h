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

#pragma once
#include "cbridge/ByteArrayHandle.h"
#include <vector>

inline static std::vector<uint8_t>* get_pointer(byteArrayRef handle) {
    return static_cast<std::vector<uint8_t>*>(handle.private_pointer);
}
