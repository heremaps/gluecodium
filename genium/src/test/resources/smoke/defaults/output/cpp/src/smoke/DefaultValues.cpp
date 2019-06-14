// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#include "smoke/DefaultValues.h"
namespace smoke {
DefaultValues::~DefaultValues() = default;
DefaultValues::StructWithDefaults::StructWithDefaults( ) = default;
DefaultValues::StructWithDefaults::StructWithDefaults( const int32_t int_field, const uint32_t uint_field, const float float_field, const double double_field, const bool bool_field, const ::std::string& string_field, const ::smoke::DefaultValues::SomeEnum enum_field, const ::fire::SomeVeryExternalEnum external_enum_field )
    : int_field( int_field ), uint_field( uint_field ), float_field( float_field ), double_field( double_field ), bool_field( bool_field ), string_field( string_field ), enum_field( enum_field ), external_enum_field( external_enum_field )
{
}
DefaultValues::NullableStructWithDefaults::NullableStructWithDefaults( ) = default;
DefaultValues::NullableStructWithDefaults::NullableStructWithDefaults( const ::genium::optional< int32_t >& int_field, const ::genium::optional< uint32_t >& uint_field, const ::genium::optional< float >& float_field, const ::genium::optional< bool >& bool_field, const ::genium::optional< ::std::string >& string_field, const ::genium::optional< ::smoke::DefaultValues::SomeEnum >& enum_field )
    : int_field( int_field ), uint_field( uint_field ), float_field( float_field ), bool_field( bool_field ), string_field( string_field ), enum_field( enum_field )
{
}
DefaultValues::StructWithSpecialDefaults::StructWithSpecialDefaults( ) = default;
DefaultValues::StructWithSpecialDefaults::StructWithSpecialDefaults( const float float_nan_field, const float float_infinity_field, const float float_negative_infinity_field, const double double_nan_field, const double double_infinity_field, const double double_negative_infinity_field )
    : float_nan_field( float_nan_field ), float_infinity_field( float_infinity_field ), float_negative_infinity_field( float_negative_infinity_field ), double_nan_field( double_nan_field ), double_infinity_field( double_infinity_field ), double_negative_infinity_field( double_negative_infinity_field )
{
}
DefaultValues::StructWithEmptyDefaults::StructWithEmptyDefaults( ) = default;
DefaultValues::StructWithEmptyDefaults::StructWithEmptyDefaults( const ::std::vector< int32_t >& ints_field, const ::smoke::DefaultValues::FloatArray& floats_field, const ::smoke::DefaultValues::IdToStringMap& map_field, const ::smoke::DefaultValues::StructWithDefaults& struct_field )
    : ints_field( ints_field ), floats_field( floats_field ), map_field( map_field ), struct_field( struct_field )
{
}
}