// -------------------------------------------------------------------------------------------------
//
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
