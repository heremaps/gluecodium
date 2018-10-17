// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <cstdint>


namespace smoke {

struct Point {
    double x;
    double y;
    Point( );
    Point( const double x, const double y );
};
using PointTypeDef = ::smoke::Point;

using StorageId = uint64_t;
extern const ::smoke::StorageId INVALID_STORAGE_ID;

struct StructHavingAliasFieldDefinedBelow {
    ::smoke::StorageId field;
    StructHavingAliasFieldDefinedBelow( );
    StructHavingAliasFieldDefinedBelow( const ::smoke::StorageId field );
};
}
