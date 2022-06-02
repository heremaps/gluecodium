// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "fire/Enum1.h"
#include "fire/Enum2.h"
#include "fire/Enum3.h"
#include "fire/Enum4.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Hash.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <unordered_map>
#include <unordered_set>
#include <vector>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT EnumCollectionDefaults {
    ::std::vector< ::fire::Enum1 > list_field = {::fire::Enum1::DISABLED};
    ::std::unordered_set< ::fire::Enum2, ::gluecodium::hash< ::fire::Enum2 > > set_field = {::fire::Enum2::DISABLED};
    ::std::unordered_map< ::fire::Enum3, ::fire::Enum4, ::gluecodium::hash< ::fire::Enum3 > > map_field = {{::fire::Enum3::DISABLED, ::fire::Enum4::DISABLED}};
    EnumCollectionDefaults( );
    EnumCollectionDefaults( ::std::vector< ::fire::Enum1 > list_field, ::std::unordered_set< ::fire::Enum2, ::gluecodium::hash< ::fire::Enum2 > > set_field, ::std::unordered_map< ::fire::Enum3, ::fire::Enum4, ::gluecodium::hash< ::fire::Enum3 > > map_field );
};
}
