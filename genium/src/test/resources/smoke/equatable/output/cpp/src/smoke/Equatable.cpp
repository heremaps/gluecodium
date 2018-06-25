// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#include "smoke/Equatable.h"

namespace smoke {

bool EquatableStruct::operator==( const EquatableStruct& rhs ) const
{
    return bool_field == rhs.bool_field &&
        int_field == rhs.int_field &&
        long_field == rhs.long_field &&
        float_field == rhs.float_field &&
        double_field == rhs.double_field &&
        string_field == rhs.string_field &&
        struct_field == rhs.struct_field &&
        enum_field == rhs.enum_field &&
        array_field == rhs.array_field &&
        map_field == rhs.map_field;
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