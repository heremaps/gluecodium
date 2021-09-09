// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/FieldConstructorsAllDefaults.h"
#include <utility>
namespace smoke {
FieldConstructorsAllDefaults::FieldConstructorsAllDefaults(  ){
}
FieldConstructorsAllDefaults::FieldConstructorsAllDefaults( int32_t int_field )
    : int_field( std::move( int_field ) )
{
}
FieldConstructorsAllDefaults::FieldConstructorsAllDefaults( int32_t int_field, ::std::string string_field )
    : int_field( std::move( int_field ) ), string_field( std::move( string_field ) )
{
}
FieldConstructorsAllDefaults::FieldConstructorsAllDefaults( bool bool_field, int32_t int_field, ::std::string string_field )
    : bool_field( std::move( bool_field ) ), int_field( std::move( int_field ) ), string_field( std::move( string_field ) )
{
}
}
