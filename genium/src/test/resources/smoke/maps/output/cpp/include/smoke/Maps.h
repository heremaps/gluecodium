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
#include "smoke/MapsInstance.h"
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
    class MapsInstance;
}
namespace smoke {
class _GENIUM_CPP_EXPORT Maps {
public:
    virtual ~Maps() = 0;
public:
using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::std::string >;
using SomeId = ::std::string;
using NumberToTypeDef = ::std::unordered_map< uint8_t, ::smoke::Maps::SomeId >;
using TypeDefToNumber = ::std::unordered_map< ::smoke::Maps::SomeId, uint8_t >;
using ArrayOfInts = ::std::vector< int32_t >;
using StringToArray = ::std::unordered_map< ::std::string, ::smoke::Maps::ArrayOfInts >;
using SomeInt = int32_t;
using ArrayOfTypeDefs = ::std::vector< ::smoke::Maps::SomeInt >;
using StringToArrayOfTypeDefs = ::std::unordered_map< ::std::string, ::smoke::Maps::ArrayOfTypeDefs >;
using NumberToInstance = ::std::unordered_map< uint8_t, ::std::shared_ptr< ::smoke::MapsInstance > >;
struct _GENIUM_CPP_EXPORT SomeStruct {
    ::std::string value;
    SomeStruct( );
    SomeStruct( const ::std::string& value );
};
using NumberToStruct = ::std::unordered_map< uint8_t, ::smoke::Maps::SomeStruct >;
using NestedMap = ::std::unordered_map< uint8_t, ::smoke::Maps::NumberToStruct >;
struct _GENIUM_CPP_EXPORT StructWithMap {
    ::smoke::Maps::ErrorCodeToMessageMap error_mapping;
    StructWithMap( );
    StructWithMap( const ::smoke::Maps::ErrorCodeToMessageMap& error_mapping );
};
public:
static ::smoke::Maps::ErrorCodeToMessageMap method_with_map( const ::smoke::Maps::ErrorCodeToMessageMap& input );
static ::smoke::Maps::NumberToStruct method_with_map_to_struct( const ::smoke::Maps::NumberToStruct& input );
static ::smoke::Maps::NestedMap method_with_nested_map( const ::smoke::Maps::NestedMap& input );
static ::smoke::Maps::StructWithMap method_with_struct_with_map( const ::smoke::Maps::StructWithMap& input );
static ::smoke::Maps::StringToArray method_with_map_of_arrays( const ::smoke::Maps::StringToArray& input );
static ::smoke::Maps::NumberToInstance method_with_map_of_instances( const ::smoke::Maps::NumberToInstance& input );
};
}
