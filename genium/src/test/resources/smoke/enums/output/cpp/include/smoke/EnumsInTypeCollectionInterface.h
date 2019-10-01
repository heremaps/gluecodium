// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "smoke/EnumsInTypeCollection.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT EnumsInTypeCollectionInterface {
public:
    EnumsInTypeCollectionInterface();
    virtual ~EnumsInTypeCollectionInterface() = 0;
public:
    static ::smoke::TCEnum flip_enum_value( const ::smoke::TCEnum input );
};
}