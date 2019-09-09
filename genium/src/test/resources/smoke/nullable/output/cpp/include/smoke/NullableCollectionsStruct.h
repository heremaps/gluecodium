// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Optional.h"
#include "genium/UnorderedMapHash.h"
#include "genium/VectorHash.h"
#include "smoke/Nullable.h"
#include <chrono>
#include <cstdint>
#include <unordered_map>
#include <vector>
namespace smoke {
struct _GENIUM_CPP_EXPORT NullableCollectionsStruct {
    ::std::vector< ::genium::optional< ::std::chrono::system_clock::time_point > > dates;
    ::std::unordered_map< int32_t, ::genium::optional< ::smoke::Nullable::SomeStruct > > structs;
    NullableCollectionsStruct( );
    NullableCollectionsStruct( const ::std::vector< ::genium::optional< ::std::chrono::system_clock::time_point > >& dates, const ::std::unordered_map< int32_t, ::genium::optional< ::smoke::Nullable::SomeStruct > >& structs );
};
}
