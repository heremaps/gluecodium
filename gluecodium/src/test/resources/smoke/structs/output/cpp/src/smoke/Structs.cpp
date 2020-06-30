// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "non/Sense.h"
#include "smoke/Structs.h"
#include <type_traits>
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
static_assert(
    std::is_same<::std::string, decltype(::smoke::Structs::ExternalStruct::stringField)>::value,
    "Expected '::std::string' type for '::smoke::Structs::ExternalStruct::stringField'."
);
static_assert(
    std::is_same<
        ::std::string,
        std::remove_cv<std::remove_reference<decltype(((const ::smoke::Structs::ExternalStruct*)nullptr)->get_some_string())>::type>::type
    >::value,
    "Expected '::std::string' return type for '::smoke::Structs::ExternalStruct::get_some_string'."
);
static_assert(
    std::is_same<
        void,
        decltype(((::smoke::Structs::ExternalStruct*)nullptr)->set_some_string(*((::std::string*)nullptr)))
    >::value,
    "Expected 'void' return type for '::smoke::Structs::ExternalStruct::set_some_string'."
);
static_assert(
    std::is_same<
        ::std::vector< int8_t >,
        std::remove_cv<std::remove_reference<decltype(((const ::smoke::Structs::ExternalStruct*)nullptr)->get_some_array())>::type>::type
    >::value,
    "Expected '::std::vector< int8_t >' return type for '::smoke::Structs::ExternalStruct::get_some_array'."
);
static_assert(
    std::is_same<
        void,
        decltype(((::smoke::Structs::ExternalStruct*)nullptr)->set_some_array(*((::std::vector< int8_t >*)nullptr)))
    >::value,
    "Expected 'void' return type for '::smoke::Structs::ExternalStruct::set_some_array'."
);
static_assert(
    std::is_same<
        ::fire::SomeVeryExternalStruct,
        std::remove_cv<std::remove_reference<decltype(((const ::smoke::Structs::ExternalStruct*)nullptr)->get_some_struct())>::type>::type
    >::value,
    "Expected '::fire::SomeVeryExternalStruct' return type for '::smoke::Structs::ExternalStruct::get_some_struct'."
);
static_assert(
    std::is_same<
        void,
        decltype(((::smoke::Structs::ExternalStruct*)nullptr)->set_some_struct(*((::fire::SomeVeryExternalStruct*)nullptr)))
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
Structs::NestingImmutableStruct::NestingImmutableStruct( ::smoke::Structs::AllTypesStruct struct_field )
    : struct_field( std::move( struct_field ) )
{
}
Structs::DoubleNestingImmutableStruct::DoubleNestingImmutableStruct( ::smoke::Structs::NestingImmutableStruct nesting_struct_field )
    : nesting_struct_field( std::move( nesting_struct_field ) )
{
}
Structs::StructWithArrayOfImmutable::StructWithArrayOfImmutable( ::smoke::Structs::ArrayOfImmutable array_field )
    : array_field( std::move( array_field ) )
{
}
Structs::ImmutableStructWithCppAccessors::ImmutableStructWithCppAccessors( ::std::string string_field )
    : string_field( std::move( string_field ) )
{
}
Structs::MutableStructWithCppAccessors::MutableStructWithCppAccessors( )
    : string_field{ }
{
}
Structs::MutableStructWithCppAccessors::MutableStructWithCppAccessors( ::std::string string_field )
    : string_field( std::move( string_field ) )
{
}
}
