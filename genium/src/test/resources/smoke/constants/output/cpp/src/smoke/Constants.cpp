// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#include "smoke/Constants.h"
namespace genium {
}
namespace smoke {
const bool BOOL_CONSTANT = true;
const int32_t INT_CONSTANT = -11;
const uint32_t UINT_CONSTANT = 4294967295;
const float FLOAT_CONSTANT = 2.71f;
const double DOUBLE_CONSTANT = -3.14;
const ::std::string STRING_CONSTANT = "Foo bar";
const ::smoke::StateEnum ENUM_CONSTANT = ::smoke::StateEnum::ON;
}
namespace genium {
std::size_t
hash< ::smoke::StateEnum >::operator( )( const ::smoke::StateEnum& t ) const
{
    return static_cast< std::size_t >( t );
}
}