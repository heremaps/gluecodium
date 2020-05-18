// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/StructConstants.h"
#include <utility>
namespace smoke {
StructConstants::StructConstants() {
}
StructConstants::~StructConstants() {
}
StructConstants::SomeStruct::SomeStruct( )
    : string_field{ }, float_field{ }
{
}
StructConstants::SomeStruct::SomeStruct( ::std::string string_field, float float_field )
    : string_field( std::move( string_field ) ), float_field( std::move( float_field ) )
{
}
StructConstants::NestingStruct::NestingStruct( )
    : struct_field{ }
{
}
StructConstants::NestingStruct::NestingStruct( ::smoke::StructConstants::SomeStruct struct_field )
    : struct_field( std::move( struct_field ) )
{
}
const ::smoke::StructConstants::SomeStruct StructConstants::STRUCT_CONSTANT = {"bar Buzz", 1.41f};
const ::smoke::StructConstants::NestingStruct StructConstants::NESTING_STRUCT_CONSTANT = {{"nonsense", -2.82f}};
}
