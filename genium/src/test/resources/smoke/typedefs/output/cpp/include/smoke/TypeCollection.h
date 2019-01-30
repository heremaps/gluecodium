// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "Export.h"
#include <cstdint>


namespace smoke {

struct _GENIUM_CPP_EXPORT Point {
    double x;
    double y;
    Point( );
    Point( const double x, const double y );
};
using PointTypeDef = ::smoke::Point;

using StorageId = uint64_t;
_GENIUM_CPP_EXPORT extern const ::smoke::StorageId INVALID_STORAGE_ID;

struct _GENIUM_CPP_EXPORT StructHavingAliasFieldDefinedBelow {
    ::smoke::StorageId field;
    StructHavingAliasFieldDefinedBelow( );
    StructHavingAliasFieldDefinedBelow( const ::smoke::StorageId field );
};
}
