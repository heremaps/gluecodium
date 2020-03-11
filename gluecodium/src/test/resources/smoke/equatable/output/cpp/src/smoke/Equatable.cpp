// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/Equatable.h"
#include <utility>
namespace smoke {
EquatableStruct::EquatableStruct( )
    : bool_field{ }, int_field{ }, long_field{ }, float_field{ }, double_field{ }, string_field{ }, struct_field{ }, enum_field{ }, array_field{ }, map_field{ }
{
}
EquatableStruct::EquatableStruct( bool bool_field, int32_t int_field, int64_t long_field, float float_field, double double_field, ::std::string string_field, ::smoke::NestedEquatableStruct struct_field, ::smoke::SomeEnum enum_field, ::std::vector< ::std::string > array_field, ::smoke::ErrorCodeToMessageMap map_field )
    : bool_field( std::move( bool_field ) ), int_field( std::move( int_field ) ), long_field( std::move( long_field ) ), float_field( std::move( float_field ) ), double_field( std::move( double_field ) ), string_field( std::move( string_field ) ), struct_field( std::move( struct_field ) ), enum_field( std::move( enum_field ) ), array_field( std::move( array_field ) ), map_field( std::move( map_field ) )
{
}
bool EquatableStruct::operator==( const EquatableStruct& rhs ) const
{
    return bool_field == rhs.bool_field &&
        int_field == rhs.int_field &&
        long_field == rhs.long_field &&
        float_field == rhs.float_field &&
        double_field == rhs.double_field &&
        string_field == rhs.string_field &&
        struct_field == rhs.struct_field &&
        enum_field == rhs.enum_field &&
        array_field == rhs.array_field &&
        map_field == rhs.map_field;
}
bool EquatableStruct::operator!=( const EquatableStruct& rhs ) const
{
    return !( *this == rhs );
}
EquatableNullableStruct::EquatableNullableStruct( )
    : bool_field{ }, int_field{ }, uint_field{ }, float_field{ }, string_field{ }, struct_field{ }, enum_field{ }, array_field{ }, map_field{ }
{
}
EquatableNullableStruct::EquatableNullableStruct( ::gluecodium::optional< bool > bool_field, ::gluecodium::optional< int32_t > int_field, ::gluecodium::optional< uint16_t > uint_field, ::gluecodium::optional< float > float_field, ::gluecodium::optional< ::std::string > string_field, ::gluecodium::optional< ::smoke::NestedEquatableStruct > struct_field, ::gluecodium::optional< ::smoke::SomeEnum > enum_field, ::gluecodium::optional< ::std::vector< ::std::string > > array_field, ::gluecodium::optional< ::smoke::ErrorCodeToMessageMap > map_field )
    : bool_field( std::move( bool_field ) ), int_field( std::move( int_field ) ), uint_field( std::move( uint_field ) ), float_field( std::move( float_field ) ), string_field( std::move( string_field ) ), struct_field( std::move( struct_field ) ), enum_field( std::move( enum_field ) ), array_field( std::move( array_field ) ), map_field( std::move( map_field ) )
{
}
bool EquatableNullableStruct::operator==( const EquatableNullableStruct& rhs ) const
{
    return ( ( bool_field && rhs.bool_field )
            ? ( *bool_field == *rhs.bool_field )
            : ( static_cast< bool >( bool_field ) == static_cast< bool >( rhs.bool_field ) ) ) &&
        ( ( int_field && rhs.int_field )
            ? ( *int_field == *rhs.int_field )
            : ( static_cast< bool >( int_field ) == static_cast< bool >( rhs.int_field ) ) ) &&
        ( ( uint_field && rhs.uint_field )
            ? ( *uint_field == *rhs.uint_field )
            : ( static_cast< bool >( uint_field ) == static_cast< bool >( rhs.uint_field ) ) ) &&
        ( ( float_field && rhs.float_field )
            ? ( *float_field == *rhs.float_field )
            : ( static_cast< bool >( float_field ) == static_cast< bool >( rhs.float_field ) ) ) &&
        ( ( string_field && rhs.string_field )
            ? ( *string_field == *rhs.string_field )
            : ( static_cast< bool >( string_field ) == static_cast< bool >( rhs.string_field ) ) ) &&
        ( ( struct_field && rhs.struct_field )
            ? ( *struct_field == *rhs.struct_field )
            : ( static_cast< bool >( struct_field ) == static_cast< bool >( rhs.struct_field ) ) ) &&
        ( ( enum_field && rhs.enum_field )
            ? ( *enum_field == *rhs.enum_field )
            : ( static_cast< bool >( enum_field ) == static_cast< bool >( rhs.enum_field ) ) ) &&
        ( ( array_field && rhs.array_field )
            ? ( *array_field == *rhs.array_field )
            : ( static_cast< bool >( array_field ) == static_cast< bool >( rhs.array_field ) ) ) &&
        ( ( map_field && rhs.map_field )
            ? ( *map_field == *rhs.map_field )
            : ( static_cast< bool >( map_field ) == static_cast< bool >( rhs.map_field ) ) );
}
bool EquatableNullableStruct::operator!=( const EquatableNullableStruct& rhs ) const
{
    return !( *this == rhs );
}
NestedEquatableStruct::NestedEquatableStruct( )
    : foo_field{ }
{
}
NestedEquatableStruct::NestedEquatableStruct( ::std::string foo_field )
    : foo_field( std::move( foo_field ) )
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
namespace gluecodium {
std::size_t
hash< ::smoke::EquatableStruct >::operator( )( const ::smoke::EquatableStruct& t ) const
{
    size_t hash_value = 43;
    hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableStruct::bool_field ) >( )( t.bool_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableStruct::int_field ) >( )( t.int_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableStruct::long_field ) >( )( t.long_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableStruct::float_field ) >( )( t.float_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableStruct::double_field ) >( )( t.double_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableStruct::string_field ) >( )( t.string_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableStruct::struct_field ) >( )( t.struct_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableStruct::enum_field ) >( )( t.enum_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableStruct::array_field ) >( )( t.array_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableStruct::map_field ) >( )( t.map_field ) ) << 1;
    return hash_value;
}
std::size_t
hash< ::smoke::EquatableNullableStruct >::operator( )( const ::smoke::EquatableNullableStruct& t ) const
{
    size_t hash_value = 43;
    hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableNullableStruct::bool_field ) >( )( t.bool_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableNullableStruct::int_field ) >( )( t.int_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableNullableStruct::uint_field ) >( )( t.uint_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableNullableStruct::float_field ) >( )( t.float_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableNullableStruct::string_field ) >( )( t.string_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableNullableStruct::struct_field ) >( )( t.struct_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableNullableStruct::enum_field ) >( )( t.enum_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableNullableStruct::array_field ) >( )( t.array_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableNullableStruct::map_field ) >( )( t.map_field ) ) << 1;
    return hash_value;
}
std::size_t
hash< ::smoke::NestedEquatableStruct >::operator( )( const ::smoke::NestedEquatableStruct& t ) const
{
    size_t hash_value = 43;
    hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::NestedEquatableStruct::foo_field ) >( )( t.foo_field ) ) << 1;
    return hash_value;
}
}
