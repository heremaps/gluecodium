// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT TypeCollection {
    struct _GLUECODIUM_CPP_EXPORT Point {
        double x;
        double y;
        Point( );
        Point( double x, double y );
    };
    using PointTypeDef = ::smoke::TypeCollection::Point;
    using StorageId = uint64_t;
    struct _GLUECODIUM_CPP_EXPORT StructHavingAliasFieldDefinedBelow {
        ::smoke::TypeCollection::StorageId field;
        StructHavingAliasFieldDefinedBelow( );
        explicit StructHavingAliasFieldDefinedBelow( ::smoke::TypeCollection::StorageId field );
    };
    static const ::smoke::TypeCollection::StorageId INVALID_STORAGE_ID;
};
}
