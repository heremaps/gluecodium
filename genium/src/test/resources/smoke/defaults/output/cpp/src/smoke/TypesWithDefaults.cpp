// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#include "smoke/TypesWithDefaults.h"

namespace smoke {

StructWithDefaults::StructWithDefaults( )
    : int_field{ 42 }, uint_field{ 4294967295 }, float_field{ 3.14 }, bool_field{ true }, string_field{ "\\Jonny \"Magic\" Smith\n" }, enum_field{ ::smoke::SomeEnum::BAR_VALUE }
{
}

StructWithDefaults::StructWithDefaults( const int32_t int_field, const uint32_t uint_field, const float float_field, const bool bool_field, const ::std::string& string_field, const ::smoke::SomeEnum enum_field )
    : int_field( int_field ), uint_field( uint_field ), float_field( float_field ), bool_field( bool_field ), string_field( string_field ), enum_field( enum_field )
{
}

ImmutableStructWithDefaults::ImmutableStructWithDefaults( )
    : int_field{ 42 }, uint_field{ }, float_field{ 3.14 }, bool_field{ }, string_field{ "\\Jonny \"Magic\" Smith\n" }, enum_field{ ::smoke::SomeEnum::BAR_VALUE }, external_enum_field{ ::fire::SomeVeryExternalEnum::Another_Value }
{
}

ImmutableStructWithDefaults::ImmutableStructWithDefaults( const int32_t int_field, const uint32_t uint_field, const float float_field, const bool bool_field, const ::std::string& string_field, const ::smoke::SomeEnum enum_field, const ::fire::SomeVeryExternalEnum external_enum_field )
    : int_field( int_field ), uint_field( uint_field ), float_field( float_field ), bool_field( bool_field ), string_field( string_field ), enum_field( enum_field ), external_enum_field( external_enum_field )
{
}

}
