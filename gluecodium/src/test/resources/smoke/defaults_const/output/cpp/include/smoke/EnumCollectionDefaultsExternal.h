// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "foo/AlienEnum1.h"
#include "foo/AlienEnum2.h"
#include "foo/AlienEnum3.h"
#include "foo/AlienEnum4.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Hash.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <unordered_map>
#include <unordered_set>
#include <vector>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT EnumCollectionDefaultsExternal {
    ::std::vector< foo::AlienEnum1 > list_field = {foo::AlienEnum1::DISABLED};
    ::std::unordered_set< foo::AlienEnum2, ::gluecodium::hash< foo::AlienEnum2 > > set_field = {foo::AlienEnum2::DISABLED};
    ::std::unordered_map< foo::AlienEnum3, foo::AlienEnum4, ::gluecodium::hash< foo::AlienEnum3 > > map_field = {{foo::AlienEnum3::DISABLED, foo::AlienEnum4::DISABLED}};
    EnumCollectionDefaultsExternal( );
    EnumCollectionDefaultsExternal( ::std::vector< foo::AlienEnum1 > list_field, ::std::unordered_set< foo::AlienEnum2, ::gluecodium::hash< foo::AlienEnum2 > > set_field, ::std::unordered_map< foo::AlienEnum3, foo::AlienEnum4, ::gluecodium::hash< foo::AlienEnum3 > > map_field );
};
}
