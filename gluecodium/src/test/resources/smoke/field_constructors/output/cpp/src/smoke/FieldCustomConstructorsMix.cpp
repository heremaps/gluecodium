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
}
