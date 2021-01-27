// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/StructWithEnums.h"
#include <utility>
namespace smoke {
const ::smoke::SomethingEnum StructWithEnums::FIRST_CONSTANT = ::smoke::SomethingEnum::REALLY_FIRST;
StructWithEnums::StructWithEnums( )
{
}
StructWithEnums::StructWithEnums( ::smoke::SomethingEnum first_field, ::smoke::SomethingEnum explicit_field, ::smoke::SomethingEnum last_field )
    : first_field( std::move( first_field ) ), explicit_field( std::move( explicit_field ) ), last_field( std::move( last_field ) )
{
}
}
