// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/LevelOne.h"
namespace smoke {
LevelOne::LevelOne() {
}
LevelOne::~LevelOne() {
}
LevelOne::LevelTwo::LevelTwo() {
}
LevelOne::LevelTwo::~LevelTwo() {
}
LevelOne::LevelTwo::LevelThree::LevelThree() {
}
LevelOne::LevelTwo::LevelThree::~LevelThree() {
}
const bool LevelOne::LevelTwo::LevelThree::LevelFour::FOO = false;
LevelOne::LevelTwo::LevelThree::LevelFour::LevelFour( )
    : string_field{ }
{
}
LevelOne::LevelTwo::LevelThree::LevelFour::LevelFour( const ::std::string& string_field )
    : string_field( string_field )
{
}
}
namespace genium {
std::size_t
hash< ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum >::operator( )( const ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum& t ) const
{
    return static_cast< std::size_t >( t );
}
}
