// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/EquatableStructWithAccessors.h"
#include <utility>
namespace smoke {
EquatableStructWithAccessors::EquatableStructWithAccessors( )
    : foo_field{ }
{
}
EquatableStructWithAccessors::EquatableStructWithAccessors( ::std::string foo_field )
    : foo_field( std::move( foo_field ) )
{
}
bool EquatableStructWithAccessors::operator==( const EquatableStructWithAccessors& rhs ) const
{
    return foo_field == rhs.foo_field;
}
bool EquatableStructWithAccessors::operator!=( const EquatableStructWithAccessors& rhs ) const
{
    return !( *this == rhs );
}
}
namespace gluecodium {
std::size_t
hash< ::smoke::EquatableStructWithAccessors >::operator( )( const ::smoke::EquatableStructWithAccessors& t ) const
{
    size_t hash_value = 43;
    hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ( ( const ::smoke::EquatableStructWithAccessors* )nullptr )->get_foo_field( ) ) >( )( t.get_foo_field( ) ) ) << 1;
    return hash_value;
}
}
