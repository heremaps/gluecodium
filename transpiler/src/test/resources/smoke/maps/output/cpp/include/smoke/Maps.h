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
#include <string>
#include <unordered_map>

namespace smoke {

class Maps {
public:
    virtual ~Maps() = 0;
public:
using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::std::string >;
using SomeId = ::std::string;
using NumberToTypeDef = ::std::unordered_map< uint8_t, ::smoke::Maps::SomeId >;
using TypeDefToNumber = ::std::unordered_map< ::smoke::Maps::SomeId, uint8_t >;

struct SomeStruct {
    ::std::string value;
};

using NumberToStruct = ::std::unordered_map< uint8_t, ::smoke::Maps::SomeStruct >;
using NestedMap = ::std::unordered_map< uint8_t, ::smoke::Maps::NumberToStruct >;

struct StructWithMap {
    ::smoke::Maps::ErrorCodeToMessageMap error_mapping;
};

public:
static ::smoke::Maps::ErrorCodeToMessageMap method_with_map( const ::smoke::Maps::ErrorCodeToMessageMap& input );
static ::smoke::Maps::NumberToStruct method_with_map_to_struct( const ::smoke::Maps::NumberToStruct& input );
static ::smoke::Maps::NestedMap method_with_nested_map( const ::smoke::Maps::NestedMap& input );
static ::smoke::Maps::StructWithMap method_with_struct_with_map( const ::smoke::Maps::StructWithMap& input );
};
}