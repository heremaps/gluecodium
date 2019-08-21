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
#include "genium/TypeRepository.h"
#include "genium/UnorderedMapHash.h"
#include "genium/UnorderedSetHash.h"
#include "genium/VectorHash.h"
#include <cstdint>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
namespace smoke {
class _GENIUM_CPP_EXPORT GenericTypesWithBasicTypes {
public:
    GenericTypesWithBasicTypes();
    virtual ~GenericTypesWithBasicTypes() = 0;
public:
using BasicList = ::std::vector< ::std::string >;
using BasicMap = ::std::unordered_map< ::std::string, ::std::string >;
using BasicSet = ::std::unordered_set< ::std::string >;
struct _GENIUM_CPP_EXPORT StructWithGenerics {
    ::std::vector< uint8_t > numbers_list;
    ::std::unordered_map< uint8_t, ::std::string > numbers_map;
    ::std::unordered_set< uint8_t > numbers_set;
    StructWithGenerics( );
    StructWithGenerics( const ::std::vector< uint8_t >& numbers_list, const ::std::unordered_map< uint8_t, ::std::string >& numbers_map, const ::std::unordered_set< uint8_t >& numbers_set );
};
public:
virtual ::std::vector< int32_t > method_with_list( const ::std::vector< int32_t >& input ) = 0;
virtual ::std::unordered_map< int32_t, bool > method_with_map( const ::std::unordered_map< int32_t, bool >& input ) = 0;
virtual ::std::unordered_set< int32_t > method_with_set( const ::std::unordered_set< int32_t >& input ) = 0;
virtual ::smoke::GenericTypesWithBasicTypes::BasicList method_with_list_type_alias( const ::smoke::GenericTypesWithBasicTypes::BasicList& input ) = 0;
virtual ::smoke::GenericTypesWithBasicTypes::BasicMap method_with_map_type_alias( const ::smoke::GenericTypesWithBasicTypes::BasicMap& input ) = 0;
virtual ::smoke::GenericTypesWithBasicTypes::BasicSet method_with_set_type_alias( const ::smoke::GenericTypesWithBasicTypes::BasicSet& input ) = 0;
virtual ::std::vector< float > get_list_property(  ) const = 0;
virtual void set_list_property( const ::std::vector< float >& value ) = 0;
virtual ::std::unordered_map< float, double > get_map_property(  ) const = 0;
virtual void set_map_property( const ::std::unordered_map< float, double >& value ) = 0;
virtual ::std::unordered_set< float > get_set_property(  ) const = 0;
virtual void set_set_property( const ::std::unordered_set< float >& value ) = 0;
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::GenericTypesWithBasicTypes*);
}