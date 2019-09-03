// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/Structs.h"
namespace smoke {
Structs::Structs() {
}
Structs::~Structs() {
}
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
static_assert(
    std::is_same<::std::string, decltype(::smoke::Structs::ExternalStruct::stringField)>::value,
    "Expected '::std::string' type for '::smoke::Structs::ExternalStruct::stringField'."
);
static_assert(
    std::is_same<
        ::std::string,
        typename std::result_of<decltype(&::smoke::Structs::ExternalStruct::get_some_string)(::smoke::Structs::ExternalStruct*)>::type
    >::value,
    "Expected '::std::string' return type for '::smoke::Structs::ExternalStruct::get_some_string'."
);
static_assert(
    std::is_same<
        void,
        typename std::result_of<decltype(&::smoke::Structs::ExternalStruct::set_some_string)(::smoke::Structs::ExternalStruct*, const ::std::string&)>::type
    >::value,
    "Expected 'void' return type for '::smoke::Structs::ExternalStruct::set_some_string'."
);
static_assert(
    std::is_same<
        ::std::vector< int8_t >,
        typename std::result_of<decltype(&::smoke::Structs::ExternalStruct::get_some_array)(::smoke::Structs::ExternalStruct*)>::type
    >::value,
    "Expected '::std::vector< int8_t >' return type for '::smoke::Structs::ExternalStruct::get_some_array'."
);
static_assert(
    std::is_same<
        void,
        typename std::result_of<decltype(&::smoke::Structs::ExternalStruct::set_some_array)(::smoke::Structs::ExternalStruct*, const ::std::vector< int8_t >&)>::type
    >::value,
    "Expected 'void' return type for '::smoke::Structs::ExternalStruct::set_some_array'."
);
static_assert(
    std::is_same<
        ::fire::SomeVeryExternalStruct,
        typename std::result_of<decltype(&::smoke::Structs::ExternalStruct::get_some_struct)(::smoke::Structs::ExternalStruct*)>::type
    >::value,
    "Expected '::fire::SomeVeryExternalStruct' return type for '::smoke::Structs::ExternalStruct::get_some_struct'."
);
static_assert(
    std::is_same<
        void,
        typename std::result_of<decltype(&::smoke::Structs::ExternalStruct::set_some_struct)(::smoke::Structs::ExternalStruct*, const ::fire::SomeVeryExternalStruct&)>::type
    >::value,
    "Expected 'void' return type for '::smoke::Structs::ExternalStruct::set_some_struct'."
);
static_assert(
    std::is_same<int8_t, decltype(::fire::SomeVeryExternalStruct::intField)>::value,
    "Expected 'int8_t' type for '::fire::SomeVeryExternalStruct::intField'."
);
static_assert(
    std::is_same<::std::string, decltype(::smoke::Structs::Yet_Another_External_Struct::string_Field)>::value,
    "Expected '::std::string' type for '::smoke::Structs::Yet_Another_External_Struct::string_Field'."
);
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
Structs::ImmutableStructWithCppAccessors::ImmutableStructWithCppAccessors( const ::std::string& string_field )
    : string_field( string_field )
{
}
Structs::MutableStructWithCppAccessors::MutableStructWithCppAccessors( )
    : string_field{ }
{
}
Structs::MutableStructWithCppAccessors::MutableStructWithCppAccessors( const ::std::string& string_field )
    : string_field( string_field )
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
