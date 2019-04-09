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
#include <cstdint>
namespace smoke {
using StorageId = uint64_t;
struct _GENIUM_CPP_EXPORT Point {
    double x;
    double y;
    Point( );
    Point( const double x, const double y );
};
using PointTypeDef = ::smoke::Point;
struct _GENIUM_CPP_EXPORT StructHavingAliasFieldDefinedBelow {
    ::smoke::StorageId field;
    StructHavingAliasFieldDefinedBelow( );
    StructHavingAliasFieldDefinedBelow( const ::smoke::StorageId field );
};
_GENIUM_CPP_EXPORT extern const ::smoke::StorageId INVALID_STORAGE_ID;
}
