// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Optional.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Nullable.h"
#include <chrono>
#include <cstdint>
#include <unordered_map>
#include <vector>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT NullableCollectionsStruct {
    ::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > > dates;
    ::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > > structs;
    NullableCollectionsStruct( );
    NullableCollectionsStruct( const ::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >& dates, const ::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >& structs );
};
}
