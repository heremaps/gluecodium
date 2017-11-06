// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "smoke/TypeCollection.h"

namespace smoke {

class StructsFromTypeCollection {
public:
static ::smoke::Point create_point( const double x, const double y );
static ::smoke::Point swap_point_coordinates( const ::smoke::Point& input );
static ::smoke::Line create_line( const ::smoke::Point& point_a, const ::smoke::Point& point_b );
static ::smoke::ColoredLine create_colored_line( const ::smoke::Line& line, const ::smoke::Color& color );
static ::smoke::AllTypesStruct modify_all_types_struct( const ::smoke::AllTypesStruct& input );

};

}
