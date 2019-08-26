// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#include "smoke/StructConstants.h"
namespace smoke {
StructConstants::StructConstants() {
}
StructConstants::~StructConstants() {
}
StructConstants::SomeStruct::SomeStruct( )
    : string_field{ }, float_field{ }
{
}
StructConstants::SomeStruct::SomeStruct( const ::std::string& string_field, const float float_field )
    : string_field( string_field ), float_field( float_field )
{
}
StructConstants::NestingStruct::NestingStruct( )
    : struct_field{ }
{
}
StructConstants::NestingStruct::NestingStruct( const ::smoke::StructConstants::SomeStruct& struct_field )
    : struct_field( struct_field )
{
}
const ::smoke::StructConstants::SomeStruct StructConstants::STRUCT_CONSTANT = {"bar Buzz", 1.41f};
const ::smoke::StructConstants::NestingStruct StructConstants::NESTING_STRUCT_CONSTANT = {{"nonsense", -2.82f}};
}
