// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/EnumHash.h"
#include "genium/Export.h"
#include "genium/Optional.h"
#include <cstdint>
#include <string>
#include <unordered_set>
namespace smoke {
class _GENIUM_CPP_EXPORT SetType {
public:
    virtual ~SetType() = 0;
public:
enum class SomeEnum {
    OFF,
    ON
};
using IntSet = ::std::unordered_set< int32_t >;
using StringSet = ::std::unordered_set< ::std::string >;
using EnumSet = ::std::unordered_set< ::smoke::SetType::SomeEnum, ::genium::EnumHash >;
public:
static ::smoke::SetType::StringSet string_set_round_trip( const ::smoke::SetType::StringSet& input );
static ::smoke::SetType::EnumSet enum_set_round_trip( const ::smoke::SetType::EnumSet& input );
static ::genium::optional< ::smoke::SetType::IntSet > nullable_int_set_round_trip( const ::genium::optional< ::smoke::SetType::IntSet >& input );
};
}
