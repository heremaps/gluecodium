// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#include "examples/Constants.h"
namespace genium {
}
namespace examples {
const bool BOOL_CONSTANT = true;
const int32_t INT_CONSTANT = 42;
const float FLOAT_CONSTANT = 3.14f;
const ::std::string STRING_CONSTANT = "Foo bar";
const ::examples::StateEnum ENUM_CONSTANT = ::examples::StateEnum::ON;
}
namespace genium {
std::size_t
hash< ::examples::StateEnum >::operator( )( const ::examples::StateEnum& t ) const
{
    return static_cast< std::size_t >( t );
}
}