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
{
}
StructWithDefaults::StructWithDefaults( const int32_t int_field, const uint32_t uint_field, const float float_field, const double double_field, const bool bool_field, const ::std::string& string_field, const ::smoke::SomeEnum enum_field )
    : int_field( int_field ), uint_field( uint_field ), float_field( float_field ), double_field( double_field ), bool_field( bool_field ), string_field( string_field ), enum_field( enum_field )
{
}
ImmutableStructWithDefaults::ImmutableStructWithDefaults( const uint32_t uint_field, const bool bool_field )
    : uint_field( uint_field ), bool_field( bool_field )
{
}
ImmutableStructWithDefaults::ImmutableStructWithDefaults( const int32_t int_field, const uint32_t uint_field, const float float_field, const double double_field, const bool bool_field, const ::std::string& string_field, const ::smoke::SomeEnum enum_field, const ::fire::SomeVeryExternalEnum external_enum_field )
    : int_field( int_field ), uint_field( uint_field ), float_field( float_field ), double_field( double_field ), bool_field( bool_field ), string_field( string_field ), enum_field( enum_field ), external_enum_field( external_enum_field )
{
}
}
namespace genium {
std::size_t
hash< ::smoke::SomeEnum >::operator( )( const ::smoke::SomeEnum& t ) const
{
    return static_cast< std::size_t >( t );
}
}