//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once

#include "cbridge/include/smoke/MethodOverloads.h"
#include "smoke/MethodOverloads.h"
#include <memory>

inline smoke::MethodOverloads::Point* get_pointer(smoke_MethodOverloads_PointRef handle) {
    return static_cast<smoke::MethodOverloads::Point*>(handle.private_pointer);
}
inline std::shared_ptr<smoke::MethodOverloads>* get_pointer(smoke_MethodOverloadsRef handle) {
    return static_cast<std::shared_ptr<smoke::MethodOverloads>*>(handle.private_pointer);
}
