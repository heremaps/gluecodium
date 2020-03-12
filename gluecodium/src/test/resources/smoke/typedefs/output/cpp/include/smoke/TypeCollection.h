// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <cstdint>
namespace smoke {
using StorageId = uint64_t;
struct _GLUECODIUM_CPP_EXPORT Point {
    double x;
    double y;
    Point( );
    Point( double x, double y );
};
using PointTypeDef = ::smoke::Point;
struct _GLUECODIUM_CPP_EXPORT StructHavingAliasFieldDefinedBelow {
    ::smoke::StorageId field;
    StructHavingAliasFieldDefinedBelow( );
    StructHavingAliasFieldDefinedBelow( ::smoke::StorageId field );
};
_GLUECODIUM_CPP_EXPORT extern const ::smoke::StorageId INVALID_STORAGE_ID;
}
