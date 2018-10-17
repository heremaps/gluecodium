// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#include "smoke/StructsInheritance.h"

namespace smoke {

StructsInheritance::~StructsInheritance() = default;

StructsInheritance::ColoredLineInherited::ColoredLineInherited( ) = default;

StructsInheritance::ColoredLineInherited::ColoredLineInherited( const ::smoke::Structs::Point& a, const ::smoke::Structs::Point& b, const ::smoke::Color& color )
    : ::smoke::Structs::Line( a, b ), color( color )
{
}

}