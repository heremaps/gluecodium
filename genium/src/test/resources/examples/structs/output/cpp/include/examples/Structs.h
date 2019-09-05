// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include <cstdint>
namespace examples {
class _GENIUM_CPP_EXPORT Structs {
public:
    Structs();
    virtual ~Structs() = 0;
public:
    struct _GENIUM_CPP_EXPORT SyncResult {
        const uint64_t last_updated_time_stamp;
        const uint32_t number_of_changes;
        SyncResult( const uint64_t last_updated_time_stamp, const uint32_t number_of_changes );
    };
    struct _GENIUM_CPP_EXPORT IdentifiableSyncResult {
        int32_t id;
        ::examples::Structs::SyncResult sync_result;
        IdentifiableSyncResult( const int32_t id, const ::examples::Structs::SyncResult& sync_result );
    };
public:
    static ::examples::Structs::SyncResult method_with_non_nested_type( const ::examples::Structs::SyncResult& input );
    static ::examples::Structs::IdentifiableSyncResult method_with_nested_type( const ::examples::Structs::IdentifiableSyncResult& input );
};
}