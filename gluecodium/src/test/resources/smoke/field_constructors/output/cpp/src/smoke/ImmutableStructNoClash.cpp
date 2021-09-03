// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/ImmutableStructNoClash.h"
#include <utility>
namespace smoke {
ImmutableStructNoClash::ImmutableStructNoClash(  ){
}
ImmutableStructNoClash::ImmutableStructNoClash( ::std::string string_field, int32_t int_field, bool bool_field )
    : string_field( std::move( string_field ) ), int_field( std::move( int_field ) ), bool_field( std::move( bool_field ) )
{
}
}
