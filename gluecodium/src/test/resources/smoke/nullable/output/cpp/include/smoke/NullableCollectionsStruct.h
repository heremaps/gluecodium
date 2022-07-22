// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TimePointHash.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Nullable.h"
#include <chrono>
#include <cstdint>
#include <optional>
#include <unordered_map>
#include <vector>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT NullableCollectionsStruct {
    ::std::vector< std::optional< ::std::chrono::system_clock::time_point > > dates;
    ::std::unordered_map< int32_t, std::optional< ::smoke::Nullable::SomeStruct > > structs;
    NullableCollectionsStruct( );
    NullableCollectionsStruct( ::std::vector< std::optional< ::std::chrono::system_clock::time_point > > dates, ::std::unordered_map< int32_t, std::optional< ::smoke::Nullable::SomeStruct > > structs );
};
}
