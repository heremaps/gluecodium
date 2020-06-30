// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/DefaultValues.h"
#include <utility>
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
DefaultValues::StructWithDefaults::StructWithDefaults( int32_t int_field, uint32_t uint_field, float float_field, double double_field, bool bool_field, ::std::string string_field, ::smoke::DefaultValues::SomeEnum enum_field, ::fire::SomeVeryExternalEnum external_enum_field )
    : int_field( std::move( int_field ) ), uint_field( std::move( uint_field ) ), float_field( std::move( float_field ) ), double_field( std::move( double_field ) ), bool_field( std::move( bool_field ) ), string_field( std::move( string_field ) ), enum_field( std::move( enum_field ) ), external_enum_field( std::move( external_enum_field ) )
{
}
DefaultValues::NullableStructWithDefaults::NullableStructWithDefaults( )
{
}
DefaultValues::NullableStructWithDefaults::NullableStructWithDefaults( ::gluecodium::optional< int32_t > int_field, ::gluecodium::optional< uint32_t > uint_field, ::gluecodium::optional< float > float_field, ::gluecodium::optional< bool > bool_field, ::gluecodium::optional< ::std::string > string_field, ::gluecodium::optional< ::smoke::DefaultValues::SomeEnum > enum_field )
    : int_field( std::move( int_field ) ), uint_field( std::move( uint_field ) ), float_field( std::move( float_field ) ), bool_field( std::move( bool_field ) ), string_field( std::move( string_field ) ), enum_field( std::move( enum_field ) )
{
}
DefaultValues::StructWithSpecialDefaults::StructWithSpecialDefaults( )
{
}
DefaultValues::StructWithSpecialDefaults::StructWithSpecialDefaults( float float_nan_field, float float_infinity_field, float float_negative_infinity_field, double double_nan_field, double double_infinity_field, double double_negative_infinity_field )
    : float_nan_field( std::move( float_nan_field ) ), float_infinity_field( std::move( float_infinity_field ) ), float_negative_infinity_field( std::move( float_negative_infinity_field ) ), double_nan_field( std::move( double_nan_field ) ), double_infinity_field( std::move( double_infinity_field ) ), double_negative_infinity_field( std::move( double_negative_infinity_field ) )
{
}
DefaultValues::StructWithEmptyDefaults::StructWithEmptyDefaults( )
{
}
DefaultValues::StructWithEmptyDefaults::StructWithEmptyDefaults( ::std::vector< int32_t > ints_field, ::smoke::DefaultValues::FloatArray floats_field, ::smoke::DefaultValues::IdToStringMap map_field, ::smoke::DefaultValues::StructWithDefaults struct_field, ::smoke::DefaultValues::StringSet set_type_field )
    : ints_field( std::move( ints_field ) ), floats_field( std::move( floats_field ) ), map_field( std::move( map_field ) ), struct_field( std::move( struct_field ) ), set_type_field( std::move( set_type_field ) )
{
}
DefaultValues::StructWithTypedefDefaults::StructWithTypedefDefaults( )
{
}
DefaultValues::StructWithTypedefDefaults::StructWithTypedefDefaults( ::smoke::DefaultValues::LongTypedef long_field, ::smoke::DefaultValues::BooleanTypedef bool_field, ::smoke::DefaultValues::StringTypedef string_field, ::smoke::DefaultValues::EnumTypedef enum_field )
    : long_field( std::move( long_field ) ), bool_field( std::move( bool_field ) ), string_field( std::move( string_field ) ), enum_field( std::move( enum_field ) )
{
}
}
