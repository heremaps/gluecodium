// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#include "smoke/Structs.h"
#include <utility>

namespace smoke {
Structs::Structs() {
}
Structs::~Structs() {
}



Structs::Point::Point( )
    : x{ }, y{ }
{
}

Structs::Point::Point( double x, double y )
    : x( std::move( x ) ), y( std::move( y ) )
{
}


Structs::Line::Line( )
    : a{ }, b{ }
{
}

Structs::Line::Line( ::smoke::Structs::Point a, ::smoke::Structs::Point b )
    : a( std::move( a ) ), b( std::move( b ) )
{
}



Structs::AllTypesStruct::AllTypesStruct( int8_t int8_field, uint8_t uint8_field, int16_t int16_field, uint16_t uint16_field, int32_t int32_field, uint32_t uint32_field, int64_t int64_field, uint64_t uint64_field, float float_field, double double_field, ::std::string string_field, bool boolean_field, ::std::shared_ptr< ::std::vector< uint8_t > > bytes_field, ::smoke::Structs::Point point_field )
    : int8_field( std::move( int8_field ) ), uint8_field( std::move( uint8_field ) ), int16_field( std::move( int16_field ) ), uint16_field( std::move( uint16_field ) ), int32_field( std::move( int32_field ) ), uint32_field( std::move( uint32_field ) ), int64_field( std::move( int64_field ) ), uint64_field( std::move( uint64_field ) ), float_field( std::move( float_field ) ), double_field( std::move( double_field ) ), string_field( std::move( string_field ) ), boolean_field( std::move( boolean_field ) ), bytes_field( std::move( bytes_field ) ), point_field( std::move( point_field ) )
{
}



Structs::NestingImmutableStruct::NestingImmutableStruct( ::smoke::Structs::AllTypesStruct struct_field )
    : struct_field( std::move( struct_field ) )
{
}



Structs::DoubleNestingImmutableStruct::DoubleNestingImmutableStruct( ::smoke::Structs::NestingImmutableStruct nesting_struct_field )
    : nesting_struct_field( std::move( nesting_struct_field ) )
{
}


Structs::StructWithArrayOfImmutable::StructWithArrayOfImmutable( )
    : array_field{ }
{
}

Structs::StructWithArrayOfImmutable::StructWithArrayOfImmutable( ::smoke::Structs::ArrayOfImmutable array_field )
    : array_field( std::move( array_field ) )
{
}



Structs::ImmutableStructWithCppAccessors::ImmutableStructWithCppAccessors( int32_t trivial_int_field, double trivial_double_field, ::std::string nontrivial_string_field, ::smoke::Structs::Point nontrivial_point_field )
    : trivial_int_field( std::move( trivial_int_field ) ), trivial_double_field( std::move( trivial_double_field ) ), nontrivial_string_field( std::move( nontrivial_string_field ) ), nontrivial_point_field( std::move( nontrivial_point_field ) )
{
}
Structs::ImmutableStructWithCppAccessors::ImmutableStructWithCppAccessors( int32_t trivial_int_field, double trivial_double_field, ::std::string nontrivial_string_field, ::smoke::Structs::Point nontrivial_point_field, std::optional< ::smoke::Structs::Point > nontrivial_optional_point )
    : trivial_int_field( std::move( trivial_int_field ) ), trivial_double_field( std::move( trivial_double_field ) ), nontrivial_string_field( std::move( nontrivial_string_field ) ), nontrivial_point_field( std::move( nontrivial_point_field ) ), nontrivial_optional_point( std::move( nontrivial_optional_point ) )
{
}


Structs::MutableStructWithCppAccessors::MutableStructWithCppAccessors( )
    : trivial_int_field{ }, trivial_double_field{ }, nontrivial_string_field{ }, nontrivial_point_field{ }
{
}

Structs::MutableStructWithCppAccessors::MutableStructWithCppAccessors( int32_t trivial_int_field, double trivial_double_field, ::std::string nontrivial_string_field, ::smoke::Structs::Point nontrivial_point_field )
    : trivial_int_field( std::move( trivial_int_field ) ), trivial_double_field( std::move( trivial_double_field ) ), nontrivial_string_field( std::move( nontrivial_string_field ) ), nontrivial_point_field( std::move( nontrivial_point_field ) )
{
}
Structs::MutableStructWithCppAccessors::MutableStructWithCppAccessors( int32_t trivial_int_field, double trivial_double_field, ::std::string nontrivial_string_field, ::smoke::Structs::Point nontrivial_point_field, std::optional< ::smoke::Structs::Point > nontrivial_optional_point )
    : trivial_int_field( std::move( trivial_int_field ) ), trivial_double_field( std::move( trivial_double_field ) ), nontrivial_string_field( std::move( nontrivial_string_field ) ), nontrivial_point_field( std::move( nontrivial_point_field ) ), nontrivial_optional_point( std::move( nontrivial_optional_point ) )
{
}


}

