// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/OuterStruct.h"
#include <utility>
namespace smoke {
OuterStruct::InnerStruct::InnerStruct( )
    : other_field{ }
{
}
OuterStruct::InnerStruct::InnerStruct( ::std::string other_field )
    : other_field( std::move( other_field ) )
{
}
OuterStruct::InnerClass::InnerClass() {
}
OuterStruct::InnerClass::~InnerClass() {
}
OuterStruct::InnerInterface::InnerInterface() {
}
OuterStruct::InnerInterface::~InnerInterface() {
}
OuterStruct::OuterStruct( )
    : field{ }
{
}
OuterStruct::OuterStruct( ::std::string field )
    : field( std::move( field ) )
{
}
}
