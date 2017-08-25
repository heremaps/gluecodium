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
#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

typedef struct {
    void* const private_pointer;
} byteArrayRef;

const uint8_t* byteArray_data_get(byteArrayRef handle);
int64_t byteArray_size_get(byteArrayRef handle);
void byteArray_release(byteArrayRef handle);

#ifdef __cplusplus
}
#endif
