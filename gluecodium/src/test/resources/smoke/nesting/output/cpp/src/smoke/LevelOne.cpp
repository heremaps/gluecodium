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
