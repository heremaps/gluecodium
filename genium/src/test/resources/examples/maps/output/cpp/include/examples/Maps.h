// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/UnorderedMapHash.h"
#include <cstdint>
#include <string>
#include <unordered_map>
namespace examples {
class _GLUECODIUM_CPP_EXPORT Maps {
public:
    Maps();
    virtual ~Maps() = 0;
public:
    using NameMap = ::std::unordered_map< uint64_t, ::std::string >;
public:
    static ::examples::Maps::NameMap map_method( const ::examples::Maps::NameMap& input );
    static ::std::unordered_map< uint64_t, ::std::string > inline_map_method( const ::std::unordered_map< uint64_t, ::std::string >& input );
};
}