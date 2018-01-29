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

namespace examples {

class Structs {
public:
    virtual ~Structs() = 0;
public:
struct SyncResult {
    uint64_t last_updated_time_stamp;
    uint32_t number_of_changes;
};
struct IdentifiableSyncResult {
    int32_t id;
    ::examples::Structs::SyncResult sync_result;
};

public:
static ::examples::Structs::SyncResult method_with_non_nested_type( const ::examples::Structs::SyncResult& input );
static ::examples::Structs::IdentifiableSyncResult method_with_nested_type( const ::examples::Structs::IdentifiableSyncResult& input );

};

}
