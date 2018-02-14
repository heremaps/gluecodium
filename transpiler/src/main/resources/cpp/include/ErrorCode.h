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

#include <cstdint>

namespace hf
{
typedef ::std::uint32_t ErrorCode;

namespace errors
{
const ErrorCode NONE = 0;

// TODO APIGEN-1176: Remove this constant when hf::Return is replaced.
const ErrorCode NULL_VALUE = 1;
}

}
