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

EquatableStruct::EquatableStruct( )
    : bool_field{ }, int_field{ }, long_field{ }, float_field{ }, double_field{ }, string_field{ }, struct_field{ }, enum_field{ }, array_field{ }, map_field{ }
{
}

EquatableStruct::EquatableStruct( const bool bool_field, const int32_t int_field, const int64_t long_field, const float float_field, const double double_field, const ::std::string& string_field, const ::smoke::NestedEquatableStruct& struct_field, const ::smoke::SomeEnum enum_field, const ::std::vector< ::std::string >& array_field, const ::smoke::ErrorCodeToMessageMap& map_field )
    : bool_field( bool_field ), int_field( int_field ), long_field( long_field ), float_field( float_field ), double_field( double_field ), string_field( string_field ), struct_field( struct_field ), enum_field( enum_field ), array_field( array_field ), map_field( map_field )
{
}

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

NestedEquatableStruct::NestedEquatableStruct( )
    : foo_field{ }
{
}

NestedEquatableStruct::NestedEquatableStruct( const ::std::string& foo_field )
    : foo_field( foo_field )
{
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