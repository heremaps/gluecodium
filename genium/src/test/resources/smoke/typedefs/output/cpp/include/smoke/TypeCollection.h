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
};
using PointTypeDef = ::smoke::Point;

using StorageId = uint64_t;
static const ::smoke::StorageId INVALID_STORAGE_ID = 0;

struct StructHavingAliasFieldDefinedBelow {
    ::smoke::StorageId field;
};
}
