// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/EnumsInTypeCollection.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT EnumsInTypeCollectionInterface {
public:
    EnumsInTypeCollectionInterface();
    virtual ~EnumsInTypeCollectionInterface() = 0;
public:
    static ::smoke::EnumsInTypeCollection::TCEnum flip_enum_value( const ::smoke::EnumsInTypeCollection::TCEnum input );
};
}
