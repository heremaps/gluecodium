// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/DefaultValues.h"
namespace smoke {
DefaultValues::DefaultValues() {
}
DefaultValues::~DefaultValues() {
}
static_assert(std::is_enum<::fire::SomeVeryExternalEnum>::value, "Expected '::fire::SomeVeryExternalEnum' to be an enumeration'.");
static_assert(
    0 == static_cast<int64_t>(::fire::SomeVeryExternalEnum::One_Value),
    "Expected '0' value for '::fire::SomeVeryExternalEnum::One_Value'."
);
static_assert(
    1 == static_cast<int64_t>(::fire::SomeVeryExternalEnum::Another_Value),
    "Expected '1' value for '::fire::SomeVeryExternalEnum::Another_Value'."
);
DefaultValues::StructWithDefaults::StructWithDefaults( )
{
}
DefaultValues::StructWithDefaults::StructWithDefaults( const int32_t int_field, const uint32_t uint_field, const float float_field, const double double_field, const bool bool_field, const ::std::string& string_field, const ::smoke::DefaultValues::SomeEnum enum_field, const ::fire::SomeVeryExternalEnum external_enum_field )
    : int_field( int_field ), uint_field( uint_field ), float_field( float_field ), double_field( double_field ), bool_field( bool_field ), string_field( string_field ), enum_field( enum_field ), external_enum_field( external_enum_field )
{
}
DefaultValues::NullableStructWithDefaults::NullableStructWithDefaults( )
{
}
DefaultValues::NullableStructWithDefaults::NullableStructWithDefaults( const ::gluecodium::optional< int32_t >& int_field, const ::gluecodium::optional< uint32_t >& uint_field, const ::gluecodium::optional< float >& float_field, const ::gluecodium::optional< bool >& bool_field, const ::gluecodium::optional< ::std::string >& string_field, const ::gluecodium::optional< ::smoke::DefaultValues::SomeEnum >& enum_field )
    : int_field( int_field ), uint_field( uint_field ), float_field( float_field ), bool_field( bool_field ), string_field( string_field ), enum_field( enum_field )
{
}
DefaultValues::StructWithSpecialDefaults::StructWithSpecialDefaults( )
{
}
DefaultValues::StructWithSpecialDefaults::StructWithSpecialDefaults( const float float_nan_field, const float float_infinity_field, const float float_negative_infinity_field, const double double_nan_field, const double double_infinity_field, const double double_negative_infinity_field )
    : float_nan_field( float_nan_field ), float_infinity_field( float_infinity_field ), float_negative_infinity_field( float_negative_infinity_field ), double_nan_field( double_nan_field ), double_infinity_field( double_infinity_field ), double_negative_infinity_field( double_negative_infinity_field )
{
}
DefaultValues::StructWithEmptyDefaults::StructWithEmptyDefaults( )
{
}
DefaultValues::StructWithEmptyDefaults::StructWithEmptyDefaults( const ::std::vector< int32_t >& ints_field, const ::smoke::DefaultValues::FloatArray& floats_field, const ::smoke::DefaultValues::IdToStringMap& map_field, const ::smoke::DefaultValues::StructWithDefaults& struct_field, const ::smoke::DefaultValues::StringSet& set_type_field )
    : ints_field( ints_field ), floats_field( floats_field ), map_field( map_field ), struct_field( struct_field ), set_type_field( set_type_field )
{
}
DefaultValues::StructWithTypedefDefaults::StructWithTypedefDefaults( )
{
}
DefaultValues::StructWithTypedefDefaults::StructWithTypedefDefaults( const ::smoke::DefaultValues::LongTypedef long_field, const ::smoke::DefaultValues::BooleanTypedef bool_field, const ::smoke::DefaultValues::StringTypedef& string_field, const ::smoke::DefaultValues::EnumTypedef enum_field )
    : long_field( long_field ), bool_field( bool_field ), string_field( string_field ), enum_field( enum_field )
{
}
}
namespace gluecodium {
std::size_t
hash< ::smoke::DefaultValues::SomeEnum >::operator( )( const ::smoke::DefaultValues::SomeEnum& t ) const
{
    return static_cast< std::size_t >( t );
}
}
