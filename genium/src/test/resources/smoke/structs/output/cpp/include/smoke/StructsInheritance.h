// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "smoke/Structs.h"
#include "smoke/TypeCollection.h"

namespace smoke {

class StructsInheritance {
public:
    virtual ~StructsInheritance() = 0;
public:
struct ColoredLineInherited: public ::smoke::Structs::Line {
    ::smoke::Color color;
    ColoredLineInherited( );
    ColoredLineInherited( const ::smoke::Structs::Point& a, const ::smoke::Structs::Point& b, const ::smoke::Color& color );
};

public:
static ::smoke::StructsInheritance::ColoredLineInherited method_with_inherited_type( const ::smoke::StructsInheritance::ColoredLineInherited& input );

};

}
