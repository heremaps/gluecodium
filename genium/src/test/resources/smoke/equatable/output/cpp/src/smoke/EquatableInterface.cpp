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

EquatableInterface::EquatableStruct::EquatableStruct( )
    : int_field{ }, string_field{ }
{
}

EquatableInterface::EquatableStruct::EquatableStruct( const int32_t int_field, const ::std::string& string_field )
    : int_field( int_field ), string_field( string_field )
{
}

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
