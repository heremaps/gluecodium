// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/LevelOne.h"
#include <utility>
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
LevelOne::LevelTwo::LevelThree::LevelFour::LevelFour( ::std::string string_field )
    : string_field( std::move( string_field ) )
{
}
}
