// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Hash.h"
#include "genium/UnorderedMapHash.h"
#include "genium/VectorHash.h"
#include "smoke/MapsInstance.h"
#include "smoke/PointerEquatableInstance.h"
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
    class MapsInstance;
}
namespace smoke {
    class PointerEquatableInstance;
}
namespace smoke {
class _GENIUM_CPP_EXPORT Maps {
public:
    virtual ~Maps() = 0;
public:
using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::std::string >;
using SomeId = ::std::string;
using NumberToTypeDef = ::std::unordered_map< uint8_t, ::smoke::Maps::SomeId >;
using TypeDefToNumber = ::std::unordered_map< ::smoke::Maps::SomeId, uint8_t, ::genium::hash< ::smoke::Maps::SomeId > >;
using ArrayOfInts = ::std::vector< int32_t >;
using StringToArray = ::std::unordered_map< ::std::string, ::smoke::Maps::ArrayOfInts >;
using SomeInt = int32_t;
using ArrayOfTypeDefs = ::std::vector< ::smoke::Maps::SomeInt >;
using StringToArrayOfTypeDefs = ::std::unordered_map< ::std::string, ::smoke::Maps::ArrayOfTypeDefs >;
using NumberToInstance = ::std::unordered_map< uint8_t, ::std::shared_ptr< ::smoke::MapsInstance > >;
using EquatableClassToString = ::std::unordered_map< ::std::shared_ptr< ::smoke::MapsInstance >, ::std::string, ::genium::hash< ::std::shared_ptr< ::smoke::MapsInstance > > >;
using PointerEquatableClassToString = ::std::unordered_map< ::std::shared_ptr< ::smoke::PointerEquatableInstance >, ::std::string, ::genium::hash< ::std::shared_ptr< ::smoke::PointerEquatableInstance > > >;
struct _GENIUM_CPP_EXPORT SomeStruct {
    ::std::string value;
    SomeStruct( );
    SomeStruct( const ::std::string& value );
    bool operator==( const SomeStruct& rhs ) const;
    bool operator!=( const SomeStruct& rhs ) const;
};
using NumberToStruct = ::std::unordered_map< uint8_t, ::smoke::Maps::SomeStruct >;
using NestedMap = ::std::unordered_map< uint8_t, ::smoke::Maps::NumberToStruct >;
using StructToString = ::std::unordered_map< ::smoke::Maps::SomeStruct, ::std::string, ::genium::hash< ::smoke::Maps::SomeStruct > >;
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
static ::smoke::Maps::StructToString method_with_struct_to_string_map( const ::smoke::Maps::StructToString& input );
static ::smoke::Maps::EquatableClassToString method_with_equatable_class_to_string_map( const ::smoke::Maps::EquatableClassToString& input );
static ::smoke::Maps::PointerEquatableClassToString method_with_pointer_equatable_class_to_string( const ::smoke::Maps::PointerEquatableClassToString& input );
};
}
namespace genium {
template<>
struct hash< ::smoke::Maps::SomeStruct > {
    std::size_t operator( )( const ::smoke::Maps::SomeStruct& t ) const;
};
}