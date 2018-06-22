// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#include "examples/Equatable.h"

namespace examples {

bool EquatableStruct::operator==( const EquatableStruct& rhs ) const
{
    return int_field == rhs.int_field &&
        string_field == rhs.string_field &&
        struct_field == rhs.struct_field;
}

bool EquatableStruct::operator!=( const EquatableStruct& rhs ) const
{
    return !( *this == rhs );
}

bool NestedEquatableStruct::operator==( const NestedEquatableStruct& rhs ) const
{
    return foo_field == rhs.foo_field;
}

bool NestedEquatableStruct::operator!=( const NestedEquatableStruct& rhs ) const
{
    return !( *this == rhs );
}

}
