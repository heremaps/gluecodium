// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/ImmutableStructWithClash.h"
#include <utility>
namespace smoke {
ImmutableStructWithClash::ImmutableStructWithClash(  ){
}
ImmutableStructWithClash::ImmutableStructWithClash( bool bool_field, int32_t int_field, ::std::string string_field )
    : bool_field( std::move( bool_field ) ), int_field( std::move( int_field ) ), string_field( std::move( string_field ) )
{
}
}
