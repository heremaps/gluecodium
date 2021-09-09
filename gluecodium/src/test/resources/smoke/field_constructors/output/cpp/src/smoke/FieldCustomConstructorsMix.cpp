// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/FieldCustomConstructorsMix.h"
#include <utility>
namespace smoke {
FieldCustomConstructorsMix::FieldCustomConstructorsMix( )
{
}
FieldCustomConstructorsMix::FieldCustomConstructorsMix( int32_t int_field )
    : int_field( std::move( int_field ) )
{
}
FieldCustomConstructorsMix::FieldCustomConstructorsMix( ::std::string string_field, int32_t int_field, bool bool_field )
    : string_field( std::move( string_field ) ), int_field( std::move( int_field ) ), bool_field( std::move( bool_field ) )
{
}
}
