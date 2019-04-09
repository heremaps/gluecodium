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
#include "smoke/TypeCollection.h"

namespace smoke {

class _GENIUM_CPP_EXPORT StructsFromTypeCollection {
public:
    virtual ~StructsFromTypeCollection() = 0;
public:
static ::smoke::Point create_point( const double x, const double y );
static ::smoke::Point swap_point_coordinates( const ::smoke::Point& input );
static ::smoke::Line create_line( const ::smoke::Point& point_a, const ::smoke::Point& point_b );
static ::smoke::ColoredLine create_colored_line( const ::smoke::Line& line, const ::smoke::Color& color );
static ::smoke::AllTypesStruct modify_all_types_struct( const ::smoke::AllTypesStruct& input );

};

}
