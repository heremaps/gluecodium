// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/TypesWithDefaults.h"
#include <utility>
namespace smoke {
StructWithDefaults::StructWithDefaults( )
{
}
StructWithDefaults::StructWithDefaults( int32_t int_field, uint32_t uint_field, float float_field, double double_field, bool bool_field, ::std::string string_field, ::smoke::SomeEnum enum_field )
    : int_field( std::move( int_field ) ), uint_field( std::move( uint_field ) ), float_field( std::move( float_field ) ), double_field( std::move( double_field ) ), bool_field( std::move( bool_field ) ), string_field( std::move( string_field ) ), enum_field( std::move( enum_field ) )
{
}
ImmutableStructWithDefaults::ImmutableStructWithDefaults( uint32_t uint_field, bool bool_field )
    : uint_field( std::move( uint_field ) ), bool_field( std::move( bool_field ) )
{
}
ImmutableStructWithDefaults::ImmutableStructWithDefaults( int32_t int_field, uint32_t uint_field, float float_field, double double_field, bool bool_field, ::std::string string_field, ::smoke::SomeEnum enum_field, ::fire::SomeVeryExternalEnum external_enum_field )
    : int_field( std::move( int_field ) ), uint_field( std::move( uint_field ) ), float_field( std::move( float_field ) ), double_field( std::move( double_field ) ), bool_field( std::move( bool_field ) ), string_field( std::move( string_field ) ), enum_field( std::move( enum_field ) ), external_enum_field( std::move( external_enum_field ) )
{
}
StructWithAnEnum::StructWithAnEnum( )
{
}
StructWithAnEnum::StructWithAnEnum( ::smoke::AnEnum config )
    : config( std::move( config ) )
{
}
}
