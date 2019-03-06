// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "Export.h"
#include <cstdint>

namespace examples {

class _GENIUM_CPP_EXPORT Structs {
public:
    virtual ~Structs() = 0;
public:

struct _GENIUM_CPP_EXPORT SyncResult {
    uint64_t last_updated_time_stamp;
    uint32_t number_of_changes;
    SyncResult( );
    SyncResult( const uint64_t last_updated_time_stamp, const uint32_t number_of_changes );
};

struct _GENIUM_CPP_EXPORT IdentifiableSyncResult {
    int32_t id;
    ::examples::Structs::SyncResult sync_result;
    IdentifiableSyncResult( );
    IdentifiableSyncResult( const int32_t id, const ::examples::Structs::SyncResult& sync_result );
};

struct _GENIUM_CPP_EXPORT ImmutableSyncResult {
    const uint64_t last_updated_time_stamp;
    const uint32_t number_of_changes;
    ImmutableSyncResult( );
    ImmutableSyncResult( const uint64_t last_updated_time_stamp, const uint32_t number_of_changes );
};

public:
static ::examples::Structs::SyncResult method_with_non_nested_type( const ::examples::Structs::SyncResult& input );
static ::examples::Structs::IdentifiableSyncResult method_with_nested_type( const ::examples::Structs::IdentifiableSyncResult& input );

};

}
