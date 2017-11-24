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
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <cstdint>
#include <vector>

namespace examples {

class Arrays {
public:
    virtual ~Arrays() = 0;
public:
struct SyncResult {
    uint64_t last_updated_time_stamp = 0;
    uint32_t number_of_changes = 0;
};
using SyncResults = ::std::vector< ::examples::Arrays::SyncResult >;

public:
static ::examples::Arrays::SyncResults explicit_array_method( const ::examples::Arrays::SyncResults& input );
static ::std::vector< ::examples::Arrays::SyncResult > implicit_array_method( const ::std::vector< ::examples::Arrays::SyncResult >& input );

};

}
