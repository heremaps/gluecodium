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
OuterStruct::InnerStruct::InnerStruct( ::std::vector< ::std::chrono::system_clock::time_point > other_field )
    : other_field( std::move( other_field ) )
{
}
OuterStruct::InnerClass::InnerClass() {
}
OuterStruct::InnerClass::~InnerClass() {
}
OuterStruct::Builder::Builder() {
}
OuterStruct::Builder::~Builder() {
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
