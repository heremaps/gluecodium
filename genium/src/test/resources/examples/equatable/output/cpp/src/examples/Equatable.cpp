// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#include "examples/Equatable.h"

namespace examples {
EquatableStruct::EquatableStruct( )
    : int_field{ }, string_field{ }, struct_field{ }
{
}
EquatableStruct::EquatableStruct( const int32_t int_field, const ::std::string& string_field, const ::examples::NestedEquatableStruct& struct_field )
    : int_field( int_field ), string_field( string_field ), struct_field( struct_field )
{
}
bool EquatableStruct::operator==( const EquatableStruct& rhs ) const
{
    return int_field == rhs.int_field &&
        string_field == rhs.string_field &&
        struct_field == rhs.struct_field;
}
bool EquatableStruct::operator!=( const EquatableStruct& rhs ) const
{
    return !( *this == rhs );
}
NestedEquatableStruct::NestedEquatableStruct( )
    : foo_field{ }
{
}
NestedEquatableStruct::NestedEquatableStruct( const ::std::string& foo_field )
    : foo_field( foo_field )
{
}
bool NestedEquatableStruct::operator==( const NestedEquatableStruct& rhs ) const
{
    return foo_field == rhs.foo_field;
}
bool NestedEquatableStruct::operator!=( const NestedEquatableStruct& rhs ) const
{
    return !( *this == rhs );
}
}
namespace genium {
std::size_t
hash< ::examples::EquatableStruct >::operator( )( const ::examples::EquatableStruct& t ) const
{
    size_t hash_value = 43;
    hash_value = ( hash_value ^ ::genium::hash< decltype( ::examples::EquatableStruct::int_field ) >( )( t.int_field ) ) << 1;
hash_value = ( hash_value ^ ::genium::hash< decltype( ::examples::EquatableStruct::string_field ) >( )( t.string_field ) ) << 1;
hash_value = ( hash_value ^ ::genium::hash< decltype( ::examples::EquatableStruct::struct_field ) >( )( t.struct_field ) ) << 1;
    return hash_value;
}
std::size_t
hash< ::examples::NestedEquatableStruct >::operator( )( const ::examples::NestedEquatableStruct& t ) const
{
    size_t hash_value = 43;
    hash_value = ( hash_value ^ ::genium::hash< decltype( ::examples::NestedEquatableStruct::foo_field ) >( )( t.foo_field ) ) << 1;
    return hash_value;
}
}