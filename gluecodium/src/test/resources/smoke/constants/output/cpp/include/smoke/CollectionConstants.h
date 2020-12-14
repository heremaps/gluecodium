// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT CollectionConstants {
public:
    CollectionConstants();
    virtual ~CollectionConstants() = 0;
public:
    _GLUECODIUM_CPP_EXPORT static const ::std::vector< ::std::string > LIST_CONSTANT;
    _GLUECODIUM_CPP_EXPORT static const ::std::unordered_set< ::std::string > SET_CONSTANT;
    _GLUECODIUM_CPP_EXPORT static const ::std::unordered_map< ::std::string, ::std::string > MAP_CONSTANT;
    _GLUECODIUM_CPP_EXPORT static const ::std::unordered_map< ::std::vector< ::std::string >, ::std::unordered_set< ::std::string >, ::gluecodium::hash< ::std::vector< ::std::string > > > MIXED_CONSTANT;
};
}
