// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#include "smoke/Structs.h"
namespace smoke {
Structs::~Structs() = default;
Structs::Point::Point( )
    : x{ }, y{ }
{
}
Structs::Point::Point( const double x, const double y )
    : x( x ), y( y )
{
}
Structs::Line::Line( )
    : a{ }, b{ }
{
}
Structs::Line::Line( const ::smoke::Structs::Point& a, const ::smoke::Structs::Point& b )
    : a( a ), b( b )
{
}
Structs::AllTypesStruct::AllTypesStruct( const int8_t int8_field, const uint8_t uint8_field, const int16_t int16_field, const uint16_t uint16_field, const int32_t int32_field, const uint32_t uint32_field, const int64_t int64_field, const uint64_t uint64_field, const float float_field, const double double_field, const ::std::string& string_field, const bool boolean_field, const ::std::shared_ptr< ::std::vector< uint8_t > >& bytes_field, const ::smoke::Structs::Point& point_field )
    : int8_field( int8_field ), uint8_field( uint8_field ), int16_field( int16_field ), uint16_field( uint16_field ), int32_field( int32_field ), uint32_field( uint32_field ), int64_field( int64_field ), uint64_field( uint64_field ), float_field( float_field ), double_field( double_field ), string_field( string_field ), boolean_field( boolean_field ), bytes_field( bytes_field ), point_field( point_field )
{
}
Structs::NestingImmutableStruct::NestingImmutableStruct( const ::smoke::Structs::AllTypesStruct& struct_field )
    : struct_field( struct_field )
{
}
Structs::DoubleNestingImmutableStruct::DoubleNestingImmutableStruct( const ::smoke::Structs::NestingImmutableStruct& nesting_struct_field )
    : nesting_struct_field( nesting_struct_field )
{
}
Structs::StructWithArrayOfImmutable::StructWithArrayOfImmutable( const ::smoke::Structs::ArrayOfImmutable& array_field )
    : array_field( array_field )
{
}
}
namespace genium {
std::size_t
hash< ::smoke::Structs::FooBar >::operator( )( const ::smoke::Structs::FooBar& t ) const
{
    return static_cast< std::size_t >( t );
}
}
