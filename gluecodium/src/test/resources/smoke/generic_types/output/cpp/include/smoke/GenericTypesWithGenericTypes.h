// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT GenericTypesWithGenericTypes {
public:
    GenericTypesWithGenericTypes();
    virtual ~GenericTypesWithGenericTypes();


public:
    virtual ::std::vector< ::std::vector< int32_t > > method_with_list_of_lists( const ::std::vector< ::std::vector< int32_t > >& input ) = 0;
    virtual ::std::unordered_map< ::std::unordered_map< int32_t, bool >, bool, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > > method_with_map_of_maps( const ::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >& input ) = 0;
    virtual ::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > > method_with_set_of_sets( const ::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >& input ) = 0;
    virtual ::std::unordered_map< int32_t, ::std::vector< int32_t > > method_with_list_and_map( const ::std::vector< ::std::unordered_map< int32_t, bool > >& input ) = 0;
    virtual ::std::unordered_set< ::std::vector< int32_t >, ::gluecodium::hash< ::std::vector< int32_t > > > method_with_list_and_set( const ::std::vector< ::std::unordered_set< int32_t > >& input ) = 0;
    virtual ::std::unordered_set< ::std::unordered_map< int32_t, bool >, ::gluecodium::hash< ::std::unordered_map< int32_t, bool > > > method_with_map_and_set( const ::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >& input ) = 0;
    virtual ::std::unordered_map< ::std::vector< int32_t >, bool, ::gluecodium::hash< ::std::vector< int32_t > > > method_with_map_generic_keys( const ::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >& input ) = 0;
};


}
