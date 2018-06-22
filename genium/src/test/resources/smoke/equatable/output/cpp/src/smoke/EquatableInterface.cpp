// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#include "smoke/EquatableInterface.h"

namespace smoke {

EquatableInterface::~EquatableInterface() = default;

bool EquatableInterface::EquatableStruct::operator==( const EquatableStruct& rhs ) const
{
    return int_field == rhs.int_field &&
        string_field == rhs.string_field;
}

bool EquatableInterface::EquatableStruct::operator!=( const EquatableStruct& rhs ) const
{
    return !( *this == rhs );
}

}
